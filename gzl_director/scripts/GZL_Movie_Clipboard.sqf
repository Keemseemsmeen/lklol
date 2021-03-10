//============================================================================================================================================
//============================================================================================================================================
private["_cam","_movieName"];
// diag_log "========== Movie Clipboard ==========";
//============================================================================================================================================
// Init variables
//============================================================================================================================================
_sleepTime = 0.01;
_veh = objNull;
_movie = [];
_lastVehicle = objNull;
_cx = 0, _cy = 0; _cz = 0;
_targetSet = false;
//============================================================================================================================================
//Get Movie Name from list box selection
//============================================================================================================================================
disableserialization;
_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_MOVIE_LST_MOVIES;
_index = lbSelection _ctrl;
_movieName = lbText [GZL_IDC_MOVIE_LST_MOVIES, (_index select 0)];
copyToClipboard "//=================================================="; sleep _sleepTime;
copyToClipboard format["// Movie: %1",_movieName]; sleep _sleepTime;
copyToClipboard "//=================================================="; sleep _sleepTime;

copyToClipboard "_cam = 'camera' camCreate [0,0,0];"; sleep _sleepTime;
copyToClipboard "_cam cameraEffect ['INTERNAL', 'BACK'];"; sleep _sleepTime;

//============================================================================================================================================
//============================================================================================================================================
{
	_name = (_x select 0);	
	if (_movieName == _name ) exitWith {_movie = (_x select 1);};
}forEach GZL_MOVIES;

_sceneStart = _movie select 0;
if (!(_sceneStart select 3)) then {	_targetSet = true;};


//============================================================================================================================================
//============================================================================================================================================

{
	copyToClipboard "//=================================================="; sleep _sleepTime;
	copyToClipboard format["// %1",(_x select 0)]; sleep _sleepTime;
	copyToClipboard "//=================================================="; sleep _sleepTime;
	
	_veh = [_x select 2] call GZL_fnc_GetSubject;
// if this is a new subject set the duration to 0 to prevent camera moving from old position
	if (_lastVehicle != _veh ) then {
		_lastVehicle = _veh;
		if (!(_x select 10)) then {_x set [1, 0];};
	};
	
	
		if (_x select 3) then {			
			_targetSet = true;
			_cx = (position _veh select 0) + (_x select 4) * cos(_x select 5);
			_cy = (position _veh select 1) + (_x select 4) * sin(_x select 5);
			_cz = (getPosASL _veh select 2) + (_x select 6);	
			copyToClipboard format["_cam camPrepareTarget [%1,%2,%3];",position _veh select 0,position _veh select 1,position _veh select 2]; sleep _sleepTime;
			}
		else {
			if (_targetSet) then {
				_cam cameraEffect ["TERMINATE", "BACK"];
				camDestroy _cam;
				_cam = "camera" camCreate [_cx,_cy,_cz];
				_cam cameraEffect ["INTERNAL", "BACK"];							
				_targetSet = false;
			};
			_cx = (position _veh select 0) + (_x select 4);
			_cy = (position _veh select 1) + (_x select 5);
			_cz = (getPosASL _veh select 2) + (_x select 6);			
			_dir = _x select 7;
			//if (_dir < 0 ) then {_dir = 360 + _dir;};
			copyToClipboard format["_cam setDir %1;",_dir]; sleep _sleepTime;
		};

		_asl = (getPosASL _veh select 2) - ( position _veh select 2);
		copyToClipboard format["_cam camPreparePos [%1,%2,%3];",_cx, _cy, (_cz - _asl)]; sleep _sleepTime;
		copyToClipboard format["_cam camPrepareFOV %1;",(_x select 8)]; sleep _sleepTime;
		
	// if a script exists execute it
		if ((_x select 9) != "") then {copyToClipboard format["_result = execVM '%1';",(_x select 9)];sleep _sleepTime;};
		
		
		if ((_x select 0) == "Scene1")
		then {copyToClipboard "_cam camCommitPrepared 0;";} 
		else {copyToClipboard format["_cam camCommitPrepared %1;",(_x select 1)]; sleep _sleepTime;
			if ( (_x select 1) > 0) then {copyToClipboard format["sleep %1;",(_x select 1)];};};
		sleep _sleepTime;
		
	// if a fade cut or text cut exists execute it
		if ((_x select 11) != "[NONE]") then {
			_num = parseNumber (_x select 13);
			copyToClipboard format["cutText ['%1','%2',%3];",(_x select 12), (_x select 11), _num];
			sleep _sleepTime;
			copyToClipboard format["sleep %1;", _num];
			sleep _sleepTime;};
		

}forEach _movie;
copyToClipboard "//=================================================="; sleep _sleepTime;
copyToClipboard "// End"; sleep _sleepTime;
copyToClipboard "//=================================================="; sleep _sleepTime;
copyToClipboard "_cam cameraEffect ['TERMINATE', 'BACK'];"; sleep _sleepTime;
copyToClipboard "camDestroy _cam;"; sleep _sleepTime;
copyToClipboard "endMission 'END1';"; sleep _sleepTime;
copyToClipboard "//COMPLETE";

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