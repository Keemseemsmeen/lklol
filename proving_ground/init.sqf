#include "defs.hpp"
if (!isServer) exitWith {};
_keyhandler = 
{
	private["_handled","_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
	_ctrl = _this select 0;
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	_handled = false;
	//hint format ["%1",_this];
	if (!_shift && _ctrlKey && !_alt && (_dikCode == 219)) then {
			_ctrl = nil;
			_handled = true;
			createDialog "loki_debug_main";
		};


	_handled;
};

if (isClass(configFile >> "cfgPatches" >> "ace_main")) then {
	ace_sys_wounds_enabled = true;
	publicVariable "ace_sys_wounds_enabled";
};

sleep 1;
//titleText["Use action menu or Ctrl+LeftWin to call proving ground interface","plain down"];

loki_logic = "logic" createVehicleLocal [0,0,0];
waitUntil{!isNil "loki_logic"};

_core = _this select 0;
_dir = direction _core;
_pos = getpos _core;
_marker = createMarker ["respawn_west",[(_pos select 0)-20*sin(_dir),(_pos select 1)-20*cos(_dir),0]];
_marker = createMarker ["respawn_east",[(_pos select 0)-20*sin(_dir),(_pos select 1)-20*cos(_dir),0]];
_marker = createMarker ["respawn_guerrila",[(_pos select 0)-20*sin(_dir),(_pos select 1)-20*cos(_dir),0]];
_marker = createMarker ["respawn_civilian",[(_pos select 0)-20*sin(_dir),(_pos select 1)-20*cos(_dir),0]];
loki_set(CORE,_core);
loki_set(keyhandler,_keyhandler);
loki_set(VEH,objNull);
loki_set(SOUNDSOURCE,objNull);
loki_set(MAGS,magazines player);
_props = [100,0,_dir+180];
loki_set(TARGET_PROPS,_props);
loki_set(LAND_TARGETS,[]);
loki_set(CREW,[]);
loki_set(AIR_TARGETS,[]);
loki_set(CREW_AIR,[]);
#include "fnc_global.sqf"

loki_set(FNC_booster,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_booster.sqf");
loki_set(bulletcam,false);
loki_set(TRACKING,false);
loki_set(STATUS,false);
loki_set(FNC_target,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_target.sqf");
loki_set(FNC_status,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_status.sqf");
loki_set(FNC_sound,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_sound.sqf");
loki_set(FNC_bulletcam,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_bulletcam.sqf");
loki_set(FNC_bullettrack,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_bullettrack.sqf");
loki_set(FNC_create_vehicle,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_create_vehicle.sqf");
loki_set(FNC_create_weapon,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_create_weapon.sqf");
loki_set(FNC_exec_console,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_exec_console.sqf");
loki_set(FNC_sattelite,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_sattelite.sqf");
if (isClass(configFile >> "cfgVehicles" >> "An2_1_TK_CIV_EP1")) then {
	loki_set(satcam_keyhandler,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_satcam_keyhandler_OA.sqf");
}else{
	loki_set(satcam_keyhandler,compile preprocessFileLineNumbers "\loki_lost_key\proving_ground\fnc_satcam_keyhandler.sqf");
};


createCenter sideLogic;
player addRating 100000000;
_grpLogic = createGroup sideLogic;
_HQ = _grpLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];
loki_set(HQ,_HQ);
_opfor=switch (side player) do {case west:{east}; case east:{west}; default {west}};
createCenter _opfor;
loki_set(TARGET_GRP,createGroup _opfor);
loki_set(AIR_TARGET_GRP,createGroup _opfor);

_wp = loki_get(AIR_TARGET_GRP) addWaypoint [[(_pos select 0)+300,(_pos select 1)],0];
_wp setWaypointType "MOVE";
_wp = loki_get(AIR_TARGET_GRP) addWaypoint [[(_pos select 0),(_pos select 1)+300],0];
_wp setWaypointType "MOVE";
_wp = loki_get(AIR_TARGET_GRP) addWaypoint [[(_pos select 0)-300,(_pos select 1)],0];
_wp setWaypointType "MOVE";
_wp = loki_get(AIR_TARGET_GRP) addWaypoint [[(_pos select 0),(_pos select 1)-300],0];
_wp setWaypointType "MOVE";
_wp = loki_get(AIR_TARGET_GRP) addWaypoint [[_pos select 0,_pos select 1],0];
_wp setWaypointType "CYCLE";

//_act = player addaction ["<t color='#C0C0C0'>Proving ground</t>", "\loki_lost_key\proving_ground\act_show_dialog.sqf",[],0.1];
/*
loki_DEBUG_TOOL=(findDisplay 46) displayAddEventHandler ["keyDown", "_this call (loki_logic getVariable ""keyhandler"")"];
[] execVM "\loki_lost_key\proving_ground\fnc_status.sqf";
[] spawn {
	while {true} do {
		sleep 0.5;
		_mags = magazines player;
		{
			if !(_x in _mags) then {
				player addMagazine _x;
			};
		}forEach loki_get(MAGS);
		{
			(vehicle _x) setVehicleAmmo 1;
		}forEach units group player;
	};
};
*/