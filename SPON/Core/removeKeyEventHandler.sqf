// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\removeKeyEventHandler
//
// Description:
//   Removes an event handler previously registered with SPON_addKeyEventHandler.
//
// Parameters:
//   0: _eventType - Type of key event to handle ["Up" or "Down"].
//   1: _key - Keycode for the key to stop monitoring [Scalar].
//   2: _handlerIndex - Index of the key event handler to remove [Scalar].
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "core.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_3(_eventType,_key,_handlerIndex);

assert (_eventType in SPON_VALID_KEY_HANDLER_TYPES);

private ["_keyIndex", "_validType", "_keys", "_allHandlers"];

switch (toUpper(_eventType)) do
{
	case SPON_HANDLE_KEY_DOWN:
	{
		_keys = SPON_keyDownHandlerKeys;
		_allHandlers = SPON_keyDownHandlers;
		_validType = true;
	};
	case SPON_HANDLE_KEY_UP:
	{
		_keys = SPON_keyUpHandlerKeys;
		_allHandlers = SPON_keyUpHandlers;
		_validType = true;
	};
	default
	{
		SPON_TRACE_2("Unrecognised key event type",_eventType,_key);
		_index = -1;
		_validType = false;
	};
};
	
if (_validType) then
{
	_keyIndex = _keys find _key;
	
	if (_keyIndex >= 0) then
	{
		_handlers = _allHandlers select _keyIndex;
		_handlers set [_handlerIndex, nil];
		
		SPON_TRACE_3("",_eventType,_key,_handlerIndex);
	}
	else
	{
		SPON_TRACE_2("Key event wasn't handled",_eventType,_key);
	};
};

nil; // Return.
