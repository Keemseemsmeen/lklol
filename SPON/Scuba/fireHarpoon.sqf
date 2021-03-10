// SPON Scuba v0.1.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Map\fireHarpoon
//
// Description:
//   Fire a harpoon when underwater.
//  
// Parameters:
//   Normal for action.
//
// Returns:
//   nil
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// ----------------------------------------------------------------------------

_vectorDir = call SPON_Scuba_viewVector;

_spear = "roadCone" createVehicle (getPos player);
_spear setPos (positionCameraToWorld [0, 0, 2]);
//_spear = "R_M136_AT" createVehicle (positionCameraToWorld [0, 0, 10]);
//_spear = "B_556x45_Ball" createVehicle (positionCameraToWorld [0, 2, 0]);
_spear setVelocity [(_vectorDir select 0) * 20, (_vectorDir select 1) * 20, (_vectorDir select 2) * 20];

_dirAndUp = [[0, 0, 1], _vectorDir];
_spear setVectorDirAndUp _dirAndUp;
[_spear, _dirAndUp] spawn
{
	SPON_GET_PARAMS_2(_spear,_dirAndUp);
	
	_end = time + 10;
	
	waitUntil
	{
		_spear setVectorDirAndUp _dirAndUp;
		
		time > _end;
	};
	
	deleteVehicle _spear;
};

nil; // Return.
