// ["Man", civilian] execVM "\loki_lost_key\menus\listVehicles.sqf";
// ["Car", resistance] execVM "\loki_lost_key\menus\listVehicles.sqf";
// ["Tank", east] execVM "\loki_lost_key\menus\listVehicles.sqf";

_baseType = _this select 0;
_side = _this select 1;

_side = switch (_side) do
{
	case east: { 0 };
	case west: { 1 };
	case resistance: { 2 };
	case civilian: { 3 };
};

lbClear 72011;

if (_baseType == "") exitWith {};

_vehicles = configFile >> "CfgVehicles";

_badPics = ["bin\config.bin/CfgVehicles/PaperCar/picture", "bin\config.bin/CfgVehicles/StaticObject/picture"];

for "_i" from 0 to ((count _vehicles) - 1) do
{
	_vehicle = _vehicles select _i;
	if (isClass _vehicle) then
	{
		if (((getNumber (_vehicle >> "scope")) != 0) and 
			((configName _vehicle) isKindOf _baseType)) then
		{
			if ((getNumber (_vehicle >> "side")) == _side) then
			{
				lbAdd [72011, getText(_vehicle >> "displayName")];
				lbSetData [72011, ((lbSize 72011) - 1), configName _vehicle];
				if (isText (_vehicle >> "picture")) then
				{diag_log getText (_vehicle >> "picture");
					if (not ((getText (_vehicle >> "picture")) in _badPics)) then
					{
						lbSetPicture [72011, ((lbSize 72011) - 1), getText(_vehicle >> "picture")];

					};
				};
			};
		};
	};
};


LOKI_createAVehicle =
{
	private ["_class", "_pos", "_object"];
	
	_class = _this select 0;
	_pos = _this select 1;
	
	_object = if (_class isKindOf "Animal") then
	{
		createAgent [_class, _pos, [], 0, "NONE"];
	}
	else{if (_class isKindOf "Man") then
	{
	
		if (_class isKindOf "SoldierWB") then 
		{
		CenterWest = createCenter West;
		_center_W = CenterWest;
		_group_1 = createGroup _center_W;
		_unit_1 = objNull;
		if (true) then
		{
		_this = _group_1 createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
		_unit_1 = _this;

		_unit_1 enableAI "MOVE";
		West setFriend [East, 0.1];West setFriend [Resistance, 0.72];West setFriend [Civilian, 1];
		};
		};
	
		if (_class isKindOf "SoldierEB") then 
		{
		CenterEast = createCenter east;
		_center_E = CenterEast;
		_group_1 = createGroup _center_E;
		_unit_1 = objNull;
		if (true) then
		{
		_this = _group_1 createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
		_unit_1 = _this;

		_unit_1 enableAI "MOVE";
		East setFriend [Resistance, 0.72];East setFriend [West, 0.1];East setFriend [Civilian, 1];
		};
		};
		
		if (_class isKindOf "SoldierGB") then 
		{
		CenterGuer = createCenter resistance;
		_center_G = CenterGuer;
		_group_1 = createGroup _center_G;
		_unit_1 = objNull;
		if (true) then
		{
		_this = _group_1 createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
		_unit_1 = _this;

		_unit_1 enableAI "MOVE";
		Resistance setFriend [East, 0.72];Resistance setFriend [West, 0.72];Resistance setFriend [Civilian, 0.72];
		};
		};
	
		if (_class isKindOf "Civilian") then 
		{
		CenterCiv = createCenter civilian;
		_center_C = CenterCiv;
		_group_1 = createGroup _center_C;
		_unit_1 = objNull;
		if (true) then
		{
		_this = _group_1 createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
		_unit_1 = _this;

		_unit_1 enableAI "MOVE";
		Civilian setFriend [East, 1];Civilian setFriend [West, 1];Civilian setFriend [Resistance, 1];
		};
		};		
		
		
	}
	else
	{
		_class createVehicle (_pos);
	};
	
	player reveal _object;
	
	hint "Unit is on the way...";
	
	nil;
};
};

// Normal Request button..
Request2 =
{
	private ["_class"];
	_class = lbData [72011,lbCurSel 72011];
	
	[_class, getPos player] call LOKI_createAVehicle;
	
	nil;
};

//MapClick request button
Request =
{
	private ["_class"];
	_class = lbData [72011,lbCurSel 72011];
	hint "Select Map Position";
	onMapSingleClick format ["['%1', _pos] call LOKI_createAVehicle; onMapSingleClick '';true;", _class];
	
	
	nil;
};

lbSetCurSel [72011,0];

