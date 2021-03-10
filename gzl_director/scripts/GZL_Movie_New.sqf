//============================================================================================================================================
//============================================================================================================================================
//diag_log "========== New ==========";
// diag_log "Before:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];
//============================================================================================================================================
//============================================================================================================================================
GZL_SCENE_DATA = + GZL_SCENE_DEFAULT;
GZL_SCENE_DATA set [2, (GZL_SUBJECT select 0)];
_size = sizeOf (typeOf (GZL_SCENE_DATA select 2));
GZL_SCENE_DATA set [4, _size];
GZL_SCENE_DATA set [5, 0];
GZL_SCENE_DATA set [6, (_size / 2)];
GZL_MOVIE_DATA =[];

lbClear GZL_IDC_CREATE_LST_SCENES;
_index = lbAdd [GZL_IDC_CREATE_LST_SCENES, "[New]"];
_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CREATE_LST_SCENES;
_ctrl lbSetSelected [0, true];
_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_MOVIE_TXT_TITLE;
ctrlSetText [GZL_IDC_MOVIE_TXT_TITLE, "Untitled"];
ctrlSetFocus _ctrl;
//============================================================================================================================================
//============================================================================================================================================
// diag_log "After:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];