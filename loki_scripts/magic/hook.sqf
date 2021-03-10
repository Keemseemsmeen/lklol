// ********************************************
// Script File for ArmA2
// Made by: Cyborg11
// Version: 1.1
// ********************************************

// Action hinzufügen (In die Init vom Zugtraktor):
// this addaction ["Hook","hook.sqf",false];

private ["_offset"];
_action = _this select 1;
_next = _this select 2;
_vehicle = position player nearestObject "AIR"; 
_hooked = false;
player removeaction _action;
_vehicletype = typeof _vehicle;
switch (_vehicletype) do {
	case "C130J": {_offset = [0,-18,4.8]};
	case "A10": {_offset = [0,-10,0.1]};
	case "F35B": {_offset = [0,-10,1.2]};
	case "Ka52": {_offset = [0,-10,1.9]};
	case "Ka52Black": {_offset = [0,-10,1.9]};
	case "Mi17_CDF": {_offset = [0,-10,2.2]};
	case "Mi17_medevac_CDF": {_offset = [0,-10,2.2]};
	case "Mi17_rockets_RU": {_offset = [0,-10,2.2]};
	case "Mi17_medevac_RU": {_offset = [0,-10,2.2]};
	case "Mi17_Ins": {_offset = [0,-10,2.2]};
	case "Mi17_medevac_INS": {_offset = [0,-10,2.2]};
	case "Mi17_Civilian": {_offset = [0,-10,2.2]};
	case "MH60S": {_offset = [0,-10,1.9]};
	case "Mi24_D": {_offset = [0,-12,2]};
	case "Mi24_P": {_offset = [0,-12,2]};
	case "Mi24_V": {_offset = [0,-12,2]};
	case "MV22": {_offset = [0,-14,2.5]};
	case "D30_CDF": {_offset = [0,-6.8,-1.2]};
	case "D30_RU": {_offset = [0,-6.8,-1.2]};
	case "D30_INS": {_offset = [0,-6.8,-1.2]};
	case "ZU23_CDF": {_offset = [0,-5.5,-0.2]};
	case "ZU23_GUE": {_offset = [0,-5.5,-0.2]};
	case "ZU23_INS": {_offset = [0,-5.5,-0.2]};
	case "M119": {_offset = [0,-6.3,-1.2]};
	default {_offset = [0,-12,1.1]};
};
if (!_next && !_hooked) then {
	hint format ["%1 successfully hooked",_vehicletype];
	_vehicle attachTo [player,_offset,"hatch1"];
	player addaction ["Unhook","hook.sqf",true];
	_hooked = true;
};
if (_next && !_hooked) then {
	hint format ["%1 successfully unhooked",_vehicletype];
	detach _vehicle;	
	player addaction ["Hook","hook.sqf",false];
};

// Debug Meldung
// hint format ["Flugzeug: %1\nTyp: %2\nAction: %3\nOffset: %4\nHooked: %5\nWeiter: %6",_vehicle,_vehicletype,_action,_offset,_hooked,_next];