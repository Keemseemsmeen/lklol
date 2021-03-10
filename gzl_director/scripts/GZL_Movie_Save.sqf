//============================================================================================================================================
//============================================================================================================================================
private["_title","_movie","_match","_tmp", "_selection"];

_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_MOVIE_LST_MOVIES;
_selection = lbSelection _ctrl;
if ((count _selection) == 0)
then {_title = ctrlText GZL_IDC_MOVIE_TXT_TITLE;}
else{_title = lbText [GZL_IDC_MOVIE_LST_MOVIES, (_selection select 0)];};
_movie = [];
_tmp = [];
_match = false;
_index = 0;
// diag_log "========== Saving Movie ==========";
// diag_log "Before:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];
if (_title != "") then {

	_tmp = GZL_MOVIE_DATA;
	//============================================================================================================================================
	// look for an existing movie with the same title and update it if found
	//============================================================================================================================================
	{ if ((_x select 0) == _title) then {
		_x set [1,_tmp];
		_match = true;
		if (true) exitWith{};};
	} forEach GZL_MOVIES;
	//============================================================================================================================================
	//  if we didn't find a match create a new movie
	//============================================================================================================================================
	if (!_match) then {
		_movie = [_title,_tmp];
		GZL_MOVIES = GZL_MOVIES + [_movie];
		lbClear GZL_IDC_MOVIE_LST_MOVIES;
		{_index = lbAdd [GZL_IDC_MOVIE_LST_MOVIES, _x select 0];} forEach GZL_MOVIES;
		_ctrl lbSetSelected [_index, true];
	// add movie to scene list so it shows up in main dialog
		GZL_SCENES = GZL_SCENES + [(_movie select 0)];
	// add a flag to the scene mask to account for the new scene
		GZL_SCENE_MASK = GZL_SCENE_MASK + [false];

	};
};
//============================================================================================================================================
//============================================================================================================================================

// diag_log "After:";
// diag_log format["Movies: %1", GZL_MOVIES];
// diag_log format["MovieData: %1", GZL_MOVIE_DATA];
// diag_log format["SceneData: %1", GZL_SCENE_DATA];