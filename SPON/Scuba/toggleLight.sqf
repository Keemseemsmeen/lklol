// SPON Scuba v0.1.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Map\toggleLight
//
// Description:
//   Toggle the underwater light on/off.
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

_object removeAction _index;

if (isNull SPON_Scuba_light) then
{
	SPON_Scuba_light = "#LightPoint" createVehicleLocal (getPos player);
	
	[SPON_Scuba_light] spawn
	{
		SPON_GET_PARAMS_1(_light);
		
		waitUntil
		{
			if (isNull _light) then
			{
				true; // Exit.
			}
			else
			{
				// When near the surface, a light would illuminate the whole
				// world, so turn it off.
				if (SPON_Scuba_playerDepth < -0.4) then
				{
					SPON_Scuba_light setLightBrightness 0.7;
				}
				else
				{
					SPON_Scuba_light setLightBrightness 0;
				};
			};
		};
	};
	
	SPON_Scuba_light lightAttachObject [player, [0, 1, -2]];

	SPON_Scuba_light setLightAmbient [0.4, 0.8, 1.0];
	//SPON_Scuba_light setLightAmbient [0, 0, 0];
	SPON_Scuba_light setLightColor[0.4, 0.8, 1.0];
	//SPON_Scuba_light setLightColor[0, 0, 0];
}
else
{
	deleteVehicle SPON_Scuba_light;
	SPON_Scuba_light = objNull;
};

[true] call SPON_Scuba_updateLightAction;

nil; // Return.
