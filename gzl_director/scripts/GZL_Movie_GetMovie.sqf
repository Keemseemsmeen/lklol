//============================================================================================================================================
//============================================================================================================================================
private["_title","_movie","_match","_tmp"];
_index = _this select 0;
// diag_log "========== GetMovie ==========";
// diag_log "Before:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];

//============================================================================================================================================
//============================================================================================================================================
ctrlSetText [GZL_IDC_MOVIE_TXT_TITLE, ((GZL_MOVIES select _value) select 0)];
_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_MOVIE_LST_MOVIES;
_ctrl lbSetSelected [_index, true];
//============================================================================================================================================
//============================================================================================================================================
_movieData = ((GZL_MOVIES select _index) select 1);
//============================================================================================================================================
//============================================================================================================================================
if ((count _movieData) > 0) then {
	GZL_MOVIE_DATA = + _movieData;
	_scene = GZL_MOVIE_DATA select 0;
	GZL_SCENE_DATA set [0, (_scene select 0)];
	GZL_SCENE_DATA set [1, (_scene select 1)];
	GZL_SCENE_DATA set [2, ([_scene select 2] call GZL_fnc_GetSubject)];
	GZL_SCENE_DATA set [3, (_scene select 3)];
	GZL_SCENE_DATA set [4, (_scene select 4)];
	GZL_SCENE_DATA set [5, (_scene select 5)];
	GZL_SCENE_DATA set [6, (_scene select 6)];
	GZL_SCENE_DATA set [7, (_scene select 7)];
	GZL_SCENE_DATA set [8, (_scene select 8)];
	GZL_SCENE_DATA set [9, (_scene select 9)];
	GZL_SUBJECT set [0, (GZL_SCENE_DATA select 2)];
	lbClear GZL_IDC_CREATE_LST_SCENES;
	_index = lbAdd [GZL_IDC_CREATE_LST_SCENES, "[New]"];
	{_index = lbAdd [GZL_IDC_CREATE_LST_SCENES, _x select 0];}forEach GZL_MOVIE_DATA;
	_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CREATE_LST_SCENES;
	_ctrl lbSetSelected [1, true];
} 
else { call GZL_Movie_New;};
	// lbClear GZL_IDC_CREATE_LST_SCENES;
	// _index = lbAdd [GZL_IDC_CREATE_LST_SCENES, "[New]"];
	// _ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CREATE_LST_SCENES;
	// _ctrl lbSetSelected [0, true];
	// GZL_SCENE_DATA = + GZL_SCENE_DEFAULT;
	// GZL_MOVIE_DATA = [];};
call GZL_Create_UpdateUI;
//============================================================================================================================================
//============================================================================================================================================
// diag_log "After:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];
