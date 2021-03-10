//============================================================================================================================================
//
//============================================================================================================================================
// Private Vars
//============================================================================================================================================
private["_cam","_vehicle","_step","_altitude","_dist","_camFOV"];
private["_result","_effect","_lastScene","_stopTime","_motion","_numEffects"];
//============================================================================================================================================
// Initialize Vars
//============================================================================================================================================
_scene = 0;
_dist = 60;
_altitude = 20;
_camFOV = 1.0;
_stopTime = 0;
_result = nil;
_cam = objNull;
_vehicle = objNull;
_vol = soundVolume;
_lastScene = -1;
_activeScenes = 0;
_typeSwitch = 0;
_minDist = 0;
_cutText = "";
_musicPlaying = false;
_scene = 0;
enableRadio false;
showHUD false;
showCinemaBorder false;
GZL_SLEEP = GZL_SLEEP * GZL_ACCTIME;
//============================================================================================================================================
// Main Loop
//============================================================================================================================================
while {true} do {	
	GZL_DIRECTOR_ACTIVE = true;			
	sleep 0.01 * GZL_ACCTIME;//GZL_SLEEP * GZL_ACCTIME;
	
	_vehicle = GZL_SUBJECT select 0;
	
//adjust sleep based on FPS value
	//GZL_SLEEP = (diag_fps / GZL_THROTTLE);
	if ( GZL_SLEEP < 0.001 ) then { GZL_SLEEP = 0.001};
	
// if the vehicle is null stop the current scene
	if ( isNull _vehicle ) then { GZL_SUBJECT_HOLD = false;	GZL_SCENE_SKIP = true;};
	
//check to see if user wants to skip current scene	
	if ( GZL_SCENE_SKIP ) then { _stopTime = 0; GZL_SCENE_EXTEND = false; };

//check timeout and scene extended	
	if ((time >= _stopTime) && ( !GZL_SCENE_EXTEND )) then {

	//lower sound volume
		0 fadeSound 0;
	// fade between scenes if enabled	
		if (GZL_SCENE_FADE) then { cutText ["","BLACK OUT",0.1]; sleep 0.1;}; 
	
	//if we need a new subject, get one
		if ( !GZL_SUBJECT_HOLD )  then {
			_vehicle = [GZL_SUBJECTS, GZL_SUBJECT_BIAS] call GZL_fnc_GetRandomSubject;
		//in case we didn't find a man or vehicle return the player				
			if ( isNull _vehicle ) then { _vehicle = GZL_PLAYER;};
			GZL_SUBJECT set [0,_vehicle];
			if (player != GZL_PLAYER) then { selectPlayer GZL_PLAYER;};
		};
		[GZL_IDD_DLG_DIRECTOR, GZL_IDC_LST_VEHICLES, _vehicle] spawn GZL_fnc_SetSubject;		
		_minDist = sizeOf (typeOf _vehicle);
	//if the subject is a man and is not inside a vehicle set a closer distance.	
		if ( (_vehicle isKindOf "MAN") && ( vehicle _vehicle == _vehicle) )
		then { _dist = (random 2) + _minDist; _altitude = (random 0.9) + 0.7;}
		else { _dist = (random 10) + _minDist;	_altitude = (random _dist/3) + 2;};

	// now that we have a subject, select a random scene
		
		_getScenes = [GZL_IDD_DLG_DIRECTOR, GZL_IDC_LST_SCENES] call GZL_fnc_SetScenes;		
		if ((count _getScenes) > 0) then {GZL_SCENE_MASK = _getScenes};
		
		_activeScenes = 0;
		{ if (_x) then { _activeScenes = _activeScenes + 1;}; } forEach GZL_SCENE_MASK;
		if (_activeScenes == 1) then
		{
			for [{_scene = 0},{_scene < count GZL_SCENE_MASK},{_scene = _scene + 1}]
			do { if (GZL_SCENE_MASK select _scene) exitWith {};};}
		else
		{
			while { true } do {
				_scene = floor(random (count GZL_SCENE_MASK));
				if ( (GZL_SCENE_MASK select _scene)  && (_scene != _lastScene) ) exitWith {};
				//if (GZL_SCENE_MASK select _scene) exitWith {};
			};
		};		
		_lastScene = _scene;		

	// if a view script is running, stop it	
		if ( !isNil "_result" ) then {GZL_SCENE_STOP = true; waitUntil {scriptDone _result};};
		GZL_SCENE_STOP = false;

	// force these in case there is an error in the script
		GZL_SCENE_ACTIVE = false;
		GZL_CREATE_ACTIVE = false;

	//if the cam wasn't already destroyed, destroy it.  Works best this way as I had lots of issues with repeatedly using a single cam.
		if ( !isNull _cam ) then {camDestroy _cam; };
		_cam = "camera" camCreate (position _vehicle);

	//preload camera if enabled
		switch (GZL_CAM_PRELOAD) do {
			case 0 : { };
			case 1 : {_done = [] spawn { waituntil { preloadCamera position _vehicle }}; };
			case 2 : {_timeOut = time + (2 * GZL_ACCTIME);
				while { _timeOut > time } do { waituntil { preloadCamera position _vehicle }; if (true) exitWith{};};};
			case 3 : {waituntil { preloadCamera position _vehicle };};
		};
		_camFOV = 0.2 + random 0.7;
		_step = GZL_CAM_STEP + (random 3) * (GZL_SLEEP * acctime);		

	//call the appropriate scene script
		switch (_scene) do {
			case 0: {_cutText = "Create"; _result = [_cam, GZL_SCENE_DATA] spawn GZL_Create_Scene;};
			case 1: {_cutText = "Stationary Pan"; _result = [_cam,_vehicle,_step,_altitude,_dist,_camFOV] spawn GZL_Scene_Pan;};
			case 2: {_cutText = "Orbit Subject"; _result = [_cam,_vehicle,_step,_altitude,_dist,_camFOV] spawn GZL_Scene_Orbit;};
			case 3: {_cutText = "Follow Subject"; _result = [_cam,_vehicle,_step,_altitude,_dist,_camFOV] spawn GZL_Scene_Follow;};
			case 4: {_cutText = "Fly By/Through"; _result = [_cam,_vehicle,_step,_altitude,_dist,_camFOV] spawn GZL_Scene_Fly;};
			case 5: {_cutText = "First Person"; _result = [_cam,_vehicle] spawn GZL_Scene_First;};
			default {_cutText = "Play"; _result = [_cam] spawn GZL_Create_Play;};			
		};	
	//wait until the scene is active before moving on	
		waitUntil {	GZL_SCENE_ACTIVE };			

	// always cut plain in case the scene was faded when the user disabled the feature
		if ( GZL_SCENE_FADE ) then { cutText ["","BLACK IN", 0];} else { cutText ["","PLAIN", 0]; };
		if ( GZL_DEBUG_SCENE_NAME ) then { cutText [_cutText,"PLAIN DOWN",0]; };
		0 fadeSound _vol;
		
	// set the timeout for this loop
		if (GZL_SCENE_LENGTH < 0) then { GZL_SCENE_LENGTH = 0};
		if (GZL_SCENE_LENGTH == 0) then { GZL_SCENE_EXTEND = true; };
		_stopTime = time + GZL_SCENE_LENGTH;
	
	// set skip false to prevent skipping a new scene if the user hit skip while we were busy setting up a new scene
		GZL_SCENE_SKIP = false;			
	};

//============================================================================================================================================
//  Cleanup and exit
//============================================================================================================================================
	if ( GZL_DIRECTOR_EXIT ) exitWith {
		0 fadeMusic 0;
		GZL_SCENE_STOP = true;
		waitUntil { scriptDone _result };
		GZL_SCENE_STOP = false;
		GZL_SCENE_ACTIVE = false;
		GZL_SCENE_SKIP = false;
		GZL_SCENE_HOLD = false;
		GZL_CREATE_ACTIVE = false;
		_vehicle = objNull;
		selectPlayer GZL_PLAYER;
		if (!isNull _cam) then {_cam cameraEffect ["TERMINATE", "BACK"];camDestroy _cam;};
		ctrlEnable [GZL_IDC_BTN_ACTION, true];
		ctrlEnable [GZL_IDC_BTN_CUT, false];
		enableRadio true;
		showHUD true;
		GZL_DIRECTOR_EXIT = false;
	};
};
GZL_DIRECTOR_ACTIVE = false;
//============================================================================================================================================
//============================================================================================================================================

