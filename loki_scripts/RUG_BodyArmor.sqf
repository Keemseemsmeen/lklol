//RUG_BodyArmor by Wolfrug (www.ofpec.com)
//
//Calling: nul = [player, 3, -5000] execVM "zulu\scripts\RUG_BodyArmor.sqf";
//UnitName : Name of unit, can be 'this' in the init field, or _x if used with foreach
//Mode : 0, 1, 2 or 3. 
//0 = Once armor is depleted, it can never be recharged (except by calling the script again).
//1 = Armor returns fully after each revival
//2 = Armor returns fully once unit has been fully healed after revival
//3 = Armor is never depleted: unit can be knocked down but not killed (except by scripting)
//MaxDam : Must be a number less than 0: determines total body armor. -1 = 3 total, -2 = 6 total etc.
//Note : due to the usage of eventhandlers, you should avoid calling this script more than once on any unit!
//Enjoy! - Wolfrug

//Set this to false to disable the hints!
RUG_BA_Debug = true;

private ["_unit", "_mode", "_dam"];

_unit = _this select 0;
_mode = _this select 1;
_dam = _this select 2;

if ((count _this) > 3) exitWith {_this call RUG_BA_Action};

//Inits script
if (_dam < 0) exitWith 
{
	if (isNil "RUG_BA") then 
	{
	RUG_BA = compile preprocessfilelinenumbers "\loki_lost_key\loki_scripts\RUG_BodyArmor.sqf";
	RUG_BA_Action = {
			private ["_unit", "_caller", "_id", "_mode"];
			_unit = _this select 0;
			_caller = _this select 1;
			_id = _this select 2;
			_mode = _unit getVariable "RUG_BA_Mode";
			if (((_unit distance _caller) > 3 && _unit == Player) OR _unit == _caller) exitWith {};
			if ((_unit distance _caller) > 3 && _caller !=Player) then 
				{
				_caller doMove (getpos _unit);
				waitUntil {((_caller distance _unit) < 3) OR (unitReady _caller) OR (!alive _caller)};
				};
			if ((_caller distance _unit) > 3 OR (!alive _caller)) exitWith {};					  			if (not (alive _unit) ) exitWith {_unit removeAction _id};
			_caller playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 8;
			if (alive _caller && alive _unit) then {if (_mode !=3) then {_unit setDamage ((damage _unit) - 0.1)};
								_unit removeAction _id;
								if (_mode ==3) then {_unit setVariable ["RUG_BodyArmor", 0]};
								};
			_caller doFollow (leader _caller);
			};
	RUG_BA_AIAction = {
			private ["_unit", "_id", "_dam","_maxdam", "_side", "_trig", "_foundhelper", "_helper"];
			_unit = _this select 0;
			_id = _this select 1;
			_dam = damage _unit;
			_maxdam = _unit getVariable "RUG_BA_MaxD";
			_side = switch (side _unit) do {case west: {"WEST"}; 
							case east: {"EAST"};														case resistance: {"GUER"};
							case civilian: {"CIV"};
							};
			_trig = createtrigger ["EmptyDetector", getpos _unit];
			_trig setTriggerArea [50, 50, 0, false];
			_trig settriggerActivation [_side, "PRESENT", true];
			sleep 1;
			_foundHelper = false;
			if (_mode != 3) then 
					{
					_condition = {(damage _unit) >= _dam}
					} 
					else 
					{
					_condition = {(_unit getVariable "RUG_BodyArmor") > _maxdam}
					}; 
			while _condition do 
			{
			_list = ((list _trig) - [_unit]);
			if ((count _list) > 0) then {_helper = _list select (floor (random (count _list)))};
			if (isNull (_helper findNearestEnemy (position _helper))) then {_foundHelper = true};
			if (!_foundHelper) then {
						if (_helper distance (_helper findNearestEnemy (position _helper)) > 100) 							then {_foundHelper = true};
						};
			if (_helper != Player && _foundHelper && vehicle _helper == _helper) then 
				{
				_helper action ["USER", _unit, _id];
				waitUntil {((_helper distance _unit) < 3) OR (unitReady _helper) OR (!alive _helper)};
				if (RUG_BA_Debug) then {hint format ["%1 is helping %2!", _helper, _unit]};
				sleep 10;
				};
			
			sleep 5;
			};
			deleteVehicle _trig;
			};			


	RUG_BA_Down = {
			private ["_unit", "_dam", "_EH", "_mode", "_id", "_text"];
			_unit = _this select 0;
			_dam = _this select 1;
			_EH = _unit getVariable "RUG_BA_EH";
			_mode = _unit getVariable "RUG_BA_Mode";
			
			_unit action ["eject", vehicle _unit];
			if (_mode != 3) then {_unit removeEventhandler ["hit", _EH]};
			if (_mode != 3) then {_unit setdamage _dam}; 
			_unit switchmove "DeadState";
			_unit setcaptive true;
			_unit stop true;
			_text = format ["Perform first aid on %1", _unit];
			_id = _unit addAction [_text, "\loki_lk\ln_scripts\magic\RUG_BodyArmor.sqf", _id, 9.8, true, true];
			[_unit, _id] spawn RUG_BA_AIAction;
			if (RUG_BA_Debug) then {hint format ["%1 is down!", _unit]};
			_timer = [] spawn {sleep (10 + (random 15))};
			if (_mode !=3) then 
			{
			waitUntil {scriptDone _timer OR (damage _unit < _dam)}
			} 
			else 
			{
			waitUntil {scriptDone _timer OR (_unit getVariable "RUG_BodyArmor") == 0};
			};
			_unit removeAction _id;
			_unit stop false;
			if (RUG_BA_Debug) then {hint format ["%1 is back up!", _unit]};
			// Checks different modes;
			
			switch (_mode) do 
			{
			case 0: {};
			case 1: {//Full armor return after revival
				_unit setdamage -5;
				_EH = _unit addEventHandler ["hit", {_this call RUG_BA}];
				_unit setvariable ["RUG_BA_EH", _EH];
				_unit setVariable ["RUG_BodyArmor", 0];
				};
			case 2: {//"Medevac" mode -> unit only get their armor back after getting fully healed
				_unit spawn 
					{
					waitUntil {damage _this == 0};
					_this setdamage -5;
					_EH = _this addEventHandler ["hit", {_this call RUG_BA}];
					_this setvariable ["RUG_BA_EH", _EH];
					_this setVariable ["RUG_BodyArmor", 0];
					}; 
				};
			case 3: {
				_unit setdamage -500; 
				_unit setVariable ["RUG_BodyArmor", 0];
				};
				
			};
			
			_unit switchMove "AmovPpneMstpSrasWrflDnon";
			_unit setcaptive false;
			};
	}; 
_unit setdamage -5;
if (_mode == 3) then {_unit setdamage -500};
_EH = _unit addEventHandler ["hit", {_this call RUG_BA}];
_maxdam = (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "armor") * -(_dam));

_unit setvariable ["RUG_BA_EH", _EH];
_unit setVariable ["RUG_BA_Mode", _mode];
_unit setVariable ["RUG_BA_MaxD", _maxdam];
_unit setVariable ["RUG_BodyArmor", 0];
};

//Actual script

_bodydam = _unit getvariable "RUG_BodyArmor";
_maxdam = _unit getvariable "RUG_BA_MaxD";
_mode = _unit getVariable "RUG_BA_Mode";

_curDam = _bodydam + _dam;
_unit setvariable ["RUG_BodyArmor", _curDam];


if (RUG_BA_Debug) then {hint format ["Unit:%1\nDamage:%2\nCurrent/Max:%3/%4", _unit, _dam, _curDam, _maxdam]};


if (_curDam > _maxdam) then 
{

[_unit, _dam] spawn RUG_BA_Down; if (_mode == 3) then {_unit setdamage -500};

} 

else {_unit setdamage -5; if (_mode == 3) then {_unit setDamage -500}};
