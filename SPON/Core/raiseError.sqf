// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\raiseError
//
// Description:
//   Raises an error dialog, with a message and an edit area that can be copied
//   from. This does not require SPON_debugMode to be , since it will always
//   work. Thus, it should only be used for critical errors.
//
// Parameters:
//   0: _message (String)
//   1: _title (String: defaults to "Error!").
//
// -----------------------------------------------------------------------------

#include "ui\handles.hpp"
#include "macros\macros.inc.sqf"
#include "core.inc.sqf"

SPON_GET_PARAMS_1(_message);
SPON_GET_DEFAULT_PARAM(1,_title,nil);

if (SPON_isDedicatedServer) exitWith {}; // TODO: Broadcast message to players.

private ["_raise"];

_raise =
{
	SPON_GET_PARAMS_3(_message,_title,_timestamp);
	
	private ["_ok", "_now"];
	
//	_ok = createDialog "SPON_Core_ErrorDialog";
	if (not _ok) then
	{
//		SPON_TRACE_2(localize "SPON_CORE_FAILED_OPEN_ERROR_DIALOG",_title,_message);
	};
	
	// Set title.
	if (not (isNil "_title")) then
	{
		ctrlSetText [SPON_ERROR_TITLE_IDC, _title];
	};
	
	// Set message.
	_timestamp = ([_timestamp, true] call SPON_formatTime) + ": ";
	
	ctrlSetText [SPON_ERROR_MESSAGE_IDC, _timestamp + _message];
	ctrlSetText [SPON_ERROR_EDIT_IDC, _timestamp + _title + ": " + _message];
};

// Don't show errors right at the start of the game, since we won't see them.
if (time > 3) then
{
	[_message, _title, time] call _raise;
}
else
{
	[_message, _title, time, _raise] spawn
	{
		SPON_GET_PARAMS_4(_message,_title,_timestamp,_raise);
		
		waitUntil { time >= 3 };
		
		[_message, _title, _timestamp] call _raise;
	};
};

nil; // Return.
