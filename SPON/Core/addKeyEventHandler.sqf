// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\addKeyEventHandler
//
// Description:
//   Registers an event handler for a specific key event.
//
// Parameters:
//   0: _eventType - Type of key event to handle [String: "UP" or "DOWN"].
//   1: _key - Keycode to detect [Scalar].
//   1: _code - Code to call when key event is raised [Code].
//
// Returns:
//   Index of the key event handler (can be used with SPON_removeKeyEventHandler).
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "core.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_3(_eventType,_key,_code);

private ["_keyIndex", "_validType", "_handlerIndex", "_keys", "_allHandlers"];

// Check whether we are using an up or down handler.
switch (toUpper(_eventType)) do
{
	case SPON_HANDLE_KEY_DOWN:
	{
		_keys = SPON_keyDownHandlerKeys;
		_allHandlers = SPON_keyDownHandlers;
		
	};
	case SPON_HANDLE_KEY_UP:
	{
		_keys = SPON_keyUpHandlerKeys;
		_allHandlers = SPON_keyUpHandlers;
	};
	default
	{
		SPON_TRACE_1("Invalid key event handler type",_eventType);
		["Invalid key event handler type:" + _eventType] call SPON_raiseError;
	};
};

// Add this new key event handler to the list.
_keyIndex = _keys find _key;
if (_keyIndex >= 0) then
{
	// Handlers for this key already exist, so add to this list.
	_handlers = _allHandlers select _keyIndex;
	SPON_PUSH(_handlers,_code);
	_handlerIndex = (count _handlers) - 1;
}
else
{
	// No other handlers for this key, so add a new list of handlers.
	SPON_PUSH(_keys,_key);
	SPON_PUSH(_allHandlers,[_code]);
	_handlerIndex = 0;
};

SPON_TRACE_3("Added handler",_eventType,_key,_handlerIndex);

// Initialise the key event handlers with the game, if they haven't already been set.
if (not SPON_keyEventHandlersSet) then
{
	SPON_keyEventHandlersSet = true;
	
	[] spawn
	{
		// Ensure that the display is loaded before trying to add handlers.
		waitUntil { not (isNull (findDisplay MASTER_DISPLAY_IDD)) };
		
		sleep 1; // Give Schule time to take the event handlers if he wants them.
		
		if ((isNil "S_displayEventHandler_KeyDown_add") or (isNil "S_displayEventHandler_KeyUp_add")) then
		{
			private ["_rootdisplay"];
			disableSerialization;
			// Take handler for exclusive use.
			_rootdisplay = findDisplay MASTER_DISPLAY_IDD;
			_rootdisplay displaySetEventHandler ["KeyUp", "_this call SPON_keyUpHandler;"];
			_rootdisplay displaySetEventHandler ["KeyDown", "_this call SPON_keyDownHandler;"];
		}
		else
		{
			// Make SPON Key events just a wrapper for Schule's handlers.
			["SPON_Core", "_this call SPON_keyDownHandler;"] call S_displayEventHandler_KeyDown_add;
			["SPON_Core", "_this call SPON_keyUpHandler;"] call S_displayEventHandler_KeyUp_add;
		};
	};
};

_handlerIndex; // Return.
