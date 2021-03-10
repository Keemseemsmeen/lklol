// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\addEventHandler
//
// Description:
//   Registers an event handler for a specific event.
//
// Parameters:
//   0: _eventType - Type of event to handle [String].
//   1: _handlerCode - Code to call when event is raised [Code].
//
// Returns:
//   Index of the event handler (can be used with SPON_removeEventHandler).
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_2(_eventType,_handlerCode);

private ["_handlerFunctionsName", "_handlerFunctions", "_handlerIndex"];

// Run locally.
_handlerFunctionsName = _eventType + "_handlers";

if (isNil _handlerFunctionsName) then
{
	// No handlers for this event already exist, so make a new event type.
	call compile format ["%1 = [_handlerCode]", _handlerFunctionsName];
	_handlerIndex = 0;
	
	// Make sure that there is an event handler to catch global events.
	_eventType addPublicVariableEventHandler SPON_publishLocalEvent;
}
else
{
	// Handlers already recorded, so add another one.
	_handlerFunctions = call compile _handlerFunctionsName;
	_handlerIndex = count _handlerFunctions;
	SPON_PUSH(_handlerFunctions,_handlerCode);
};

SPON_TRACE_2("",_eventType,_handlerIndex);

_handlerIndex; // Return.
