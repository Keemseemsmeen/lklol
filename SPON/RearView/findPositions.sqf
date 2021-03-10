// SPON RearView v0.3.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\RearView\findPositions
//
// Description:
//
// Parameters:
//   0: _vehicle - Vehicle to check for mirror definitions.
//
// Returns:
//   Array of mirror positions for the vehicle, or [] if no mirrors defined.
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_2(_vehicle,_isCamera);

// Find the vehicle details in list of those that have mirrors.
private ["_hasMirrors", "_vehiclePositions", "_allPositions", "_type"];

_allPositions = if _isCamera then
{
	SPON_RV_cameraPositions;
}
else
{
	SPON_RV_mirrorPositions;
};

_hasMirrors = false;

{
	_type = _x select 0;
	
	if (_vehicle isKindOf _type) exitWith
	{
		_vehiclePositions = _x select 1;
		_hasMirrors = true;
	};
		
} forEach _allPositions;

// Add the mirror positions to a vehicle with mirror positions set.
if (_hasMirrors) then
{
	SPON_TRACE_3("Found mirrors",typeOf _vehicle,_vehiclePositions,_isCamera);
}
else
{
	SPON_TRACE_2("No mirrors defined",typeOf _vehicle,_isCamera);
};

// Return value.
if (_hasMirrors) then
{
	_vehiclePositions;
}
else
{
	[];
};
