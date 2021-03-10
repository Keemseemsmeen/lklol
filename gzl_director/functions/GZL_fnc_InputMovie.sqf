private["_handled","_input","_inputType","_num","_ctrl"];
_idc = _this select 0; 
_value = (_this select 1) select 1; //_ctrl = _this select 1; 
_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl _idc;
_handled = true;
_scene = [];
//disableserialization;
//============================================================================================================================================			
//============================================================================================================================================
switch ( _idc ) do {
// LST MOVIES
	case GZL_IDC_MOVIE_LST_MOVIES : { [_value] call GZL_Movie_GetMovie;};
// BTN SAVE
	case GZL_IDC_MOVIE_BTN_SAVE : {call GZL_Movie_Save;};		
// BTN CLOSE
	case GZL_IDC_MOVIE_BTN_CLOSE : {[GZL_IDC_MOVIE_BKG, GZL_IDC_MOVIE_BTN_COPY, false] spawn GZL_fnc_ControlsHideShow;};
// BTN DELETE
	case GZL_IDC_MOVIE_BTN_DEL : {};
// BTN NEW
	case GZL_IDC_MOVIE_BTN_NEW : { call GZL_Movie_New; };
// BTN COPY
	case GZL_IDC_MOVIE_BTN_COPY : { [] spawn GZL_Movie_Copy; };
// DEFAULT
	default {_handled = false;};
};

_handled;