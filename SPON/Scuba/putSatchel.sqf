// SPON Scuba v0.1.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Map\putSatchel
//
// Description:
//   Action for the player that allows them to put any satchels into the sea
//   for later detonation.
//
// Parameters:
//   Normal for action.
//
// Returns:
//   nil
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// ----------------------------------------------------------------------------

SPON_GET_PARAMS_3(_object,_actor,_index);

if (_actor != _object) exitWith {}; // Must self-detonate!

_numSatchels = _object getVariable "SPON_Scuba_numSatchels";

if (_numSatchels <= 0) exitWith {};

if (isNil "SPON_Scuba_bombs") then
{
	SPON_Scuba_bombs = [];
};

// Create a satchel object as proxy.
_bomb = "PipeBomb" createVehicle (getPos player);
_bomb setPos (player modelToWorld [0, 1, -0.2]);

SPON_PUSH(SPON_Scuba_bombs,_bomb);

// Reduce the number of satchels carried and re-create the place action.
_numSatchels = _numSatchels - 1;
_object setVariable ["SPON_Scuba_numSatchels", _numSatchels];
[] call SPON_Scuba_updatePutSatchelAction;

// Create or re-create a touch-off action for the player.
player removeAction SPON_Scuba_touchOffSatchelAction;
SPON_Scuba_touchOffSatchelAction = -1;

if ((count SPON_Scuba_bombs) > 0) then
{
	private [ "_label"];
	if ((count SPON_Scuba_bombs) > 1) then
	{
		_label = localize "STR_SPON_SCUBA_TOUCH_OFF_SATCHEL_MULTI";
	}
	else
	{
		_label = localize "STR_SPON_SCUBA_TOUCH_OFF_SATCHEL";
	};
	
	_label = format [_label, (count SPON_Scuba_bombs)];

	SPON_Scuba_touchOffSatchelAction = player addAction [_label, "\loki_lost_key\SPON\Scuba\touchOff.sqf", nil, -1, false, true];
};

nil; // Return.

