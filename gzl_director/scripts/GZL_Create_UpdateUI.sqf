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
// smoothMove 10
// cutType	11
// cutText	12
// cutDur		13
disableserialization;
//============================================================================================================================================
//============================================================================================================================================
// DURATION
	ctrlSetText [GZL_IDC_CREATE_TXT_DUR, str GZL_SCENE_LENGTH];
// Lock Subject
	if (GZL_SCENE_DATA select 3 )
	then { ctrlSetText [GZL_IDC_CREATE_BTN_LOCK, "Unlock Subject"]; ctrlEnable [GZL_IDC_CREATE_SLD_DIR, false]; }
	else { ctrlSetText [GZL_IDC_CREATE_BTN_LOCK, "Lock Subject"];ctrlEnable [GZL_IDC_CREATE_SLD_DIR, true];};
// Dist/PosX 
	sliderSetPosition [GZL_IDC_CREATE_SLD_DIST, GZL_SCENE_DATA select 4];
	_num = [GZL_SCENE_DATA select 4, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_DIST, str _num];
// Angle/PosY
	sliderSetPosition [GZL_IDC_CREATE_SLD_ANGLE, GZL_SCENE_DATA select 5];
	_num = [GZL_SCENE_DATA select 5, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_ANGLE, str _num];
// Height/PosZ 
	sliderSetPosition [GZL_IDC_CREATE_SLD_HEIGHT, GZL_SCENE_DATA select 6];
	_num = [GZL_SCENE_DATA select 6, 2] call GZL_fnc_TrimDecimal;	
	ctrlSetText [GZL_IDC_CREATE_TXT_HEIGHT, str _num];
// Dir 
	sliderSetPosition [GZL_IDC_CREATE_SLD_DIR, GZL_SCENE_DATA select 7];
	_num = [GZL_SCENE_DATA select 7, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_DIR, str _num];
	ctrlEnable [ GZL_IDC_CREATE_TXT_DIR,false];
// FOV
	sliderSetPosition [GZL_IDC_CREATE_SLD_FOV, GZL_SCENE_DATA select 8];
	_num = [GZL_SCENE_DATA select 8, 2] call GZL_fnc_TrimDecimal;
	ctrlSetText [GZL_IDC_CREATE_TXT_FOV, str _num];
//SCRIPT
	ctrlSetText [GZL_IDC_CREATE_TXT_SCRIPT, (GZL_SCENE_DATA select 9)];
//SMOOTH
	_smooth = (GZL_SCENE_DATA select 10);	
	if (_smooth)
	then {ctrlSetText [GZL_IDC_CREATE_BTN_SMOOTH, "Smooth"];}
	else {ctrlSetText [GZL_IDC_CREATE_BTN_SMOOTH, "Abrupt"];};
// CUT TYPE	
	_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CUT_LST_CUTS;	
	_index = 0;
	{
		if (_x == (GZL_SCENE_DATA select 11))
		then { _ctrl lbSetSelected [_index, true];}
		else { _ctrl lbSetSelected [_index, false];};
		_index = _index + 1;
	} forEach GZL_SCENE_CUT_TYPE;
// CUT TEXT
	ctrlSetText [GZL_IDC_CUT_TXT_TEXT, GZL_SCENE_DATA select 12];
// CUT DUR
	ctrlSetText [GZL_IDC_CUT_TXT_DUR, GZL_SCENE_DATA select 13];
	
	
//============================================================================================================================================
//============================================================================================================================================
	
