
// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\initCore
//
// Description:
//   Initites the SPON Core component. This should be done BEFORE initiating any
//   component that relies on SPON Core.
// 
// Parameters:
//   0: _debugMode - What level of debugging is required
//      [String: "DEBUG_OFF" (default), "DEBUG_CLIENT" or "DEBUG_CLIENT_SERVER"]
//   1: _monitorVehiclesPollDelay - Period (seconds) between checks when
//      monitoring vehicles. Not used unless SPON_monitorVehicles is called later
//      [Number, defaults to 15]
//   2: _useActionForDebugLog - True means an action, rather than a key is used
//        to open the debug log (ignored if debug mode is off)
//       [Boolean, defaults to true]
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

#include "core.inc.sqf"
#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_DEFAULT_PARAM(0,_debugMode,DEBUG_MODE_OFF);
_debugMode = toUpper _debugMode;
SPON_GET_DEFAULT_PARAM(1,_monitorVehiclesPollDelay,DEFAULT_VEHICLE_MONITOR_DELAY);
SPON_GET_DEFAULT_PARAM(2,_useActionForDebugLog,false);

// Ensure that Core isn't initialised more than once.
if (not (isNil "SPON_Core_version")) exitWith
{
	SPON_TRACE_2("SPON Core run when already initialised",SPON_Core_version,"v0.5.3");
	nil; // Return.
};

SPON_Core_version = 'v0.5.3';

// Suppliment the standard isServer command.
SPON_isMP = (((playersNumber east) + (playersNumber west) +
	(playersNumber resistance) + (playersNumber civilian)) > 0);
SPON_isDedicatedClient = not isServer;

#ifdef SPON_ADDON

// Running from inside an addon. Check the initial camera position to see if we
// are on the dedicated or hosted server.
private "_cameraPos";
_cameraPos = positionCameraToWorld [0, 0, 0];
SPON_isClient = SPON_isDedicatedClient or ((_cameraPos select 0) != 0) or 
	((_cameraPos select 1) != 0) or ((_cameraPos select 2) >= 0);

#endif
// else
#ifndef SPON_ADDON

// Not running from inside an addon, so player will already have been created.
// This is a much less fudgy method of working out dedicated/host.
SPON_isClient = SPON_isDedicatedClient or (not (isNull player));

#endif

SPON_isDedicatedServer = (not SPON_isClient);

// Make sure error handling is working ASAP.
if (isNil "SPON_raiseError") then
{
	SPON_raiseError = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\raiseError.sqf";
};

if (not (requiredVersion '1.09')) exitWith
{
	// BUG: Seems to open a blank window.
// 	SPON_ERROR(format [localize "STR_SPON_CORE_BAD_ARMA_VERSION", REQUIRED_ARMA_VERSION]);
};

// Validate the debug mode string given.
private ["_validDebugModes"];
_validDebugModes = DEBUG_MODES;

SPON_ASSERT_OP(_debugMode,in,_validDebugModes,localize "STR_SPON_CORE_BAD_DEBUG_PARAM");

SPON_ASSERT_OP(time,==,0,localize "STR_SPON_CORE_STARTED_LATE");

SPON_monitorVehiclesPollDelay = _monitorVehiclesPollDelay;

// Some things are required by the debug log.
SPON_formatTime = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\formatTime.sqf";
SPON_addPermanentAction = compile preprocessFileLineNumbers
	"\loki_lost_key\SPON\Core\addPermanentAction.sqf";
call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initKeyEventHandlers.sqf";

// Init the debug log if required.
SPON_initDebugLog = compile	preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initDebugLog.sqf";

if (_debugMode in [DEBUG_MODE_CLIENT, DEBUG_MODE_CLIENT_SERVER]) then
{
	private ["_debugServer"];
	SPON_debugMode = true;
	
	_debugServer = (_debugMode == DEBUG_MODE_CLIENT_SERVER);
	
	[_debugServer, _useActionForDebugLog] call SPON_initDebugLog;
}
else
{
	SPON_debugMode = false;
};

// Init other sub-components.
call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initAssoc.sqf";
call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initSets.sqf";
call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initStrings.sqf";
call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initSort.sqf";
call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initEventHandlers.sqf";
call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initPublicObjectVariable.sqf";

// Allow for optional starting of vehicle monitoring at a later date.
SPON_monitorVehicles =
	compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\monitorVehicles.sqf";

SPON_TRACE_3("SPON Core initiated",_debugMode,_monitorVehiclesPollDelay,_useActionForDebugLog);

SPON_TRACE_4("",SPON_isClient,SPON_isMP,SPON_isDedicatedClient,SPON_isDedicatedServer);

nil; // Return.
