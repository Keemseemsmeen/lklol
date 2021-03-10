// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// Get texture at a given position.
//
// Parameters:
//   0: _pos - Position to check.
//
// Returns:
//   Terrain colour [Colour array].
//
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "holomap.inc.sqf"

// ----------------------------------------------------------------------------

SPON_GET_PARAMS_1(_pos);

private "_colour";

if (SPON_Holo_showTextures) then
{
	// Urban colour is always used in capitals, cities and villages.
	{
		if (_pos in _x) exitWith
		{
			_colour = [0.2, 0.2, 0.2, 1];
		};
	} forEach SPON_Holo_urbanAreas;
	
	// Use the ground textures if not urban.
	if (isNil "_colour") then
	{
		_colour = if (surfaceIsWater _pos) then
		{
			[0.1, 0.1, 1, 0.3];
		}
		else
		{
			switch (surfaceType _pos) do
			{
				case "#SandGeneral":  { [1, 0.75, 0, 1]; }; // Desert sand.
				case "#D2Sand":       { [1, 0.75, 0, 1]; }; // Desert sand on Porto.
				case "#SandBeach":    { [1, 1, 0, 1]; }; // Beach sand.
				
				case "#RockNorth":    { [0.4, 0.3, 0.3, 1]; }; // Couple of spots in N Sara.
				
				case "#GrassGeneral": { [0.2, 0.5, 0, 1]; }; // Couple of spots in N Sara.
				case "#GrassSouth":   { [0.5, 0.8, 0, 1]; }; // All over S Sara.
				case "#Grass":        { [0.2, 0.9, 0, 1]; }; // All over N Sara.
				
				case "#CityGround":   { [0.2, 0.2, 0.2, 1]; }; // Couple of spots on Sara.
				
				case "#Default":      { [0.2, 0.9, 0, 1]; }; // No idea!
				
				default
				{
					SPON_TRACE_1("Unknown surfaceType", surfaceType _pos);
					[0, 1, 0, 1];
				};
			};
		};
	};
}
else
{
	_colour = [0.2, 0.9, 0, 1];
};

_colour; // Return.
