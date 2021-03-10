//============================================================================================================================================
//============================================================================================================================================
private["_ctrl","_index","_num"];
disableSerialization;
_ctrl = controlNull;
_index = 0;
_num = 0;
//============================================================================================================================================
waitUntil {!dialog};
//============================================================================================================================================
// create dialog
	_nul =  createDialog "GZL_DIALOG_CREATE";
// load the movies into the movie list		
	{_index = lbAdd [GZL_IDC_MOVIE_LST_MOVIES, _x select 0];}forEach GZL_MOVIES;
	_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_MOVIE_LST_MOVIES;
	_ctrl lbSetSelected [_index, true];
// hide the movie controls
	[GZL_IDC_MOVIE_BKG, GZL_IDC_MOVIE_BTN_COPY, false] call GZL_fnc_ControlsHideShow;
// load the scene cuts into the cut list	
	{_index = lbAdd [GZL_IDC_CUT_LST_CUTS, _x];}forEach GZL_SCENE_CUT_TYPE;
	_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CUT_LST_CUTS;
	_ctrl lbSetSelected [0, true];
// hide the movie controls
	[GZL_IDC_CUT_BKG, GZL_IDC_CUT_TXT_DUR, false] call GZL_fnc_ControlsHideShow;
	
// init the Slider Range text box
	ctrlSetText [GZL_IDC_CREATE_TXT_RANGE, str GZL_SLIDER_RANGE];
// init the Dist/PosX slider
	[GZL_IDC_CREATE_SLD_DIST, GZL_SLIDER_RANGE, GZL_SCENE_DATA select 4, 0.01, 0.01] call GZL_fnc_SetSlider;		
// init the Angle/PosY slider
	[GZL_IDC_CREATE_SLD_ANGLE, 180, GZL_SCENE_DATA select 5, 0.01, 0.01] call GZL_fnc_SetSlider;
// init the Height/PosZ slider
	[GZL_IDC_CREATE_SLD_HEIGHT, GZL_SLIDER_RANGE, GZL_SCENE_DATA select 6, 0.01, 0.01] call GZL_fnc_SetSlider;
// init the DIR slider
	//[GZL_IDC_CREATE_SLD_DIR, 180, GZL_SCENE_DATA select 7, 0.01, 0.01] call GZL_fnc_SetSlider;
	//ctrlEnable [ GZL_IDC_CREATE_SLD_DIR,false];
	sliderSetRange [GZL_IDC_CREATE_SLD_DIR, 0, 360];
	sliderSetPosition [GZL_IDC_CREATE_SLD_DIR, GZL_SCENE_DATA select 7];
	sliderSetSpeed [GZL_IDC_CREATE_SLD_DIR,0.01,0.01]; 
// init the FOV slider 
	sliderSetRange [GZL_IDC_CREATE_SLD_FOV, 0, 1];
	sliderSetPosition [GZL_IDC_CREATE_SLD_FOV, GZL_SCENE_DATA select 8];
	sliderSetSpeed [GZL_IDC_CREATE_SLD_FOV,0.01,0.01]; 
// init the Dist/PosX text box
	_num = [GZL_SCENE_DATA select 4, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_DIST, str _num];
// init the Angle/PosY text box
	_num = [GZL_SCENE_DATA select 5, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_ANGLE, str _num];
// init the Height/PosZ text box
	_num = [GZL_SCENE_DATA select 6, 2] call GZL_fnc_TrimDecimal;	
	ctrlSetText [GZL_IDC_CREATE_TXT_HEIGHT, str _num];
// init the Dir text box 
	_num = [GZL_SCENE_DATA select 7, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_DIR, str _num];
	ctrlEnable [ GZL_IDC_CREATE_TXT_DIR,false];
// init the FOV text box
	_num = [GZL_SCENE_DATA select 8, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_FOV, str _num];
// init the Duration text box
	_num = [GZL_SCENE_DATA select 1, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_DUR, str _num];
// set the 'lock' button state
	if (GZL_SCENE_DATA select 3 )
	then { ctrlSetText [GZL_IDC_CREATE_BTN_LOCK, "Unlock Subject"]; ctrlEnable [GZL_IDC_CREATE_SLD_DIR, false]; }
	else { ctrlSetText [GZL_IDC_CREATE_BTN_LOCK, "Lock Subject"];ctrlEnable [GZL_IDC_CREATE_SLD_DIR, true];};
// set the 'smooth' button state
	if (GZL_SCENE_DATA select 10)
	then {ctrlSetText [GZL_IDC_CREATE_BTN_SMOOTH, "Smooth"];}
	else {ctrlSetText [GZL_IDC_CREATE_BTN_SMOOTH, "Abrupt"];};	
// load the scenes into the scene list
	_index = lbAdd [GZL_IDC_CREATE_LST_SCENES, "[New]"];
	{_index = lbAdd [GZL_IDC_CREATE_LST_SCENES, _x select 0];}forEach GZL_MOVIE_DATA;
	_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CREATE_LST_SCENES;
	_ctrl lbSetSelected [0, true];
//============================================================================================================================================
//============================================================================================================================================
//disable movie controls
	// ctrlEnable [GZL_IDC_MOVIE_BTN_SAVE,false];
	// ctrlEnable [GZL_IDC_MOVIE_BTN_DEL,false];
	// ctrlEnable [GZL_IDC_MOVIE_TXT_TITLE,false];
		
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

