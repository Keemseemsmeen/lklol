// SPON Scuba v0.1.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Map\touchOff
//
// Description:
//   Explodes any satchels that you already had placed.
//  
// Parameters:
//   Normal for action.
//
// Returns:
//   nil
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// ----------------------------------------------------------------------------

SPON_GET_PARAMS_3(_object,_actor,_index);

if (_actor != _object) exitWith {}; // AI can't do it!

player removeAction _index;

if (isNil "SPON_Scuba_bombs") exitWith {};

// Create bomb objects, setting them off and removing the old bomb proxy.
private ["_bombs"];
_bombs = [];

{
	_bomb = "Bomb" createVehicle (getPos _x);
	_bomb setPos (getPos _x);
	_bomb setDamage 1;
	SPON_PUSH(_bombs,_bomb);
	
	deleteVehicle _x;
} forEach SPON_Scuba_bombs;

// Wait for the bombs to explode before cleaning up.
sleep 0.01;

{
	deleteVehicle _x;
} forEach _bombs;

SPON_Scuba_bombs = [];

nil; // Return.

