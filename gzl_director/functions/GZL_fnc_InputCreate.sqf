private["_handled","_input","_inputType","_num","_ctrl"];
_idc = _this select 0; 
_value = (_this select 1) select 1; //_ctrl = _this select 1; 
_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl _idc;
_num = 0;
_handled = true;

//============================================================================================================================================			
//============================================================================================================================================
switch ( _idc ) do {	
// DIALOG CREATE (unloading)	
	case GZL_IDD_DLG_CREATE : {	}; //if (GZL_CREATE_ACTIVE) then {[] spawn GZL_Dialog_Create;
// TXT DURATION	
	case GZL_IDC_CREATE_TXT_DUR : {
		GZL_SCENE_LENGTH = parsenumber ctrlText GZL_IDC_CREATE_TXT_DUR;
		GZL_SCENE_DATA set [1,GZL_SCENE_LENGTH];};
// SLIDER DIST
	case GZL_IDC_CREATE_SLD_DIST : { GZL_SCENE_DATA set [4,_value];	};
// SLIDER ANGLE
	case GZL_IDC_CREATE_SLD_ANGLE : { GZL_SCENE_DATA set [5,_value]; };
// SLIDER HEIGHT
	case GZL_IDC_CREATE_SLD_HEIGHT : { GZL_SCENE_DATA set [6,_value]; };
// SLIDER DIR
	case GZL_IDC_CREATE_SLD_DIR : { GZL_SCENE_DATA set [7,_value]; };
// SLIDER FOV
	case GZL_IDC_CREATE_SLD_FOV : { GZL_SCENE_DATA set [8,_value]; };
// TXT DIST
	case GZL_IDC_CREATE_TXT_DIST : {
		_num = parseNumber ctrlText GZL_IDC_CREATE_TXT_DIST;
		GZL_SCENE_DATA set [4,_num]; };
// TXT ANGLE
	case GZL_IDC_CREATE_TXT_ANGLE : {
		_num = parseNumber ctrlText GZL_IDC_CREATE_TXT_ANGLE;
		GZL_SCENE_DATA set [5,_num]; };
// TXT HEIGHT	
	case GZL_IDC_CREATE_TXT_HEIGHT : {
		_num = parseNumber ctrlText GZL_IDC_CREATE_TXT_HEIGHT;
		GZL_SCENE_DATA set [6,_num]; };
// TXT DIR
	case GZL_IDC_CREATE_TXT_DIR : {
		_num = parseNumber ctrlText GZL_IDC_CREATE_TXT_DIR;
		GZL_SCENE_DATA set [7,_num]; };
// TXT FOV	
	case GZL_IDC_CREATE_TXT_FOV : {
		_num = parseNumber ctrlText GZL_IDC_CREATE_TXT_FOV;
		GZL_SCENE_DATA set [8,_num]; };
// TXT RANGE	
	case GZL_IDC_CREATE_TXT_RANGE : {
		GZL_SLIDER_RANGE = parseNumber ctrlText GZL_IDC_CREATE_TXT_RANGE;					
		[GZL_IDC_CREATE_SLD_DIST, GZL_SLIDER_RANGE, GZL_SCENE_DATA select 6, 0.01, 0.01] call GZL_fnc_SetSlider;		
		[GZL_IDC_CREATE_SLD_HEIGHT, GZL_SLIDER_RANGE, GZL_SCENE_DATA select 7, 0.01, 0.01] call GZL_fnc_SetSlider;};
//TXT SCRIPT
	case GZL_IDC_CREATE_TXT_SCRIPT : {
		GZL_SCENE_DATA set [9, (ctrlText GZL_IDC_CREATE_TXT_SCRIPT)]};
//BTN LOCK SUBJECT
	case GZL_IDC_CREATE_BTN_LOCK : {					
		[GZL_SCENE_DATA select 3] call GZL_Create_SetMode;};
// BTN SMOOTH CAM
	case GZL_IDC_CREATE_BTN_SMOOTH : {
		_smooth = !(GZL_SCENE_DATA select 10);
		GZL_SCENE_DATA set [10, _smooth];
		if (_smooth)
		then {ctrlSetText [GZL_IDC_CREATE_BTN_SMOOTH, "Smooth"];}
		else {ctrlSetText [GZL_IDC_CREATE_BTN_SMOOTH, "Abrupt"];};};
// BTN SAVE SCENE			
	case GZL_IDC_CREATE_BTN_SAVE : {
		_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CREATE_LST_SCENES;
		_index = ((lbSelection _ctrl) select 0);
		[_ctrl lbText _index] call GZL_Create_Save;};
// BTN HIDE DIALOG
	case GZL_IDC_CREATE_BTN_HIDE : {					
		closeDialog GZL_IDD_DLG_CREATE;};
// BTN MAIN DIALOG		
	case GZL_IDC_CREATE_BTN_MAIN : {
		closeDialog GZL_IDD_DLG_CREATE;
		[] spawn GZL_Dialog_Director;};
// BTN  MOVIE DIALOG
	case GZL_IDC_CREATE_BTN_MOVIES : {
		if (ctrlVisible GZL_IDC_MOVIE_BKG)
		then {[GZL_IDC_MOVIE_BKG, GZL_IDC_MOVIE_BTN_COPY, false] spawn GZL_fnc_ControlsHideShow;}
		else {[GZL_IDC_MOVIE_BKG, GZL_IDC_MOVIE_BTN_COPY, true] spawn GZL_fnc_ControlsHideShow;};};
// BTN CUTS
	case GZL_IDC_CREATE_BTN_CUTS : {
		if (ctrlVisible GZL_IDC_CUT_BKG)
		then {[GZL_IDC_CUT_BKG, GZL_IDC_CUT_TXT_DUR, false] call GZL_fnc_ControlsHideShow;}
		else {[GZL_IDC_CUT_BKG, GZL_IDC_CUT_TXT_DUR, true] call GZL_fnc_ControlsHideShow;};};
// LST CUTS
	case GZL_IDC_CUT_LST_CUTS : { [_value] call GZL_Create_SetCut };
// TXT CUT TEXT	
	case GZL_IDC_CUT_TXT_TEXT : {[-1] call GZL_Create_SetCut};
// TXT CUT DURATION
	case GZL_IDC_CUT_TXT_DUR : { [-1] call GZL_Create_SetCut };
// LST SCENES		
	case GZL_IDC_CREATE_LST_SCENES : {[_value] call GZL_Create_SetScene;};

}; //end switch
call GZL_Create_UpdateUI;					
_handled;

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

