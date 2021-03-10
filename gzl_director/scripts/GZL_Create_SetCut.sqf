private["_ctrl","_selected", "_index"];
//diag_log "========== SetCut ==========";
_index = _this select 0;
_ctrl = (findDisplay GZL_IDD_DLG_CREATE) displayCtrl GZL_IDC_CUT_LST_CUTS;

if (_index != 0)
then {
	if (_index == -1) then { _index = (lbSelection _ctrl) select 0};
	GZL_SCENE_DATA set [11, (lbText [GZL_IDC_CUT_LST_CUTS,_index])];	
	GZL_SCENE_DATA set [12, (ctrlText GZL_IDC_CUT_TXT_TEXT)];
	GZL_SCENE_DATA set [13, (ctrlText GZL_IDC_CUT_TXT_DUR)];}
else {
	GZL_SCENE_DATA set [11, "[NONE]"];
	GZL_SCENE_DATA set [12, ""];
	GZL_SCENE_DATA set [13, "0"];};
	
call GZL_Create_UpdateUI;

	diag_log GZL_SCENE_DATA;
// GZL_SCENE_DATA
// cutType	11
// cutText	12
// cutDur		13