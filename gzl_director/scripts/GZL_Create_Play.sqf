//============================================================================================================================================
//============================================================================================================================================
private["_cam","_movieName"];
// diag_log "========== Start Play ==========";
disableserialization;
_cam = _this select 0;
_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_LST_SCENES;
_index = lbSelection _ctrl;
_movieName = lbText [GZL_IDC_LST_SCENES, (_index select 0)];
_vehicle = objNull;
_movie = [];
_lastVehicle = objNull;
_cx = 0, _cy = 0; _cz = 0;
_targetSet = false;
GZL_SCENE_EXTEND = true;
closeDialog GZL_IDD_DLG_DIRECTOR;
//============================================================================================================================================
//============================================================================================================================================
{
	_name = (_x select 0);	
	if (_movieName == _name ) exitWith {_movie = (_x select 1);};
}forEach GZL_MOVIES;

_sceneStart = _movie select 0;
if (!(_sceneStart select 3)) then {	_targetSet = true;};

_cam cameraEffect ["INTERNAL", "BACK"]; 
//============================================================================================================================================
//============================================================================================================================================

while { !GZL_SCENE_STOP } do {
	{

		_vehicle = [_x select 2] call GZL_fnc_GetSubject;
	// if this is a new subject set the duration to 0 to prevent camera moving from old position
		if (_lastVehicle != _vehicle ) then {
			_lastVehicle = _vehicle;
			if (!(_x select 10)) then {_x set [1, 0];};
		};
		
		//if (!isNull _vehicle) then {
		
			if (_x select 3) then {			
				_targetSet = true;
				_cx = (position _vehicle select 0) + (_x select 4) * cos(_x select 5);
				_cy = (position _vehicle select 1) + (_x select 4) * sin(_x select 5);
				_cz = (getPosASL _vehicle select 2) + (_x select 6);	
				_cam camPrepareTarget _vehicle;}
			else {
				if (_targetSet) then {
					_cam cameraEffect ["TERMINATE", "BACK"];
					camDestroy _cam;
					_cam = "camera" camCreate [_cx,_cy,_cz];
					_cam cameraEffect ["INTERNAL", "BACK"];							
					_targetSet = false;
				};
				_cx = (position _vehicle select 0) + (_x select 4);
				_cy = (position _vehicle select 1) + (_x select 5);
				_cz = (getPosASL _vehicle select 2) + (_x select 6);			
				_dir = _x select 7;
				//if (_dir < 0 ) then {_dir = 360 + _dir;};
				_cam setDir (_dir);
			};

			_asl = (getPosASL _vehicle select 2) - ( position _vehicle select 2);
			_cam camPreparePos [_cx, _cy-0.1, (_cz - _asl)];
			_cam camPrepareFOV (_x select 8);
			
		// if a script exists execute it
			if ((_x select 9) != "") then {
				_script = format["%1",_x select 9];
				_result = execVM _script;};

		// for the first scene set the duration to 0 regardless of use entered value
			if ((_x select 0) == "Scene1")
			then {_cam camCommitPrepared 0;}
			else {_cam camCommitPrepared (_x select 1); sleep (_x select 1);};		
		//};	
		GZL_SCENE_ACTIVE = true;
		if ((GZL_SCENE_STOP) || (GZL_SCENE_SKIP)) exitWith{};
		// if a fade cut or text cut exists execute it
			if ((_x select 11) != "[NONE]") then {
				_num = parseNumber (_x select 13);
				cutText[_x select 12, _x select 11, _num];
				sleep _num};
				
	}forEach _movie;
};
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