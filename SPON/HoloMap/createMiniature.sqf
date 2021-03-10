// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// Get a miniature for a given vehicle.
//
// Parameters:
//   0: _vehicle - Position to check.
//
// Returns:
//   Newly created miniature to represent the vehicle [Vehicle].
//
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "holomap.inc.sqf"

// ----------------------------------------------------------------------------
SPON_GET_PARAMS_1(_vehicle);

_class = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "SPON_Holo_miniature");

if (_class == "") then
{
	_class = if (_vehicle isKindOf "Air") then
	{
		if (_vehicle isKindOf "Plane") then
		{
			"dbo_av8b";
		}
		else // Helo.
		{
			if (_vehicle isKindOf "KA50") then
			{
				"dbo_ka52";
			}
			else
			{
				"dbo_cobra"; // "AH1W"
			};
		};
	}
	else{if (_vehicle isKindOf "Ship") then
	{
		"dbo_rhib";
	}
	else
	{
		"dbo_hmmv";
	}; };
};

_class createVehicleLocal [0, 0, 0]; // Return.
