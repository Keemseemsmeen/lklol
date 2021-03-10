/*****************************************************************************
  Scriptname: 
	InitDialog.sqf
  Author: 
	HeliJunkie
	
  Description:
  Initialise the dialog and the environment
  
  Input:
	_this select 0: display
	
  Returns:
	nothing
*****************************************************************************/
disableSerialization;
private ["_display","_tmpIndex"];

// ***
// *** define some public variables
// ***

GameConfig = 0;       // configFile
MissionConfig = 1;    // missionConfigFile
CampaignConfig = 2;   // campaignConfigFile

CurrentRoot = configFile;     // Current Root Config
CurrentConfig = configFile;   // Current Config Path
ConfigPath = [];              // Paths below Config Root (String Array)

// ***
// *** define some function
// ***

hj_fn_disableUp = compile "ctrlEnable [120,false];";
hj_fn_enableUp = compile "ctrlEnable [120,true];";
hj_fn_showConfig = compile preprocessFile "\loki_lost_key\proving_ground\CfgExplorer2\scripts\ShowConfig.sqf";
hj_fn_fillClasses = compile preprocessFile "\loki_lost_key\proving_ground\CfgExplorer2\scripts\FillClasses.sqf";
hj_fn_fillValues = compile preprocessFile "\loki_lost_key\proving_ground\CfgExplorer2\scripts\FillValues.sqf";
hj_fn_ArrayToString = compile preprocessfile "\loki_lost_key\proving_ground\CfgExplorer2\scripts\ArrayToString.sqf";

_display = _this select 0;

// ***
// *** Add UI Event handlers to Config Combo List
// *** Hint: Must be set before setting the init value to the ComboList (lbSetCurSel) !!!
// ***

(_display displayCtrl 103) ctrlSetEventHandler ["LBSelChanged", "_this execVM ""\loki_lost_key\proving_ground\CfgExplorer2\scripts\onConfigChange.sqf"";"];
(_display displayCtrl 110) ctrlSetEventHandler ["LBDblClick ", "_this execVM ""\loki_lost_key\proving_ground\CfgExplorer2\scripts\onDoubleClickClass.sqf"";"];

// ***
// *** Fill ComboList with the available Config Namespaces
// ***

_tmpIndex = lbadd [103, "Game"];
lbSetValue [103, _tmpIndex, GameConfig];
_tmpIndex = lbadd [103, "Mission"];
lbSetValue [103, _tmpIndex, MissionConfig];
_tmpIndex = lbadd [103, "Campaign"];
lbSetValue [103, _tmpIndex, CampaignConfig];

lbSetCurSel [103, 0];

// ***
// *** set inital focus to the class list box
// ***
ctrlSetFocus (_display displayCtrl 110);
