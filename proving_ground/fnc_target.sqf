#include "defs.hpp"
#define GET_DISPLAY (findDisplay loki_target_display_IDD)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}



_mode = _this select 0;
_veh_type = _this select 1;
switch (_mode) do {
case 0: {//init;
		_tdist = loki_get(TARGET_PROPS) select 0;
		_tspeed = loki_get(TARGET_PROPS) select 1;
		_tdir = loki_get(TARGET_PROPS) select 2;
		GET_CTRL(loki_target_distance_IDC) ctrlSetText str _tdist;
		GET_CTRL(loki_target_speed_IDC) ctrlSetText  str _tspeed;
		GET_CTRL(loki_target_direction_IDC) ctrlSetText str _tdir;
		[1] execVM "\loki_lost_key\proving_ground\fnc_target.sqf";
	};
case 1: {
		
		_kindOf = ["TargetBase"];
		_filter = [];
		switch (_veh_type) do {
			case 0: {_kindOf = ["CAManBase"];};
			case 1: {_kindOf = ["car"];_filter = ["truck","Wheeled_APC"];};
			case 2: {_kindOf = ["truck"];};
			case 3: {_kindOf = ["Wheeled_APC","Tracked_APC"];};
			case 4: {_kindOf = ["tank"];_filter = ["Tracked_APC"];};
			case 5: {_kindOf = ["helicopter"];_filter = ["ParachuteBase"];};
			case 6: {_kindOf = ["plane"];_filter = ["ParachuteBase"];};
			case 7: {_kindOf = ["ship"];};
			default {_kindOf = ["TargetBase"];_filter = [];};
		};
		_cfgvehicles = configFile >> "cfgVehicles";
		lbClear GET_CTRL(loki_target_vehlist_IDC);
		for "_i" from 0 to (count _cfgvehicles)-1 do {
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then {
				_veh_type = configName(_vehicle);
				if ((getNumber(_vehicle >> "scope")==2)and(KINDOF_ARRAY(_veh_type,_kindOf))and!(KINDOF_ARRAY(_veh_type,_filter))) then {
					GET_CTRL(loki_target_vehlist_IDC) lbAdd (getText(_vehicle >> "displayName"));
					GET_CTRL(loki_target_vehlist_IDC) lbSetData [(lbSize GET_CTRL(loki_target_vehlist_IDC))-1,_veh_type];
					if !(_kindOf select 0 in ["TargetBase","CAManBase"]) then {
						GET_CTRL(loki_target_vehlist_IDC) lbSetPicture [(lbSize GET_CTRL(loki_target_vehlist_IDC))-1,getText(_vehicle >> "picture")];
					}else{
						GET_CTRL(loki_target_vehlist_IDC) lbSetPicture [(lbSize GET_CTRL(loki_target_vehlist_IDC))-1,getText(_vehicle >> "icon")];
					};
				
				
				};
			};
		};
		lbSort GET_CTRL(loki_target_vehlist_IDC);
	};
case 2: {//info
		_veh_type = GET_SELECTED_DATA(loki_target_vehlist_IDC);
		GET_CTRL(loki_target_vehicle_shortcut_IDC) ctrlSetText (getText(configFile >> "CfgVehicles" >> _veh_type >> "picture"));
		_vehicle = (configFile >> "CfgVehicles" >> _veh_type);
		_displayName = getText(_vehicle >> "displayName");
		_armor = getNumber(_vehicle >> "armor");
		_maxSpeed = getNumber(_vehicle >> "maxSpeed");
		_weapons =  getArray(_vehicle >> "weapons");
		_magazines = getArray(_vehicle >> "magazines");
		_turrets= (_vehicle >> "Turrets");
		for "_i" from 0 to (count _turrets)-1 do {
			_turret = _turrets select _i;
			_weapons = _weapons + getArray(_turret >> "weapons");
			_magazines = _magazines + getArray(_turret >> "magazines");
			_subturrets = _turret >> "Turrets";
			for "_j" from 0 to (count _subturrets)-1 do {
				_turret = _subturrets select _j;
				_weapons = _weapons + getArray(_turret >> "weapons");
				_magazines = _magazines + getArray(_turret >> "magazines");
			};
		};
		_lb = parseText "<br/>";
		_text = composeText [str configName(_vehicle),_lb,
			"DisplayName: ",str _displayName,_lb,
			"Armor: ", str _armor,_lb,
			"MaxSpeed: ", str _maxSpeed,_lb,
			"Weapons: ", str _weapons,_lb];
		GET_CTRL(loki_target_veh_info_IDC) ctrlSetStructuredText _text;
	};
case 3: {//add land target
		_unit_type = GET_SELECTED_DATA(loki_target_vehlist_IDC);
		if (_unit_type isKindOf "Man") then {
			[-1,_unit_type] call loki_get(FNC_CREATE_UNIT);
		}else{
			[-1,_unit_type] call loki_get(FNC_CREATE_LAND_TARGET_VEHICLE);
		};
};
case 4: {//add air target
		_unit_type = GET_SELECTED_DATA(loki_target_vehlist_IDC);
		if (_unit_type isKindOf "Air") then {
			[-1,_unit_type] call loki_get(FNC_CREATE_AIR_TARGET);
		}else{
			hint "It can not fly";
		};
	};

case 5: {//clear targets
		{deleteVehicle _x} forEach loki_get(LAND_TARGETS);
		loki_set(LAND_TARGETS,[]);
		{deleteVehicle _x} forEach loki_get(AIR_TARGETS);
		loki_set(AIR_TARGETS,[]);
	};
case 6: {//apply
		loki_logic setVariable ["TARGET_PROPS",[parseNumber ctrlText GET_CTRL(loki_target_distance_IDC),parseNumber ctrlText GET_CTRL(loki_target_speed_IDC),parseNumber ctrlText GET_CTRL(loki_target_direction_IDC)]];
		call loki_get(FNC_MOVE_LAND_TARGETS);
		if ((loki_get(TARGET_PROPS) select 1)>0) then {
			[] spawn {
				_shift = 0;
				_delay = 0.03;
				_speed = (loki_get(TARGET_PROPS) select 1);
				_shift_inc = (_speed*_delay);
				while {((loki_get(TARGET_PROPS) select 1) == _speed)} do {
					sleep _delay;
					_shift = _shift + _shift_inc;
					if (abs(_shift)>20) then {_shift_inc = -_shift_inc};
					[_shift,-1] call loki_get(FNC_MOVE_LAND_TARGETS);
				};
				[0,-1] call loki_get(FNC_MOVE_LAND_TARGETS);
			};
		};
	};
};
