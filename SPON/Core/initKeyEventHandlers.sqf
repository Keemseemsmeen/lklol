// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\initKeyEventHandlers
//
// Description:
//   Initialise key event handling.
//
// Parameters:
//   None
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

// Ensure the file is not run multiple times or on the server.
if (SPON_isDedicatedServer or (not (isNil {SPON_keyUpHandlers}))) exitWith {};

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------
// Function: SPON_keyUpHandler
//
// Description:
//   Handle key up events.
//
// Parameters:
//   0: _display - Main display, on which the event was caught [Display]
//   1: _keyCode - Keycode of the key released [Integer]
//   2: _shift - Was shift key pressed? [Boolean]
//   3: _control - Was control key pressed? [Boolean]
//   4: _alt - Was alt key pressed? [Boolean]
//
// Returns:
//   true if the key event has been handled, otherwise false
//
// -----------------------------------------------------------------------------
SPON_keyUpHandler =
{
	SPON_GET_PARAMS_5(_display,_keyCode,_shift,_control,_alt);
		
	private ["_keyIndex", "_handled"];
	
	_keyIndex = SPON_keyUpHandlerKeys find _keyCode;
	
	// SPON_TRACE_6("SPON_keyUpHandler (detected)",_keyCode,_shift,_control,_alt,_keyIndex,SPON_keyUpHandlerKeys);
	
	_handled = false;
	if (_keyIndex >= 0) then
	{
		private ["_handlers"];
		_handlers = SPON_keyUpHandlers select _keyIndex;
		
		scopeName "SPON_keyUpHandlerLoop";
		
		{
			if (SPON_IS_CODE(_x)) then
			{
				_handled = [_keyCode, _shift, _control, _alt] call _x;
				
				if (isNil "_handled") then
				{
					SPON_ERROR("Key handler MUST return true or false, rather than nil");
				}
				else{if (not SPON_IS_BOOL(_handled)) then
				{
					SPON_ERROR(format ["Key handler MUST return true or false, rather than %1",_handled]);
				}
				else{if (_handled) then
				{
					SPON_TRACE_4("SPON_keyUpHandler (handled)",_keyCode,_shift,_control,_alt);
					breakTo "SPON_keyUpHandlerLoop";
				}; }; };
			};
		} forEach _handlers;
	};
	
	_handled; // Return.
};

// -----------------------------------------------------------------------------
// Function: SPON_keyDownHandler
//
// Description:
//   Handle key down events.
//
// Parameters:
//   As SPON_keyUpHandler, above.
//
// Returns:
//   true if the key event has been handled, otherwise false
//
// -----------------------------------------------------------------------------
SPON_keyDownHandler =
{
	SPON_GET_PARAMS_5(_display,_keyCode,_shift,_control,_alt);
	
	private ["_keyIndex", "_handled"];
	
	_keyIndex = SPON_keyDownHandlerKeys find _keyCode;
	
	// SPON_TRACE_6("SPON_keyDownHandler (detected)",_keyCode,_shift,_control,_alt,_keyIndex,SPON_keyDownHandlerKeys);
	
	_handled = false;
	if (_keyIndex >= 0) then
	{
		private ["_handlers"];
		_handlers = SPON_keyDownHandlers select _keyIndex;
		
		scopeName "SPON_keyDownHandlerLoop";
		
		{
			if (SPON_IS_CODE(_x)) then
			{
				_handled = [_keyCode, _shift, _control, _alt] call _x;
				
				if (isNil "_handled") then
				{
					SPON_ERROR("Key handler MUST return true or false, rather than nil");
				}
				else{if (not SPON_IS_BOOL(_handled)) then
				{
					SPON_ERROR(format ["Key handler MUST return true or false, rather than %1",_handled]);
				}
				else{if (_handled) then
				{
					SPON_TRACE_4("SPON_keyDownHandler (handled)",_keyCode,_shift,_control,_alt);
					breakTo "SPON_keyDownHandlerLoop";
				}; }; };
			};
		} forEach _handlers;
	};
	
	_handled; // Return.
};

// Pre-load required functions.
SPON_addKeyEventHandler = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\addKeyEventHandler.sqf";
SPON_removeKeyEventHandler = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\removeKeyEventHandler.sqf";

// Handlers for key-down events (Association: Integer -> Code)
SPON_keyDownHandlerKeys = [];
SPON_keyDownHandlers = [];

// Handlers for key-up events (Association: Integer -> Code)
SPON_keyUpHandlerKeys = [];
SPON_keyUpHandlers = [];

// UI event handlers are only set if someone adds a key event handler.
SPON_keyEventHandlersSet = false;

nil; // Return.
