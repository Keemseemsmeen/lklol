// Desc: Team Status Dialog
// Features: Group joining, Team Leader selection, statistics for team/group/vehicle/opposition

TSD9_VehicleSearchComplete = true;
TSD9_Vehicle = objNull;
TSD9_HideIcons = false;
TSD9_DeleteRemovedAI = false;
TSD9_AllowAILeaderSelect = false;
TSD9_AllowAIRecruitment = true;
TSD9_AllowPlayerInvites = false;
TSD9_AllowPlayerRecruitment = true;
TSD9_ShowAIGroups = true;
TSD9_CloseOnKeyPress = false;

if (isNil "TSD9_funcs_inited") then {
	call compile preprocessFileLineNumbers "\loki_lost_key\TeamStatusDialog\TeamStatusDialogFuncs.sqf";
};

if (!isNull findDisplay TSD9_IDD_TeamStatusDialog) exitWith {hintSilent "(Team Status dialog is already open)"};
if !(createDialog "ICE_TeamStatusDialog") then {hint "createDialog failed"};
_this call TSD9_ProcessParameters;
[] call TSD9_DrawPage;
