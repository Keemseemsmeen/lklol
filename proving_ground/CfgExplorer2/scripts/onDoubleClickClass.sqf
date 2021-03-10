/*****************************************************************************
  Scriptname: 
	onDoubleClickClass.sqf
  Author: 
	HeliJunkie
	
  Description:
Handles the "onDoubleClick"-event of classes list box
  
  Input:
	_this select 0: control
	_this select 1: selected index
	
  Returns:
	nothing
*****************************************************************************/
disableSerialization;
private["_control","_index","_selectedEntryName", "_Entry","_ConfName","_nix"];

// ***
// *** get parameter
// ***  

_control = _this select 0;
_index = _this select 1;

_selectedEntryName = lbtext [110,_index];

// ***
// *** get the new configObject
// ***
call compile ("_Entry = (CurrentConfig >> """ + _selectedEntryName + """)");

CurrentConfig = _Entry;
ConfigPath = ConfigPath + [CurrentConfig];

[ConfigRoot, ConfigPath] call hj_fn_showConfig;
