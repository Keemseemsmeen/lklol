/*****************************************************************************
  Scriptname: 
	onConfigChange.sqf
  Author: 
	HeliJunkie
	
  Description:
	Handles the "onLBSelChanged" event of the config combo box
  
  Input:
	_this select 0: control
	_this select 1: selected index
	
  Returns:
	nothing
*****************************************************************************/
disableSerialization;
private ["_currentCtrl", "_selectedIndex"];

_currentCtrl = _this select 0;    // not really used
_selectedIndex = _this select 1;

// ***
// *** Select the config namespace
// *** and set some global variables to inital values
// ***

Switch (_selectedIndex) do 
{
	case 0:
	{
		CurrentRoot = configFile;
		CurrentConfig = configFile;
		ConfigPath = [configFile];
	};
	
	case 1:
	{
		CurrentRoot = missionConfigFile;
		CurrentConfig = missionConfigFile;
		ConfigPath = [missionConfigFile];
	};
    
	case 2:
	{
		CurrentRoot = campaignConfigFile;
		CurrentConfig = campaignConfigFile;
		ConfigPath = [campaignConfigFile];
	}; 
};
IndexOrder = [];

[CurrentRoot,ConfigPath] call hj_fn_showConfig;
