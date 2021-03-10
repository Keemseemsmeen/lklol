// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\removeEventHandler
//
// Description:
//   Removes an event handler previously registered with SPON_addEventHandler.
//
// Parameters:
//   0: _eventType - Type of event to handle [String].
//   1: _handlerIndex - Index of the event handler to remove [Scalar].
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_2(_eventType,_handlerIndex);

private ["_handlerFunctionsName", "_handlerFunctions"];

_handlerFunctionsName = _eventType + "_handlers";

if (isNil _handlerFunctionsName) then
{
	// ERROR!
}
else
{
	_handlerFunctions = call compile _handlerFunctionsName;
	if ((count _handlerFunctions) > _handlerIndex) then
	{
		_handlerFunctions set [_handlerIndex, nil];
	}
	else
	{
		// ERROR!
	};
};

SPON_TRACE_2("",_eventType,_handlerIndex);

nil; // Return.
