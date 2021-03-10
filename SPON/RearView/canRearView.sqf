// SPON RearView v0.3.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\RearView\canRearView
//
// Description:
//   Can the player look in a rear-view mirror?
//
// Parameters:
//   None.
//
// Returns:
//   true if the player could look in a mirror if there was one on the vehicle.
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

#include "rearView.inc.sqf"

// -----------------------------------------------------------------------------

private ["_vehicle", "_validPosition"];

_vehicle = vehicle player;

// If we are in a Stryker, then mirrors are available ONLY when we are
// turned out. When turned out, the distance from the camera to the
// vehicle (centre) is slightly less.
if (_vehicle isKindOf "StrykerBase") then
{
	private ["_eyePosInModel", "_positions"];
	
	_eyePosInModel = _vehicle worldToModel (positionCameraToWorld [0, 0, 0]);
			
	// TOW position is a bit different to the other two.
	_positions = if (_vehicle isKindOf "Stryker_TOW") then
	{
		[STRYKER_TOW_DRIVER_TURNED_OUT_POS, STRYKER_TOW_DRIVER_TURNED_IN_ZOOMED_POS,
				STRYKER_TOW_DRIVER_TURNED_IN_UNZOOMED_POS]
	}
	else
	{
		[STRYKER_DRIVER_TURNED_OUT_POS, STRYKER_DRIVER_TURNED_IN_ZOOMED_POS,
				STRYKER_DRIVER_TURNED_IN_UNZOOMED_POS]
	};
	
	// If already looking in a mirror, then OK, as well as if in a position
	// that allows mirror/camera use.
	if ((SPON_RV_looking != NO_MIRROR) or
		(({ (_eyePosInModel distance _x) < CAMERA_POSITION_MARGIN } count
			_positions) > 0)) then
	{
		_validPosition = true;
	}
	else
	{
		_validPosition = false;
	};
}
else{if (_vehicle isKindOf "M1Abrams") then
{
	private ["_eyePosInModel"];
	
	_eyePosInModel = _vehicle worldToModel (positionCameraToWorld [0, 0, 0]);
	
	// If already looking in a mirror, then OK, as well as if in regular
	// turned-out position.
	if ((SPON_RV_looking != NO_MIRROR) or
		((_eyePosInModel distance ABRAMS_DRIVER_TURNED_IN_POS) < CAMERA_POSITION_MARGIN)) then
	{
		_validPosition = true;
	}
	else
	{
		_validPosition = false;
	};
}
else
{
	_validPosition = true; // Other vehicles assume you are in a valid position.
}; };

// Return value.
_validPosition and
	// Camera is on the vehicle or we are already in camera view.
	((cameraOn == _vehicle) or (SPON_RV_looking != NO_MIRROR)) and
	// Player in a vehicle, not on foot, in the driver position and still alive.
	(_vehicle != player) and
	(player == (driver _vehicle)) and
	(alive player) and
	// Mirror breaks when vehicle is too damaged.
	((getDammage _vehicle) <= MAX_VEHICLE_DAMAGE);
