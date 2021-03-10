// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\initEventHandlers
//
// Description:
//   Initialise the use of global, remote and local event handling.
//
// -----------------------------------------------------------------------------

// File may be called several times, but only init once.
if (not (isNil "SPON_publishGlobalEvent")) exitWith {};

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------
// Function: SPON_publishGlobalEvent
//
// Description:
//   Raises a SPON event on all machines, including the local one.
//
// Parameters:
//   0: _eventType - Type of event to publish [String].
//   1: _params - Parameters to pass to the event handlers [Array].
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
SPON_publishGlobalEvent =
{
	_this call SPON_publishRemoteEvent;
	_this call SPON_publishLocalEvent;
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
// Function: SPON_publishRemoteEvent
//
// Description:
//   Raises a SPON event on all machines EXCEPT the local one.
//
// Parameters:
//   0: _eventType - Type of event to publish [String].
//   1: _params - Parameters to pass to the event handlers [Array].
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
SPON_publishRemoteEvent =
{
	SPON_GET_PARAMS_2(_eventType,_params);
	
	// Run remotely.
	call compile format ["%1 = _params", _eventType];
	publicVariable _eventType;
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
// Function: SPON_publishLocalEvent
//
// Description:
//   Raises a SPON event only on the local machine.
//
// Parameters:
//   0: _eventType - Type of event to publish [String].
//   1: _params - Parameters to pass to the event handlers [Array].
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
SPON_publishLocalEvent =
{
	SPON_GET_PARAMS_2(_eventType,_params);
	
	private ["_handlerFunctionsName", "_handlerFunctions"];
	
	// Run locally.
	_handlerFunctionsName = _eventType + "_handlers";
	
	if (not (isNil _handlerFunctionsName)) then
	{
		_handlerFunctions = call compile _handlerFunctionsName;
		
		{
			if (not (isNil "_x")) then
			{
				_params call _x;
			};
		} forEach _handlerFunctions;
	};
	
	nil; // Return.
};

// -----------------------------------------------------------------------------

// Pre-load required functions.
SPON_addEventHandler = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\addEventHandler.sqf";
SPON_removeEventHandler = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\removeEventHandler.sqf";

nil; // Return.
