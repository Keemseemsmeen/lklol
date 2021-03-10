_FNC_CREATE_UNIT = {
	private ["_index","_unit_type"];
	_index = _this select 0;
	_unit_type = _this select 1;
	_is_new = false;
	if (_index == -1) then {_index = (count loki_get(LAND_TARGETS));_is_new = true};
	_core = loki_get(CORE);
	_tdist = loki_get(TARGET_PROPS) select 0;
	_tspeed = loki_get(TARGET_PROPS) select 1;
	_tdir = loki_get(TARGET_PROPS) select 2;
	_dir = getDir _core;
	_pos = getPos _core;
	_offset = [(_tdist+20)*sin(_dir),(_tdist+20)*cos(_dir),0];
	_pos = [(_pos select 0)+(_offset select 0),(_pos select 1)+(_offset select 1),0];

	_unit = (loki_get(TARGET_GRP) createUnit [_unit_type,_pos,[],0.1,"NONE"]);
	//call compile format["_unit=loki_LT_%1",_count];
	//_unit = createVehicle [_veh_type, _pos, [], 0, "CAN_COLLIDE"];

	_unit setDir _tdir;
	{_unit removeMagazine _x} forEach magazines _unit;
	_unit setBehaviour "CARELESS"; 
	_unit allowFleeing 0; 
	_unit disableAI "TARGET";
	_unit disableAI "PATHPLAN";
	_unit setCombatMode "BLUE";
	_unit doWatch _core;
	_unit disableAI "MOVE";
	_unit stop true;

	switch (_index) do {
		case 0: {_unit setUnitPos "UP"};
		case 1: {_unit setUnitPos "MIDDLE"};
		case 2: {_unit setUnitPos "DOWN"};
		default {_unit setUnitPos "UP"};
	};	
	loki_set_arr(LAND_TARGETS,_index,_unit);

	_unit setVehicleVarName format["loki_LT_%1",_index]; 
	_unit call compile format["loki_LT_%1=_unit",_index];
	//hint on hit
	_unit addEventHandler["hit","hintSilent format['""%1"" hit, damage:%2',getText(configFile >> 'cfgVehicles' >> typeof (_this select 0) >> 'displayName'),ceil((_this select 2)*100)/100]; "]; 
	//hint when killed
	_unit addEventHandler["killed","hintSilent format['""%1"" killed',getText(configFile >> 'cfgVehicles' >> typeof (_this select 0) >> 'displayName')];"];

	//trigger that will replace dead unit
	_trgname=format["loki_Trig_%1",_index];
	call compile format["%1=createTrigger[""EmptyDetector"",[0,0]]",_trgname];
	call compile format["%1 setTriggerArea[0,0,0,true]",_trgname];
	call compile format["%1 setTriggerActivation[""NONE"",""PRESENT"",false]",_trgname];
	call compile format["%1 setTriggerTimeout[5,5,5,true]",_trgname];
	call compile format["%1 setTriggerStatements[""!(alive loki_LT_%2)"", ""deleteVehicle loki_Trig_%2; if (!isNull(loki_logic getVariable """"LAND_TARGETS"""" select %2)) then {deleteVehicle loki_LT_%2;[%2,""""%3""""] call (loki_logic getVariable """"FNC_CREATE_UNIT"""");}"", """"]",_trgname,_index,_unit_type];
	//hint format ["%1",[_index,_trgname]];
	if ((loki_get(TARGET_PROPS) select 1)==0) then {
		if (_is_new) then {
			[0,-1] call loki_get(FNC_MOVE_LAND_TARGETS);
		}else{
			[0,_index] call loki_get(FNC_MOVE_LAND_TARGETS);
		};
	};
	_unit
};

_FNC_CREATE_CREW = {
	_veh = _this select 0;
	_crew = getArray(configFile >> "cfgVehicles" >> typeOf _veh >> "typicalCargo");
	_count = 0;
	{
		_unit = (loki_get(TARGET_GRP) createUnit [_x,[0,0,0],[],0.1,"NONE"]);
		//call compile format["_unit=loki_LT_%1",_count];
		//_unit = createVehicle [_veh_type, _pos, [], 0, "CAN_COLLIDE"];
		{_unit removeMagazine _x} forEach magazines _unit;
		_unit allowFleeing 0; 
		_unit disableAI "TARGET";
		_unit disableAI "PATHPLAN";
		_unit disableAI "MOVE";
		_unit stop true;
		_unit doWatch loki_get(CORE);

		switch (_count) do {
			case 0: {_unit moveInDriver _veh};
			case 1: {_unit moveInGunner _veh};
			case 2: {_unit moveInCommander _veh};
			default {_unit moveInCargo _veh};
		};
		_count = _count + 1;
	} forEach _crew;
};

_FNC_CREATE_LAND_TARGET_VEHICLE = {
	_index = _this select 0;
	_veh_type = _this select 1;
	_is_new = false;
	if (_index == -1) then {_index = (count loki_get(LAND_TARGETS));_is_new = true};
	_core = loki_get(CORE);
	_tdist = loki_get(TARGET_PROPS) select 0;
	_tspeed = loki_get(TARGET_PROPS) select 1;
	_tdir = loki_get(TARGET_PROPS) select 2;
	_dir = getDir _core;
	_pos = getPos _core;
	_offset = [(_tdist+20)*sin(_dir),(_tdist+20)*cos(_dir),0];
	_pos = [(_pos select 0)+(_offset select 0),(_pos select 1)+(_offset select 1),0];

	_veh = createVehicle [_veh_type, [0,0,1000], [], 0, "CAN_COLLIDE"];
	_veh setDir _tdir; 
	_veh setPos _pos; 
	_veh setVehicleAmmo 0;
	_veh engineOn true;
	[_veh] call loki_get(FNC_CREATE_CREW);
	loki_set_arr(LAND_TARGETS,_index,_veh);
	loki_set_arr(CREW,_index,crew _veh);
	if !(_veh isKindOf "Plane") then {_veh flyInHeight 5;};
	_veh doWatch _core;
	_veh setVehicleVarName format["loki_LT_%1",_index]; 
	_veh call compile format["loki_LT_%1=_veh",_index];
	//hint on hit
	_veh addEventHandler["hit","hintSilent format['""%1"" hit\ndamage:%2\ncrew status: %3',getText(configFile >> 'cfgVehicles' >> typeof (_this select 0) >> 'displayName'),ceil((_this select 2)*100)/100,[(_this select 0)] call {_crew = crew (_this select 0);_crew_stat = [];{_crew_stat set [count _crew_stat, damage _x]} forEach _crew;_crew_stat}]; "]; 
	//hint on killed
	_veh addEventHandler["killed","hintSilent format['""%1"" killed',getText(configFile >> 'cfgVehicles' >> typeof (_this select 0) >> 'displayName')];"];
	//trigger that will replace vehicle
	_trgname=format["loki_Trig_%1",_index];
	call compile format["%1=createTrigger[""EmptyDetector"",[0,0]]",_trgname];
	call compile format["%1 setTriggerArea[0,0,0,true]",_trgname];
	call compile format["%1 setTriggerActivation[""NONE"",""PRESENT"",false]",_trgname];
	call compile format["%1 setTriggerTimeout[5,5,5,true]",_trgname];
	call compile format["%1 setTriggerStatements[""!(alive loki_LT_%2)or([loki_LT_%2] call {_crew = crew (_this select 0);_crew_dead = true;{if (alive _x) then {_crew_dead = false;};} forEach _crew;_crew_dead})"", ""deleteVehicle loki_Trig_%2; if (!isNull((loki_logic getVariable """"LAND_TARGETS"""") select %2)) then {hintsilent """"Replacing %3"""";deleteVehicle loki_LT_%2; {deleteVehicle _x} forEach ((loki_logic getVariable """"CREW"""") select %2);[%2,""""%3""""] call (loki_logic getVariable """"FNC_CREATE_LAND_TARGET_VEHICLE"""");}"", """"]",_trgname,_index,_veh_type];
	if ((loki_get(TARGET_PROPS) select 1)==0) then {
		if (_is_new) then {
			[0,-1] call loki_get(FNC_MOVE_LAND_TARGETS);
		}else{
			[0,_index] call loki_get(FNC_MOVE_LAND_TARGETS);
		};
	};
	_veh
};

_FNC_CREATE_CREW_AIR = {
	_veh = _this select 0;
	//_crew = getArray(configFile >> "cfgVehicles" >> typeOf _veh >> "typicalCargo");
	_crew = [getText(configFile >> "cfgVehicles" >> typeOf _veh >> "crew")];
	_count = 0;
	{
		_unit = (loki_get(AIR_TARGET_GRP) createUnit [_x,[0,0,0],[],0.1,"NONE"]);
		//call compile format["_unit=loki_LT_%1",_count];
		//_unit = createVehicle [_veh_type, _pos, [], 0, "CAN_COLLIDE"];
		{_unit removeMagazine _x} forEach magazines _unit;
		_unit allowFleeing 0; 
		_unit disableAI "TARGET";
		//_unit disableAI "PATHPLAN";
		_unit doWatch objNull;
		//_unit disableAI "MOVE";
		_unit stop true;

		switch (_count) do {
			case 0: {_unit moveInDriver _veh};
			case 1: {_unit moveInGunner _veh};
			case 2: {_unit moveInCommander _veh};
			default {_unit moveInCargo _veh};
		};
		_count = _count + 1;
	} forEach _crew;
};

_FNC_CREATE_AIR_TARGET = {
	_index = _this select 0;
	_veh_type = _this select 1;
	_count = count loki_get(AIR_TARGETS);
	if (_index == -1) then {_index = _count;};
	
		
	_core = loki_get(CORE);
	_tdist = loki_get(TARGET_PROPS) select 0;
	_tspeed = loki_get(TARGET_PROPS) select 1;
	_tdir = loki_get(TARGET_PROPS) select 2;
	_dir = getDir _core;
	_pos = getPos _core;
	_veh = createVehicle [_veh_type, [0,0,1000], [], 0, "FLY"];
	_veh setDir _dir; 
	_veh setPos [_pos select 0,_pos select 1,10]; 
	_veh setVehicleAmmo 0;
	_veh engineOn true;
	_veh setVelocity [80*sin(_dir),80*cos(_dir),10];
	[_veh] call loki_get(FNC_CREATE_CREW_AIR);
	loki_set_arr(AIR_TARGETS,_index,_veh);
	loki_set_arr(loki_CREW_AIR,_index,crew _veh);
	_veh flyInHeight 300;

	_veh setVehicleVarName format["loki_AT_%1",_index]; 
	_veh call compile format["loki_AT_%1=_veh",_index];
	_veh addEventHandler["hit","hintSilent format['""%1"" hit\ndamage:%2\ncrew status: %3',getText(configFile >> 'cfgVehicles' >> typeof (_this select 0) >> 'displayName'),ceil((_this select 2)*100)/100,[(_this select 0)] call {_crew = crew (_this select 0);_crew_stat = [];{_crew_stat set [count _crew_stat, damage _x]} forEach _crew;_crew_stat}]; "]; 
	_veh addEventHandler["killed","hintSilent format['""%1"" killed',getText(configFile >> 'cfgVehicles' >> typeof (_this select 0) >> 'displayName')];"];

	_trgname=format["loki_Trig_%1",_index];
	call compile format["%1=createTrigger[""EmptyDetector"",[0,0]]",_trgname];
	call compile format["%1 setTriggerArea[0,0,0,true]",_trgname];
	call compile format["%1 setTriggerActivation[""NONE"",""PRESENT"",false]",_trgname];
	call compile format["%1 setTriggerTimeout[5,5,5,true]",_trgname];
	call compile format["%1 setTriggerStatements[""!(alive loki_AT_%2)or([loki_AT_%2] call {_crew = crew (_this select 0);_crew_dead = true;{if (alive _x) then {_crew_dead = false;};} forEach _crew;_crew_dead})"", ""deleteVehicle loki_Trig_%2; if (!isNull((loki_logic getVariable """"AIR_TARGETS"""") select %2)) then {hintsilent """"Replacing %3"""";deleteVehicle loki_AT_%2; {deleteVehicle _x} forEach ((loki_logic getVariable """"CREW_AIR"""") select %2);[%2,""""%3""""] call (loki_logic getVariable """"FNC_CREATE_AIR_TARGET"""");}"", """"]",_trgname,_index,_veh_type];
	_veh
};

_FNC_MOVE_LAND_TARGETS = {
	_side_offset = _this select 0;
	_move_only = _this select 1;
	_count = (count loki_get(LAND_TARGETS));
	_center_offset = 0;
	_core = loki_get(CORE);
	_tdist = loki_get(TARGET_PROPS) select 0;
	_tspeed = loki_get(TARGET_PROPS) select 1;
	_tdir = loki_get(TARGET_PROPS) select 2;
	_dir = getDir _core;
	_pos = getPos _core;
	_size = 2;
	_sizeArray = [];
	_betweenArray = [];
	for "_i" from 0 to (count loki_get(LAND_TARGETS))-1 do {
		_unit = loki_get(LAND_TARGETS) select _i;
		if (typeOf(_unit) isKindOf "man") then {_size = 1;}
		else{_size = 3+abs(5*sin(_dir-_tdir))};
		if (typeOf(_unit) isKindOf "air") then {_size = 12};
		_between = _size;
		if (count _sizeArray > 0) then {_between = (_sizeArray select (_i-1)) + _between;
		}else{_between = 0};
		_center_offset = _center_offset + _size;
		_sizeArray set [count _sizeArray,_size];
		_betweenArray set [count _betweenArray,_between];
	};
	_side_offset = _side_offset - _center_offset/2;

	if (_move_only != -1) exitWith {
		_unit = loki_get(LAND_TARGETS) select _move_only;
		for "_i" from 0 to _move_only do {
		_side_offset = _side_offset + (_betweenArray select _i)};
		_offset = [_side_offset*sin(_dir+90)+_tdist*sin(_dir),_side_offset*cos(_dir+90)+_tdist*cos(_dir),0];
		_tpos = [(_pos select 0)+(_offset select 0),(_pos select 1)+(_offset select 1),0];
		_unit setPos _tpos;
		_unit setDir _tdir;
	};
	for "_i" from 0 to (count loki_get(LAND_TARGETS))-1 do {
		_unit = loki_get(LAND_TARGETS) select _i;
		_between = _betweenArray select _i;
		//if !isNil{_sizeArray select (_i-1)} then {_between = (_sizeArray select (_i-1)) max _between;};
		//if !isNil{_sizeArray select (_i+1)} then {_between = (_sizeArray select (_i+1)) max _between;};
		_side_offset = _side_offset + _between;
		//hint format ["%1",[_sizeArray,_side_offset]]; 
		_offset = [_side_offset*sin(_dir+90)+_tdist*sin(_dir),_side_offset*cos(_dir+90)+_tdist*cos(_dir),0];
		_tpos = [(_pos select 0)+(_offset select 0),(_pos select 1)+(_offset select 1),0];
		_unit setPos _tpos;
		_unit setDir _tdir;
	};
};

loki_set(FNC_CREATE_UNIT,_FNC_CREATE_UNIT);
loki_set(FNC_CREATE_CREW,_FNC_CREATE_CREW);
loki_set(FNC_CREATE_LAND_TARGET_VEHICLE,_FNC_CREATE_LAND_TARGET_VEHICLE);
loki_set(FNC_CREATE_CREW_AIR,_FNC_CREATE_CREW_AIR);
loki_set(FNC_CREATE_AIR_TARGET,_FNC_CREATE_AIR_TARGET);
loki_set(FNC_MOVE_LAND_TARGETS,_FNC_MOVE_LAND_TARGETS);

_booster_keyhandler = 
{
	private["_handled","_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
	_ctrl = _this select 0;
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	_handled = false;
	if (!_shift && !_ctrlKey && !_alt && (_dikCode == 18)&&(vehicle player != player)) then {
			
			_ctrl = nil;
			_handled = true;
			_veh = vehicle player;
			_vel = velocity _veh;
			_pos = getPos _veh;
			_dir = getdir _veh;
			_pitch = acos((vectorUp _veh) select 2);
			_vel_new = [((_vel select 0) + 10*sin(_dir)),((_vel select 1) + 10*cos(_dir)),((_vel select 2) + 10*sin(_pitch))];
			_veh setVelocity _vel_new;
		};


	_handled;
};
loki_set(booster_keyhandler,_booster_keyhandler);
