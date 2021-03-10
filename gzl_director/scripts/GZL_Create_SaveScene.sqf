//============================================================================================================================================
//============================================================================================================================================
private["_sceneName","_scene","_num","_pos","_tmp","_index"];
_sceneName = _this select 0;
_scene = objNull;
_index = 0;
_match = false;

//============================================================================================================================================
//============================================================================================================================================
// diag_log "========== Saving Scene ==========";
// diag_log "Before:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];
//============================================================================================================================================
//============================================================================================================================================
if (_sceneName == "[New]") then {	
	_num = count GZL_MOVIE_DATA;
	_sceneName = format["Scene%1",_num+1];
	_tmp = + GZL_SCENE_DATA;
	_tmp set [0, _sceneName];
	_tmp set [1, GZL_SCENE_LENGTH];
	GZL_MOVIE_DATA = GZL_MOVIE_DATA + [_tmp];
	_index = lbAdd [GZL_IDC_CREATE_LST_SCENES, _sceneName];}
else {	
// look for an existing scene with the same name 
	{
		if ( (_x select 0) == _sceneName) exitWith {_match = true; _scene = _x;};
		_index = _index + 1;
	}forEach GZL_MOVIE_DATA;

//  if we found a match update existing movie with new movie data
	if (_match) then {
		
		_scene set [0, (GZL_SCENE_DATA select 0)];
		_scene set [1, (GZL_SCENE_DATA select 1)];
		_scene set [2, (GZL_SCENE_DATA select 2)];
		_scene set [3, (GZL_SCENE_DATA select 3)];
		_scene set [4, (GZL_SCENE_DATA select 4)];
		_scene set [5, (GZL_SCENE_DATA select 5)];
		_scene set [6, (GZL_SCENE_DATA select 6)];
		_scene set [7, (GZL_SCENE_DATA select 7)];
		_scene set [8, (GZL_SCENE_DATA select 8)];
		_scene set [9, (GZL_SCENE_DATA select 9)];
		_scene set [10, (GZL_SCENE_DATA select 10)];
		[-1] call GZL_Create_SetCut;
		_scene set [11, (GZL_SCENE_DATA select 11)];
		_scene set [12, (GZL_SCENE_DATA select 12)];
		_scene set [13, (GZL_SCENE_DATA select 13)];
		//diag_log _index;
		GZL_MOVIE_DATA set [_index,_scene];};
};
call GZL_Create_UpdateUI;
//_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CUT_LST_CUTS;
//_ctrl lbSetSelected [0,true];
//ctrlSetText [GZL_IDC_CUT_TXT_TEXT, ""];
//ctrlSetText [GZL_IDC_CUT_DUR, "0"];
//============================================================================================================================================
//============================================================================================================================================
// diag_log "After:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];

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
// smoothMove 10
// cutType	11
// cutText	12
// cutDur		13