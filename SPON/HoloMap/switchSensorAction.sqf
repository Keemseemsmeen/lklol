// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// Switch sensor that a projector shows information for.
//
// Parameters:
//   Action.
//
// Returns:
//   None.
//
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "holomap.inc.sqf"

// ----------------------------------------------------------------------------

SPON_GET_PARAMS_4(_object,_actor,_index,_params);

private ["_projector", "_sensor"];
SPON_EXPLODE_2(_params,_projector,_sensor);

_projector setVariable [SENSOR_VAR, _sensor];

nil; // Return.
