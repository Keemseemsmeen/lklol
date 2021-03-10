// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// Create a HoloMap in the mission.
//
// Parameters:
//   0: _projector - Projection object to create the HoloMap at [Position: [X, Y, Z]].
//   1: _sensorFunction - Function that returns the current sensor.
//        Sensor object acts as centre for detection of land and
//        vehicles [Code returning an Object].
//   2: _range - Distance from centre of map to the edge (so the width of the map
//        display will be _range * 2) Actual maximum range will be greater, since
//        display is square, not circular[Number: > 0]
//   3: _verticalMultiplier - Multiplier for all vertical heights. This should
//        generally be 1 (accurate scaling), but if you want to accentuate
//        the bumpiness of the terrain and vertical separation of flying
//        vehicles, then it should be a number higher than 1. If you want an
//        entirely "flat" map display, then this should be a very low number like
//        0.00000001. [Number > 0]
//   4: _side - Side which is shown as blue (others will be red). Use
//        sideLogic to make all blips unknown (red) [Side]
//
// Returns:
//   The "mapboard" object used as the base for the holographic projection [Object].
//
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "holomap.inc.sqf"

// ----------------------------------------------------------------------------

if (SPON_isDedicatedServer) exitWith {}; // Client-side only.

SPON_GET_PARAMS_5(_projector,_sensor,_horizontalScale,_verticalMultiplier,_side);

SPON_TRACE_5("",_projector,_sensor,_horizontalScale,_verticalMultiplier,_side);

// Set up things only once.
if (isNil "SPON_Holo_urbanAreas") then
{
	[] call SPON_monitorVehicles;

	["SPON_vehicleFound", SPON_Holo_addVehicleEventHandlers] call SPON_addEventHandler;

	{
		[_x] call SPON_Holo_addVehicleEventHandlers;
	} forEach SPON_vehicles;

	SPON_Holo_urbanAreas = nearestLocations [[0, 0, 0],
		["NameCityCapital", "NameCity", "NameVillage"], 100000];
	
	// _roads = ["asfatlka10 25", "asfaltka10 50", "asfaltka10 75", "asfatlka10 100",
		// "asfaltka6konec", "asfaltka6", "asfaltka12", "asfaltka25"];
	// SPON_Holo_roads = nearestObjects [[0, 0, 0], _roads, 100000];
	// player sideChat str count SPON_Holo_roads;
};

_projector setDir 0; // Always face north.
_projector setVariable [SENSOR_VAR, _sensor];
_projector setVariable [SIDE_VAR, _side];
_projector setVariable [HORIZ_SCALE_VAR, _horizontalScale];
_projector setVariable [VERT_SCALE_VAR, _horizontalScale / _verticalMultiplier];

SPON_PUSH(SPON_Holo_projectors,_projector);

// ------------------------------

if (isNil "SPON_Holo_updater") then
{
	SPON_Holo_updater = [] spawn
	{
		private ["_miniaturesUsedLastTime", "_redrawTerrainAt",
			"_miniaturesUsed", "_projector", "_sensor", "_redrawTerrain"];
		
		waitUntil { time > 3 };
		
		_miniaturesUsedLastTime = [];
		_redrawTerrainAt = 0;
		
		while { true } do
		{
			_miniaturesUsed = [];
			
			if (SPON_Holo_showTerrain and (time > _redrawTerrainAt)) then
			{
				_redrawTerrain = true;
				_redrawTerrainAt = time + TERRAIN_UPDATE_DELAY;
			}
			else
			{
				_redrawTerrain = false;
			};
			
			{
				_projector = _x;
				
				if (alive _projector) then
				{
					_sensor = _projector getVariable SENSOR_VAR;
					if ((alive (call _sensor)) and
						(((positionCameraToWorld [0, 0, 0]) distance _projector) <= MAX_DISTANCE_TO_SEE_MAP)) then
					{
						[_projector, BLIP_DURATION, _miniaturesUsed] call SPON_Holo_drawBlips;
						
						if (_redrawTerrain) then
						{
							[_projector, TERRAIN_DURATION] spawn SPON_Holo_drawTerrain;	
						};
					};
				};
			} forEach SPON_Holo_projectors;
			
			// Move unused miniatures away.
			{
				_x setPos [0, 0, 0];
			} forEach (_miniaturesUsedLastTime - _miniaturesUsed);
			
			_miniaturesUsedLastTime = _miniaturesUsed;
			
			sleep BLIPS_UPDATE_DELAY;
		};
	};
};

nil; // Return.
