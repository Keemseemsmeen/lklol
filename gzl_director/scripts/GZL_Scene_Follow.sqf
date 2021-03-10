//============================================================================================================================================
//
//============================================================================================================================================
private["_cam","_vehicle","_step","_altitude","_dist","_camFOV"];
private["_angle","_relPos"];
//============================================================================================================================================
//  Assign Parameters
//============================================================================================================================================
_cam = _this select 0;
_vehicle = _this select 1;
_step = _this select 2;
_altitude = _this select 3;
_dist = _this select 4;
_camFOV = _this select 5;
_eventA = _vehicle addEventHandler ["IncomingMissile", { ["INCOMING", _this] spawn GZL_SCENE_MISSILE; }];
_eventB = _vehicle addEventHandler ["Fired", { ["FIRED", _this] spawn GZL_SCENE_MISSILE; }];
//============================================================================================================================================
// Init Variables
//============================================================================================================================================
_angle = random 360;
_relPos = [ _dist * cos(_angle), _dist * sin(_angle), _altitude];
//============================================================================================================================================
// Setup Camera
//============================================================================================================================================	 
if ( vehicle _vehicle != _vehicle ) then { _vehicle = vehicle _vehicle; };
_cam camSetTarget _vehicle;		
_cam camSetRelPos _relPos;
_cam camSetFOV _camFOV;
_cam cameraEffect ["INTERNAL", "BACK"];
//============================================================================================================================================
// Main Loop
//============================================================================================================================================
 while { !GZL_SCENE_STOP } do {
	
	if ( GZL_MISSILE_ACTIVE ) then {
		GZL_SCENE_EXTEND = true;
		waituntil {!GZL_MISSILE_ACTIVE};
		GZL_SCENE_EXTEND = false;};	

//check to see if the unit has entered a vehicle
	if ( vehicle _vehicle != _vehicle )	then {
		_vehicle removeEventHandler ["IncomingMissile",_eventA];
		_vehicle removeEventHandler ["Fired", _eventB];		
		_vehicle = vehicle _vehicle;			
		_cam camSetTarget _vehicle;
	};
	_cam camSetRelPos _relPos;
	_cam camCommit 0;	
	
	sleep GZL_SLEEP * GZL_ACCTIME;
	GZL_SCENE_ACTIVE = true;
};
//============================================================================================================================================
// Cleanup
//============================================================================================================================================
_vehicle removeEventHandler ["IncomingMissile",_eventA];
_vehicle removeEventHandler ["Fired", _eventB];
//============================================================================================================================================
//============================================================================================================================================
//  _result = [_cam,_camTarget] call GZL_fnc_GetDirTo; 
