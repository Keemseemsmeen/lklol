//============================================================================================================================================
//
//============================================================================================================================================
private["_cam","_vehicle","_step","_altitude","_dist","_camFOV"];
private["_camTarget","_iterator","_switchDir","_angle","_targetPos"];
private["_x","_y","_z","_cx","_cy","_cz","_cAngle","_startAngle"];
//============================================================================================================================================
//  Assign Parameters
//============================================================================================================================================
_cam = _this select 0;
_vehicle = _this select 1;
_step = _this select 2;
_altitude = _this select 3;
_dist = _this select 4;
_camFOV = _this select 5;
//============================================================================================================================================
// Init Variables
//============================================================================================================================================
_camTarget = objNull;
_groupTarget = createGroup sideLogic;
_camTarget = _groupTarget createUnit ["Logic", (position _vehicle), [], 0, "NONE"];
_iterator = 0;
_switchDir = round(random 1);
_angle = 0;
_targetPos = [];
_cx = (position _vehicle select 0) + _dist;
_cy = (position _vehicle select 1) + _dist;
_cz = (position _vehicle select 2) + _altitude;
_cAngle = 0;
//============================================================================================================================================
// Setup Camera
//============================================================================================================================================
//_camTarget = "HeliHEmpty" createVehicle (position _vehicle);
_cam camSetTarget _camTarget;
_cam camSetPos [_cx,_cy,_cz];
_cam camSetFOV _camFOV;
_cam cameraEffect ["INTERNAL", "BACK"];
_cam camCommit 0;
_startAngle = [_cam,_vehicle] call GZL_fnc_GetDirTo;
//============================================================================================================================================
// Main Loop
//============================================================================================================================================
while { !GZL_SCENE_STOP } do {
	
	_iterator = _iterator + 1;
	_angle = _startAngle + (_iterator * _step);
	
	if ( _switchDir == 0 )
	then { _targetPos = [_cx + _dist * cos(_angle), _cy + _dist * sin(_angle), _cz ];}
	else { _targetPos = [_cx + _dist * cos(_angle), _cy - _dist  * sin(_angle), _cz ];};		

	_camTarget setPos _targetPos;		

	sleep GZL_SLEEP * GZL_ACCTIME;
	GZL_SCENE_ACTIVE = true;
};

//============================================================================================================================================
// Cleanup
//============================================================================================================================================
_cam camSetTarget objNull;
_cam camCommit 0;
deleteVehicle _camTarget;
deleteGroup _groupTarget;

//============================================================================================================================================
//_cAngle = [_cam,_vehicle] call GZL_fnc_GetDirTo;
//if ( (_cAngle - _angle) < 0 ) then {_switchDir = 0;} else { _switchDir = 1;};	
//============================================================================================================================================
