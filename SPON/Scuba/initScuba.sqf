// SPON Scuba v0.1.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Map\initScuba
//
// Description:
//   Initialise Scuba diving for the player.
//  
// Parameters:
//   None.
//
// Returns:
//   nil
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "scuba.inc.sqf"

// -----------------------------------------------------------------------------

// Everything after this point is client-only.
if (SPON_isDedicatedServer) exitWith { nil; };

// -----------------------------------------------------------------------------
// Ensure that Scuba isn't initialised more than once.
if (not (isNil "SPON_Scuba_version")) exitWith
{
	private "_version";
	_version = 'v0.1.0';
	SPON_TRACE_2("SPON Scuba run when already initialised",SPON_Scuba_version,_version);
	
	nil; // Return.
};

SPON_Scuba_version = 'v0.1.0';

// Ensure that isAddon is false if we are running from a mission-script.
if (isNil "SPON_Scuba_isAddon") then
{
	SPON_Scuba_isAddon = false;
};

// ----------------------------------------------------------------------------
// Work out the depth of water at a given position.
SPON_Scuba_seaDepthAt =
{
	SPON_GET_PARAMS_1(_pos);
	
	private ["_depthMeasurer", "_depth"];
	
	_depthMeasurer = "WeaponHolder" createVehicleLocal [_pos select 0, _pos select 1];
	_depth = (getPos _depthMeasurer) select 2;
	deleteVehicle _depthMeasurer;
			
	_depth; // Return.
};

// ----------------------------------------------------------------------------
// Equips the weapon requested.
SPON_Scuba_equipWeapon =
{
	SPON_GET_PARAMS_2(_person,_weapon);

	_muzzle = (getArray (configFile >> "CfgWeapons" >>
		_weapon >> "muzzles")) select 0;
	
	if (_muzzle == "this") then
	{
		_muzzle = _weapon;
	};
	
	player selectWeapon _muzzle;
	
	nil; // Return.
};

// ----------------------------------------------------------------------------
// Works out what, if any, hand weapon the player is using.
SPON_Scuba_getHandWeapon =
{
	SPON_GET_PARAMS_1(_person);
	
	private "_weapon";
	_weapon = "";
	
	{
		if (getNumber (configFile >> "CfgWeapons" >> _x >> "type") ==
			TYPE_HAND_WEAPON) exitWith
		{
			_weapon = _x;	
		};
	} forEach (weapons _person);
	
	_weapon; // Return.
};

// ----------------------------------------------------------------------------
// Checks if a string has a particular prefix.
SPON_Scuba_hasPrefix =
{
	SPON_GET_PARAMS_2(_string,_prefix);
	
	private ["_stringArray", "_prefixArray"];
	
	_stringArray = toArray _string;
	_prefixArray = toArray _prefix;
	
	if ((count _prefixArray) > (count _stringArray)) exitWith { false };
	
	_stringArray resize (count _prefixArray);
	
	(toString _stringArray) == _prefix; // Return.
};

// ----------------------------------------------------------------------------
// Is scubaing possible for the player at the current time?
SPON_Scuba_isPossible =
{
	SPON_ON_FOOT(player) and (surfaceIsWater (getPos player)) and
		(((getPos player) select 2) < 0.25) and
		([animationState player, SWIM_ANIM_PREFIX] call SPON_Scuba_hasPrefix); // Return.
};

// ----------------------------------------------------------------------------
// Create, remove or update the action which allows player to place a satchel charge.
SPON_Scuba_updatePutSatchelAction =
{
	private ["_numSatchels"];
	player removeAction SPON_Scuba_putSatchelAction;

	_numSatchels = player getVariable "SPON_Scuba_numSatchels";
	if (_numSatchels > 0) then
	{
		_label = format [localize "STR_SPON_SCUBA_PUT_SATCHEL", _numSatchels];
		SPON_Scuba_putSatchelAction = player addAction [_label,
			"\loki_lost_key\SPON\Scuba\putSatchel.sqf", nil, 0, false, true];
	}
	else
	{
		SPON_Scuba_putSatchelAction = -1;
	};
	
	nil; // Return.
};

// ----------------------------------------------------------------------------
// Pressing the toggle-light key.
SPON_Scuba_toggleLight =
{
	if (SPON_Scuba_lightCanBeToggled and SPON_Scuba_diving) then
	{
		[player, player, -1] execVM "\loki_lost_key\SPON\Scuba\toggleLight.sqf";
		
		SPON_Scuba_lightCanBeToggled = false;
	};
	
	false; // Return.
};

// ----------------------------------------------------------------------------
// Releasing the toggle-light key.
SPON_Scuba_toggleLightReenable =
{
	SPON_Scuba_lightCanBeToggled = true;
	
	false; // Return.
};

// ----------------------------------------------------------------------------

SPON_Scuba_updateLightAction =
{
	SPON_GET_PARAMS_1(_visible);
	
	player removeAction SPON_Scuba_lightAction;
	SPON_Scuba_lightAction = -1;
	
	if (_visible) then
	{
		private ["_label"];
		
		if (isNull SPON_Scuba_light) then
		{
			_label = "STR_SPON_SCUBA_LIGHT_ON";
		}
		else
		{
			_label = "STR_SPON_SCUBA_LIGHT_OFF";
		};
		
		SPON_Scuba_lightAction = player addAction [localize _label,
			"\loki_lost_key\SPON\Scuba\toggleLight.sqf", nil, 0, false, true];
	}
	else
	{
		deleteVehicle SPON_Scuba_light;
	};
	
	nil; // Return.
};

// ----------------------------------------------------------------------------
// Preserve someone's gear while they are swimming.
SPON_Scuba_preserveGear =
{
	SPON_GET_PARAMS_1(_man);
	
	private ["_savedWeapons", "_savedMagazines", "_numSatchels"];
	
	// Save magazines, except small magazines, which aren't washed away.
	_savedMagazines = [];
	{
		if ((getNumber (configFile >> "CfgMagazines" >> _x >> "type")) != MAGAZINE_SMALL) then
		{
			SPON_PUSH(_savedMagazines,_x);
			_man removeMagazine _x;
		};
	} forEach (magazines _man);
	
	// Satchels are saved separately.
	_numSatchels = { _x == "PipeBomb" } count _savedMagazines;
	_man setVariable ["SPON_Scuba_numSatchels", _numSatchels];
	
	_savedMagazines = _savedMagazines - ["PipeBomb"];
	_man setVariable ["SPON_Scuba_savedMagazines", _savedMagazines];
	
	// Save weapons, except any pistol, which isn't washed away.
	_savedWeapons = (weapons _man) - [[_man] call SPON_Scuba_getHandWeapon];
	
	{
		_man removeWeapon _x;
	} forEach _savedWeapons;
	
	_man setVariable ["SPON_Scuba_savedWeapons", _savedWeapons];
	
	SPON_TRACE_4("Preserved weapons",_man,_savedWeapons,_savedMagazines,_numSatchels);
	
	_nil; // Return.
};

// ----------------------------------------------------------------------------
// Restore someone's gear after they have been swimming.
SPON_Scuba_restoreGear =
{
	SPON_GET_PARAMS_1(_man);
		
	private ["_savedWeapons", "_savedMagazines", "_numSatchels"];
	
	// Restore magazines first, to allow them to automatically be loaded.
	_savedMagazines = _man getVariable "SPON_Scuba_savedMagazines";	
	{
		_man addMagazine _x;
	} forEach _savedMagazines;
	
	_numSatchels = _man getVariable "SPON_Scuba_numSatchels";	
	for "_i" from 1 to _numSatchels do
	{
		_man addMagazine "PipeBomb";
	};
	
	// Restore weapons.
	_savedWeapons = _man getVariable "SPON_Scuba_savedWeapons";	
	{
		_man addWeapon _x;
	} forEach _savedWeapons;
	
	// Choose primary, else handweapon, else secondary weapon.
	_handWeapon = [_man] call SPON_Scuba_getHandWeapon;
	if ((primaryWeapon _man) != "") then
	{
		[_man, primaryWeapon _man] call SPON_Scuba_equipWeapon;
	}
	else{if (_handWeapon != "") then
	{
		[_man, _handWeapon] call SPON_Scuba_equipWeapon;
	}
	else{if ((secondaryWeapon _man) != "") then
	{
		[_man, secondaryWeapon _man] call SPON_Scuba_equipWeapon;
	}; }; };
	
	SPON_TRACE_4("Restored weapons",_man,_savedWeapons,_savedMagazines,_numSatchels);
	
	_nil; // Return.
};

// ----------------------------------------------------------------------------

SPON_Scuba_handleUpOn =
{
	SPON_Scuba_goingUp = true;
	
	false;
};

// ----------------------------------------------------------------------------

SPON_Scuba_handleUpOff =
{
	SPON_Scuba_goingUp = false;
	
	false;
};

// ----------------------------------------------------------------------------

SPON_Scuba_handleDownOn =
{
	SPON_Scuba_goingDown = true;
	
	false;
};

// ----------------------------------------------------------------------------

SPON_Scuba_handleDownOff =
{
	SPON_Scuba_goingDown = false;
	
	false;
};

// ----------------------------------------------------------------------------

SPON_Scuba_enableForPlayer =
{
	SPON_GET_PARAMS_1(_value);
	
	if (not SPON_Scuba_enabledForPlayer) then
	{
		[_value] spawn SPON_Scuba_monitorPlayer;
	};
	
	SPON_Scuba_enableForPlayer = true;
	
	nil; // Return.
};
	
// ----------------------------------------------------------------------------
	
// Push other players down while they are scubaing.
// BUG: Doesn't prevent flickering and just prevents the player from turning.
// ["SPON_Scuba_startedScuba",	{
	// _this spawn
	// {
		// SPON_GET_PARAMS_2(_person,_swimmingWeight);
		
		// player sideChat str ["Started weigting down", _person, _swimmingWeight];
		
		// private ["_pos", "_depth"];
		
		// waitUntil
		// {
			// if ((alive _person) and (not (isNull _swimmingWeight)) and
				// surfaceIsWater (getPos _person)) then
			// {
				// _depth = (getPos _swimmingWeight) select 2;
				
				// if (_depth < 0) then
				// {
					// _pos = getPos _person;
					// _pos set [2, _depth];
					// _person setPos _pos;
				// };
				
				// false; // Continue.
			// }
			// else
			// {
				// true; // End.
			// };
		// };
		
		// player sideChat str ["Stopped weigting down", _person, _swimmingWeight];
	// };
	
	// nil; // Return.
// }] call SPON_addEventHandler;

SPON_Scuba_enabledForPlayer = false;

SPON_Scuba_monitorPlayer = compile preprocessFileLineNumbers
	"\loki_lost_key\SPON\Scuba\monitorPlayer.sqf";

nil; // Return.
