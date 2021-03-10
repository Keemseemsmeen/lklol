
uavtrigger = createTrigger ["EmptyDetector", getPos uavter]; 
uavtrigger setTriggerStatements ["!(alive MyUAV)", "player SideChat ""UAV has been destroyed""; uavlh = true; [uavter] exec ""\loki_lost_key\lk\uav\uav_menu.sqf""" , ""];

uavter removeaction uavac1;
uavlh = false;

[uavter] exec "\loki_lost_key\lk\uav\uav_menu.sqf";

private ["_vec_array","_myarray"];
_myarray = _this select 3;
_spawloc = _myarray select 0;
_spawhei = if (count _myarray > 1) then {_myarray select 1} else {100};
_uavMod = if (count _myarray > 2) then {_myarray select 2} else {BIS_UAV_1};
_units = if (count _myarray > 3) then {_myarray select 3} else {xvec1, xvec2};
_uavType = if (count _myarray > 4) then {_myarray select 4} else {MQ9PredatorB};
_grp = if (count _myarray > 5) then {_myarray select 5} else {"west"};

_vclname="MyUAV";

_vec_array = [[getPos _spawloc select 0, getPos _spawloc select 1, (getPos _spawloc select 2) +_spawhei], random 360, _uavType, _grp] call BIS_fnc_spawnVehicle;
_vcl = _vec_array select 0;
_vcl SetVehicleVarName _vclname;
_vcl Call Compile Format ["%1=_vcl;PublicVariable ""%1"";",_vclname];
_initCmd=format["this addWeapon ""VikhrLauncher""; this addMagazine ""12Rnd_Vikhr_KA50""; this addMagazine ""12Rnd_Vikhr_KA50""; this addMagazine ""12Rnd_Vikhr_KA50""; this setcaptive true; this disableAI ""AUTOTARGET""; this disableAI ""TARGET""; this setCombatMode ""BLUE""; this setBehaviour ""careless""; %1 synchronizeObjectsAdd [%2,%3];",_uavmod,_vcl,_units];
_vcl setVehicleInit _initCmd;

processInitCommands;
clearVehicleInit _vcl;

hint "UAV has been Launched";
Player sideChat format ["UAV launched from %1 by %2", _spawloc, player];
