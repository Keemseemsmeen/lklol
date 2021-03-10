//============================================================================================================================================
//============================================================================================================================================
private["_modeLocked"];
_modeLocked = _this select 0;
disableSerialization;
//============================================================================================================================================
//============================================================================================================================================
if (_modeLocked)
then {
	GZL_SCENE_DATA set [3, false];
	GZL_SCENE_DATA set [5, (GZL_SCENE_DATA select 4)];
	GZL_SCENE_DATA set [7, 0];
	ctrlSetText [GZL_IDC_CREATE_BTN_LOCK, "Lock Subject"];
	ctrlEnable [ GZL_IDC_CREATE_SLD_DIR,true];
	ctrlEnable [ GZL_IDC_CREATE_TXT_DIR,true];		
	[GZL_IDC_CREATE_SLD_ANGLE, GZL_SLIDER_RANGE, GZL_SCENE_DATA select 5, 0.01, 0.01] call GZL_fnc_SetSlider;
	}
else {
	GZL_SCENE_DATA set [3, true];
	GZL_SCENE_DATA set [5, ((GZL_SCENE_DATA select 6) * sin(GZL_SCENE_DATA select 5))];	
	ctrlSetText [GZL_IDC_CREATE_BTN_LOCK, "Unlock Subject"];	
	ctrlEnable [GZL_IDC_CREATE_SLD_DIR, false];
	ctrlEnable [ GZL_IDC_CREATE_TXT_DIR,false];		
	[GZL_IDC_CREATE_SLD_ANGLE, 180, GZL_SCENE_DATA select 5, 0.01, 0.01] call GZL_fnc_SetSlider;};
call GZL_Create_UpdateUI;
//============================================================================================================================================
//============================================================================================================================================