// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// Initalise the SPON HoloMap component.
//
// Parameters:
//   None.
//
// Returns:
//   None.
//
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "holomap.inc.sqf"

if (SPON_isDedicatedServer) exitWith {}; // Client-side only.

// ----------------------------------------------------------------------------
// Ensure that HoloMap isn't initialised more than once.
if (not (isNil "SPON_HoloMap_version")) exitWith
{
	private "_version";
	_version = 'v0.4.0';
	SPON_TRACE_2("SPON HoloMap run when already initialised",SPON_HoloMap_version,_version);
	
	nil; // Return.
};
SPON_HoloMap_version = 'v0.4.0';

// Ensure that isAddon is false if we are running from a mission-script.
#ifdef SPON_ADDON
SPON_HoloMap_isAddon = true;
#else
SPON_HoloMap_isAddon = false;
#endif

// ----------------------------------------------------------------------------

SPON_Holo_heightOffset =
{
	SPON_GET_PARAMS_1(_pos);
	
	// Return.
	if (surfaceIsWater _pos) then
	{
		TERRAIN_OFFSET / 2;
	}
	else
	{
		TERRAIN_OFFSET;
	};
};

// ----------------------------------------------------------------------------

SPON_Holo_blipColour =
{
	SPON_GET_PARAMS_2(_vehicle,_projectorSide);
	
	// Return.
	if ((alive _vehicle) and ((count (crew _vehicle)) > 0)) then
	{
		if (_projectorSide == (side _vehicle)) then
		{
			FRIENDLY_COLOUR;
		}
		else
		{
			NON_FRIENDLY_COLOUR;
		};
	}
	else
	{
		DEAD_COLOUR;
	};
};

// ----------------------------------------------------------------------------
// SPON_Holo_setJammingRange
//
// Description:
//   Make an object into a jamming device. If this is a vehicle, then jamming
//   will be "on" all the time the engine is on. A static object, such as a
//   radar tower, will always be jamming. Jamming completely disrupts all HoloMap
//   projectors and sensors in range and hides all blips within that range.
//
// Parameters:
//   0: _jammer - Vehicle or static object to act as a jammer [Object]
//   1: _range - Range of interference [Number: > 0]
//
SPON_Holo_setJammingRange =
{
	SPON_GET_PARAMS_2(_jammer,_range);
	private "_data";

	_data = [_jammer, _range];

	SPON_PUSH(SPON_Holo_jammers,_data);
};

// ----------------------------------------------------------------------------
// Is a particular object jammed from being to send and receive data?
SPON_Holo_isJammed =
{
	SPON_GET_PARAMS_1(_object);
	
	private ["_jammed", "_jammer", "_range"];
	
	_jammed = false;
	
	{
		SPON_EXPLODE_2(_x,_jammer,_range);
		
		if ((isEngineOn _jammer) and
			((_object distance _jammer) <= _range)) exitWith
		{
			_jammed = true;
		};
	} forEach SPON_Holo_jammers;
	
	_jammed; // Return.
};

// ----------------------------------------------------------------------------
// SPON_Holo_setStealth
//
// Description:
//   Sets stealth factor of a vehicle.
//
// Parameters:
//   0: _vehicle - Vehicle to give stealth to [Vehicle]
//   1: _factor - Amount by which detection range is reduced. If 0, then no
//      stealth at all(normal detection). If 0.4, then detected at 60% of normal
//      range. If 1.0, then never detected. [Number: 0.0 <= value <= 1.0]
//
// Returns:
//   _factor.
//
SPON_Holo_setStealth =
{
	SPON_GET_PARAMS_2(_vehicle,_factor);
	
	_factor = (_factor min 1) max 0;
	
	_vehicle setVariable [STEALTH_VAR, _factor];
	
	_factor; // Return.
};

// ----------------------------------------------------------------------------
// SPON_Holo_getStealth
//
// Description:
//   Gets the stealth factor of a vehicle.
//
// Parameters:
//   0: _vehicle - Vehicle to get stealth from [Vehicle]
//
// Returns:
//   _factor [Number: 0.0 <= value <= 1.0]
//
SPON_Holo_getStealth =
{
	SPON_GET_PARAMS_1(_vehicle);
	
	private "_factor";
	
	_factor = _vehicle getVariable STEALTH_VAR;
	
	// Return.
	if (isNil "_factor") then
	{
		0;
	}
	else
	{
		_factor;
	};
};

// ----------------------------------------------------------------------------

SPON_Holo_projector = compile preprocessFileLineNumbers "\loki_lost_key\SPON\HoloMap\projector.sqf";
SPON_Holo_drawTerrain = compile preprocessFileLineNumbers "\loki_lost_key\SPON\HoloMap\drawTerrain.sqf";
SPON_Holo_drawBlips = compile preprocessFileLineNumbers "\loki_lost_key\SPON\HoloMap\drawBlips.sqf";
SPON_Holo_terrainTextureColour = compile preprocessFileLineNumbers "\loki_lost_key\SPON\HoloMap\terrainTextureColour.sqf";
SPON_Holo_createMiniature = compile preprocessFileLineNumbers "\loki_lost_key\SPON\HoloMap\createMiniature.sqf";

// Measures the height of the terrain.
SPON_Holo_measurer = "Logic" createVehicleLocal [0, 0, 0];

// Check whether Deano's miniatures are loaded.
SPON_Holo_proxyAddonLoaded = isClass (configFile >> "CfgPatches" >> "dbo_minatures");

// Jamming devices.
SPON_Holo_jammers = [];

// Missile ammo that will be tracked.
SPON_Holo_missileClasses = ["M_Vikhr_AT", "M_Hellfire_AT", "M_Sidewinder_AA",
			"M_R73_AA",	"M_Ch29_AT", "Stryker_TOW", "M_TOW_AT", "M_AT5_AT",
			"M_Stinger_AA", "M_TOW_AT_TriPod"];
			
SPON_Holo_rocketClasses = []; // TODO:  implement.
SPON_Holo_bombClasses = []; // TODO: implement.
			
// Ensure that all vehicles that have missiles have the appropriate fired handlers
// so we can pick up missile-firing and incoming missile warnings.

SPON_Holo_addVehicleEventHandlers =
{
	SPON_GET_PARAMS_1(_vehicle);
	
	// TODO: Check whether the vehicle actually fires appropriate weapons before
	// adding handlers!
	
	_vehicle addEventHandler ["FIRED",
	{
		private "_ammo";
		_ammo = _this select 4;
		
		if (_ammo in SPON_Holo_missileClasses) then
		{
			SPON_GET_PARAMS_5(_firer,_dummy1,_dummy2,_dummy3,_missileClass);
			
			private "_missile";
			_missile = (getPos _firer) nearestObject _missileClass;
			
			SPON_PUSH(SPON_Holo_missiles,_missile);
		}
		else{if (_ammo in SPON_Holo_rocketClasses) then
		{
			SPON_GET_PARAMS_5(_firer,_dummy1,_dummy2,_dummy3,_rocketClass);
			
			private "_rocket";
			_rocket = (getPos _firer) nearestObject _rocketClass;
			
			SPON_PUSH(SPON_Holo_rockets,_rocket);
		}
		else{if (_ammo in SPON_Holo_bombClasses) then
		{
			SPON_GET_PARAMS_5(_firer,_dummy1,_dummy2,_dummy3,_bombClass);
			
			private "_bomb";
			_bomb = (getPos _firer) nearestObject _bombClass;
			
			SPON_PUSH(SPON_Holo_bomb,_bomb);
		}; }; };
		
		nil; // Return.
	}];
	
	// _vehicle addEventHandler ["INCOMINGMISSILE",
	// {
		// SPON_GET_PARAMS_3(_target,_missileClass,_firer);
		
		// private ["_missile", "_data"];
		
		// _missile = (getPos _firer) nearestObject _missileClass;
		// _missiles = nearestObjects [_firer, [_missileClass], 1000];
		
		// _data = [_missile, _target];
		
		// SPON_PUSH(SPON_Holo_incomingMissiles,_data);
		
		// player sideChat str [SPON_Holo_incomingMissiles, _missiles,(_missiles select 0) distance _firer];
		
		// // Should already be in the list, but double-check.
		// if (_missile in SPON_Holo_missiles) then
		// {
			// SPON_PUSH(SPON_Holo_missiles,_missile);
		// };
		
		// nil; // Return.
	// }];
};

SPON_Holo_missiles = []; // Missiles currently being tracked.
SPON_Holo_incomingMissiles = []; // Missiles currently being tracked, aimed at friendly vehicle.
SPON_Holo_rockets = []; // Rockets currently being tracked.
SPON_Holo_bombs = []; // Deadfall ordinance currently being tracked.

SPON_Holo_sensors = [];
SPON_Holo_projectors = [];

// Vehicles
SPON_Holo_useMiniatures = true; // Will use miniatures if available, else just use regular blips.

// Infantry.
SPON_Holo_showInfantry = true; // Show infantry on map.
SPON_Holo_showEnemyInfantry = true; // Show enemy, as well as friendly infantry (ignored unless SPON_Holo_showInfantry is true)
SPON_Holo_showNonGroupLeadersInfantry = false; // Shows all infantry, not just group leaders (ignored unless SPON_Holo_showInfantry is true)

// Terrain
SPON_Holo_showTerrain = true; // Render 3D terrain as well as blips.
SPON_Holo_showTextures = true; // Show ground textures on the terrain (urban, sand, grass) (Ignored unless SPON_Holo_showTerrain is true).
SPON_Holo_minHeight = 0; // Base height to render terrain. This is the effective height of the top of the projector box (set this higher than 0 for high altitude maps).
SPON_Holo_maxHeight = 800; // Height to show as maximum lightless (heights above this will all be the same shade, so hard to see the shape).
SPON_Holo_showSea = false; // Render the sea (costs FPS for little utility, so advised not to use it unless only one HoloMap is visible at a time).

// Vehicles.
SPON_Holo_showEnemySoftVehicles = true; // TODO: Implement
SPON_Holo_showFriendlySoftVehicles = true; // TODO: Implement

SPON_Holo_showEnemyArmouredVehicles = true; // TODO: Implement
SPON_Holo_showFriendlyArmouredVehicles = true; // TODO: Implement

SPON_Holo_showEnemyAirVehicles = true; // TODO: Implement
SPON_Holo_showFriendlyAirVehicles = true; // TODO: Implement

SPON_Holo_showEnemySurfaceCraft = false; // TODO: Implement
SPON_Holo_showFriendlySurfaceCraft = true; // TODO: Implement

SPON_Holo_showNonGroupLeadersVehicles = true; // TODO: Implement

SPON_TRACE("SPON HoloMap initialised");

nil; // Return.
