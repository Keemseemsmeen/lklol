//============================================================================================================================================
//
//============================================================================================================================================
private["_cam","_vehicle","_step","_altitude","_dist","_camFOV"];
private["_angle","_relPos"];
//============================================================================================================================================
//  Assign Parameters
//============================================================================================================================================
_cam = _this select 0;
//_vehicle = _this select 1;
_sceneData = _this select 1;
//disableSerialization;
//============================================================================================================================================
// Init Variables
//============================================================================================================================================
GZL_CREATE_ACTIVE = true;
[] spawn GZL_Dialog_Create;
GZL_SCENE_EXTEND = true; // create mode does not timeout
closeDialog GZL_IDD_DLG_DIRECTOR;
_targetSet = false;
_lastVehicle = objNull;
//============================================================================================================================================
// Setup Camera
//============================================================================================================================================	 
//_groupTarget = createGroup sideLogic;
//_camTarget = _groupTarget createUnit ["Logic", (position _vehicle), [], 0, "NONE"];
_cam cameraEffect ["INTERNAL", "BACK"];
_cx = 0; _cy = 0; _cz = 0;
//============================================================================================================================================
// Main Loop
//============================================================================================================================================
 while { !GZL_SCENE_STOP } do {

	_vehicle = GZL_SUBJECT select 0;
	
	if (_lastVehicle != _vehicle ) then {
		_lastVehicle = _vehicle;
		GZL_SCENE_DATA set [2, _vehicle];
		_size = sizeOf (typeOf _vehicle);
		GZL_SCENE_DATA set [4, _size];
		GZL_SCENE_DATA set [5, 0];
		GZL_SCENE_DATA set [6, (_size / 2)];
	};
	
	if (GZL_SCENE_DATA select 3) then {	
		_targetSet = true;		
 		_cx = (position _vehicle select 0) + (GZL_SCENE_DATA select 4) * cos(GZL_SCENE_DATA select 5);
		_cy = (position _vehicle select 1) + (GZL_SCENE_DATA select 4) * sin(GZL_SCENE_DATA select 5);
		_cz = (getPosASL _vehicle select 2) + (GZL_SCENE_DATA select 6);
		_cam camSetTarget _vehicle;
		_cam setPosASL [_cx,_cy,_cz];}
	else {	
		if (_targetSet) then {			
			GZL_SCENE_DATA set [7, (getDir _cam)];
			call GZL_Create_UpdateUI;
			_cam cameraEffect ["TERMINATE", "BACK"];
			camDestroy _cam;
			_cam = "camera" camCreate [_cx,_cy,_cz];
			_cam cameraEffect ["INTERNAL", "BACK"];
			_targetSet = false;
		};
		_cx = (position _vehicle select 0) + (GZL_SCENE_DATA select 4);
		_cy = (position _vehicle select 1) + (GZL_SCENE_DATA select 5);
		_cz = (getPosASL _vehicle select 2) + (GZL_SCENE_DATA select 6);
		_cam setPosASL [_cx,_cy,_cz];		
		_cam setDir (GZL_SCENE_DATA select 7);		
	};	
	_cam camSetFOV (GZL_SCENE_DATA select 8);	
	_cam camCommit 0;	
	
	sleep GZL_SLEEP * GZL_ACCTIME;

	//diag_log format["_sceneData: %1", _sceneData];
	GZL_SCENE_ACTIVE = true;

};
//============================================================================================================================================
// Cleanup
//============================================================================================================================================
_cam cameraEffect ["TERMINATE", "BACK"];
camDestroy _cam;
GZL_CREATE_ACTIVE = false;
GZL_SCENE_EXTEND = false;
//============================================================================================================================================
//============================================================================================================================================
// GZL_SCENE_DATA
// scenename	0
// duration 	1
// vehicle		2
// setTarget	3
// dist 		4
// angle		5
// height		6
// dir		7
// fov		8
// scriptName	9




// if (_targetSet) then {
			
			
			// _cam cameraEffect ["TERMINATE", "BACK"];
			// camDestroy _cam;
			// _cam = "camera" camCreate _targetPos;
			// _cam cameraEffect ["INTERNAL", "BACK"];
			// _cam camCommand "MANUAL ON";
			// _cam camCommand "INERTIA OFF";
			// //_cam attachTo [_camTarget, [0,0,0]];
			// _targetSet = false;
		// };
//_cam setDir (_sceneData select 8);
// if (_sceneData select 5) then {			
		// _freeTarget = false;
		// _cx = (position _vehicle select 0) + (_sceneData select 6) * cos(_sceneData select 8);
		// _cy = (position _vehicle select 1) + (_sceneData select 6) * sin(_sceneData select 8);
		// _cz = (position _vehicle select 2) + (_sceneData select 7);		
		// _cam camSetTarget _vehicle;
		// _cam camSetPos [_cx,_cy,_cz];}
	// else {
		// if (!_freeTarget) then{
			// _freeTarget = true;
			// camDestroy _cam;
			// _cam = "camera" camCreate position _vehicle;
			// _cam cameraEffect ["INTERNAL", "BACK"];};
		// _cx = (position _vehicle select 0) + (_sceneData select 6);
		// _cy = (position _vehicle select 1) + (_sceneData select 6);
		// _cz = (position _vehicle select 2) + (_sceneData select 7);
		// //_camTarget setPos [_cx,_cy,_cz];
		// //_cam camSetTarget [_cx,_cy,_cz];
		// _cam setDir (_sceneData select 8);
		// _cam camSetDive (_sceneData select 9);
		// _cam camSetPos [_cx, _cy, _cz];
	// };

	

		// _cx = (position _vehicle select 0) + (_sceneData select 6) * cos(_sceneData select 8);
	// _cy = (position _vehicle select 1) + (_sceneData select 6) * sin(_sceneData select 8);
	// _cz = (position _vehicle select 2) + (_sceneData select 7);	
	
	// if (_sceneData select 5) then {
			// _targetSet = true;
			// _cam camSetTarget (_vehicle);}
	// else {
		// if ( _targetSet ) then {
			// _cam cameraEffect ["TERMINATE", "BACK"];
			// camDestroy _cam;
			// _cam = "camera" camCreate _targetPos; 
			// _cam cameraEffect ["INTERNAL", "BACK"];
			// _targetSet = false;
		// };			
		// _cam setDir (_sceneData select 8);
	// };
	
	// _cam camSetFOV (_sceneData select 10);	
	// _cam camSetPos [_cx,_cy,_cz];
	// _cam camCommit 0;