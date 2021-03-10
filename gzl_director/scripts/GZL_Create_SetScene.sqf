//============================================================================================================================================
//============================================================================================================================================
private["_index","_scene"];
// diag_log "========== SetScene ==========";

// diag_log "Before:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];
//============================================================================================================================================
//============================================================================================================================================
_index = _this select 0;
if (_index != 0) then {
	_scene = GZL_MOVIE_DATA select _index - 1;
	GZL_SCENE_DATA set [0, (_scene select 0)];
	GZL_SCENE_DATA set [1, (_scene select 1)];
	GZL_SCENE_LENGTH = (_scene select 1);
	GZL_SCENE_DATA set [2, (_scene select 2)];
	GZL_SCENE_DATA set [3, (_scene select 3)];
	GZL_SCENE_DATA set [4, (_scene select 4)];
	GZL_SCENE_DATA set [5, (_scene select 5)];
	GZL_SCENE_DATA set [6, (_scene select 6)];
	GZL_SCENE_DATA set [7, (_scene select 7)];
	GZL_SCENE_DATA set [8, (_scene select 8)];
	GZL_SCENE_DATA set [9, (_scene select 9)];
	GZL_SCENE_DATA set [10, (_scene select 10)];
	GZL_SCENE_DATA set [11, (_scene select 11)];
	GZL_SCENE_DATA set [12, (_scene select 12)];
	GZL_SCENE_DATA set [13, (_scene select 13)];
	GZL_SUBJECT set [0, GZL_SCENE_DATA select 2];
};
//call GZL_Create_SetCut;
//============================================================================================================================================
//============================================================================================================================================
// update the UI with scene data;
call GZL_Create_UpdateUI;
//============================================================================================================================================
//============================================================================================================================================
// diag_log "After:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];