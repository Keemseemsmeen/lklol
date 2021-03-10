// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\initDebugLog
//
// Description:
//   Initialise the debugging log.
//
// Parameters:
//   0: _serverLogging - Whether to log messages on the server and broadcast
//                       then to all players [Boolean]
//   1: _useAction - Set up an action to open the debug log, rather than key.
//        [Boolean]
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

// Ensure the file is not run multiple times or on the server.
if (not (isNil "SPON_debugAppendLog")) exitWith {};

#include "macros\macros.inc.sqf"
#include "ui\handles.hpp"
#include "core.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_2(_serverLogging,_useAction);
SPON_Core_serverLogging = _serverLogging;

// -----------------------------------------------------------------------------

// Most of the log functionality is on the client-side.
if (SPON_isDedicatedServer) then
{
	// -------------------------------------------------------------------------
	// Function: SPON_debugAppendLog (DEDICATED SERVER VERSION)
	//
	// Parameters:
	//   0: _message - Message to append to the log [String]
	//
	// Returns:
	//   nil
	//
	if (SPON_Core_serverLogging) then
	{
		SPON_debugAppendLog2 =
		{
			SPON_GET_PARAMS_2(_file,_message);
			
			private "_entry";
			_entry = [time, _file, _message];
			
			// The dedicated server broadcasts the log message to the clients.
			if (SPON_serverLogUnqueued) then
			{
				[SERVER_DEBUG_EVENT, _entry] call SPON_publishRemoteEvent;
			}
			else // There is still an "early" queue to utilise.
			{
				SPON_PUSH(SPON_serverLogQueue,_entry);
				
				// Start a thread to send the queue, but only if it doesn't
				// already exist.
				if (isNil "SPON_serverLogQueueSender") then
				{
					SPON_serverLogQueueSender = [] spawn
					{
						// Wait until the timer has started before sending out
						// debug messages from the server to clients.
						waitUntil { time > 0; };
						
						{
							[SERVER_DEBUG_EVENT, [_x]] call SPON_publishRemoteEvent;
						} forEach SPON_serverLogQueue;
					
						// This signals that queue doesn't need to be used any
						// more.
						SPON_serverLogUnqueued = true;
						SPON_serverLogQueue = nil;
						SPON_serverLogQueueSender = nil;
					};
				};
			};
		
			nil; // Return;
		};
		
		// Used by SPON_debugAppendLog (DEDICATED SERVER VERSION) to queue up
		// early messages that wouldn't be picked up by the client.
		SPON_serverLogQueue = [];
		SPON_serverLogUnqueued = false;
	}
	else // not SPON_Core_serverLogging
	{
		// Just make a null function, so debug messages aren't propagated.
		SPON_debugAppendLog = {};
	};
}
else // (not SPON_isDedicatedServer)
{
	// -------------------------------------------------------------------------
	// Function: SPON_debugAppendLog (CLIENT VERSION)
	//
	// Parameters:
	//   0: _message - Message to append to the log [String]
	//
	// Returns:
	//   nil
	//
	// Called from:
	//   Client.
	//
	SPON_debugAppendLog2 =
	{
		SPON_GET_PARAMS_2(_file,_message);
		
		private ["_dialog", "_entry"];
		
		_entry = [time, _file, _message];
		
		// MP-clients (Or SP host) just deal with the messages directly.
		SPON_PUSH(SPON_debugClientLog,_entry);
		
		// If the client log is visible, append new message immediately.
		_dialog = findDisplay SPON_DEBUG_DISPLAY_IDD;
		
		if (not (isNull _dialog)) then
		{
			(_dialog displayCtrl SPON_Core_debugClientListIdc) lbAdd
				(_entry call SPON_Core_formatLogEntry);
			
			if (SPON_debugLogUpdates) then
			{
				SELECT_LAST_ELEMENT(SPON_Core_debugClientListIdc);
			};
		};

		nil; // Return;
	};
};

// Backward compatibility.
SPON_debugAppendLog = { ["", _this select 0] call SPON_debugAppendLog2 };

// -----------------------------------------------------------------------------

if (SPON_isClient) then
{	
	// -------------------------------------------------------------------------
	// Function: SPON_Core_formatLogEntry
	//
	// Description:
	//   Format a log entry into text.
	//
	// Parameters:
	//   0: _timestamp [Number]
	//   1: _file
	//   2: _message [String]
	//
	// Returns:
	//   Formatted log entry.
	//
	SPON_Core_formatLogEntry =
	{
		SPON_GET_PARAMS_3(_timestamp,_file,_message);
		
		if (_file == "") then
		{
			format ["%1 %2", [_timestamp, true] call SPON_formatTime,
				_message];
		}
		else
		{
			format ["%1 [%2] %3", [_timestamp, true] call SPON_formatTime,
				_file, _message];
		};
	};
	
	// -------------------------------------------------------------------------
	// Function: SPON_debugFillLog
	//
	// Description:
	//   Fills the debug log list-boxes with all current messages.
	//
	// Parameters:
	//   None.
	//
	// Returns:
	//   nil
	//
	SPON_debugFillLog =
	{
		private "_logMessage";
		
		// Fill client log.
		lbClear SPON_Core_debugClientListIdc;
		{
			lbAdd [SPON_Core_debugClientListIdc, _x call SPON_Core_formatLogEntry];
		} forEach SPON_debugClientLog;
		
		if (SPON_debugLogUpdates) then
		{
			SELECT_LAST_ELEMENT(SPON_Core_debugClientListIdc);
		};
		
		// Fill server log.
		lbClear SPON_DEBUG_SERVER_LIST_IDC;
		{	
			lbAdd [SPON_DEBUG_SERVER_LIST_IDC, _x call SPON_Core_formatLogEntry];
		} forEach SPON_debugServerLog;
		
		if (SPON_debugLogUpdates) then
		{
			SELECT_LAST_ELEMENT(SPON_DEBUG_SERVER_LIST_IDC);
		};
		
		nil; // Return.
	};
	
	// -------------------------------------------------------------------------
	// Function: SPON_debugToggleAutoUpdate
	//
	// Description:
	//  Toggles automatic tracking of the newest message in the log.
	//
	// Parameters:
	//   None.
	//
	// Returns:
	//   nil
	//
	SPON_debugToggleAutoUpdate =
	{
		private ["_text"];
		
		SPON_debugLogUpdates = not SPON_debugLogUpdates;
		
		if (SPON_debugLogUpdates) then
		{
			_text = "STR_SPON_DEBUG_ON";
		}
		else
		{
			_text = "STR_SPON_DEBUG_OFF";
		};
		
		ctrlSetText [SPON_DEBUG_UPDATE_STATUS_IDC, localize _text];
		
		// Push both logs down to the end if auto-updating started.
		if (SPON_debugLogUpdates) then
		{
			SELECT_LAST_ELEMENT(SPON_Core_debugClientListIdc);
			SELECT_LAST_ELEMENT(SPON_DEBUG_SERVER_LIST_IDC);
		};
		
		nil; // Return.
	};
	
	// -------------------------------------------------------------------------
	SPON_debugClientLog = [];
	SPON_debugServerLog = [];
	SPON_debugLogUpdates = false;

	// Pick up server logging messages.
	if (SPON_isDedicatedClient and SPON_Core_serverLogging) then
	{
		// Register for server debug events.
		[SERVER_DEBUG_EVENT,
			{
				private "_dialog";
								
				SPON_PUSH(SPON_debugServerLog,_this);
				
				// If the server log is visible, show new messages.
				_dialog = findDisplay SPON_DEBUG_DISPLAY_IDD;
				if (not (isNull _dialog)) then
				{
					(_dialog displayCtrl SPON_DEBUG_SERVER_LIST_IDC) lbAdd 
						(_this call SPON_Core_formatLogEntry);
					
					if (SPON_debugLogUpdates) then
					{
						SELECT_LAST_ELEMENT(SPON_DEBUG_SERVER_LIST_IDC);
					};
				};
			}
		] call SPON_addEventHandler;
	};
	
	// Allow the log to be shown.
	SPON_viewDebugLog = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\viewDebugLog.sqf";

	// Either add an action to open the debug log or register a key handler.
	if (_useAction) then
	{
		[localize "STR_SPON_DEBUG_LOG_ACTION", "\loki_lost_key\SPON\Core\viewDebugLog.sqf", nil,
			SPON_DEBUG_LOG_ACTION_PRIORITY, false, true] call SPON_addPermanentAction;
	}
	else
	{	
		["DOWN", DEBUG_KEYCODE,
			{
				SPON_GET_PARAMS_4(_keyCode,_shift,_control,_alt);
			
				private ["_handled"];
				_handled = false;
				
				if ((isNull (findDisplay SPON_DEBUG_DISPLAY_IDD)) and
					(not _shift) and _control and (not _alt)) then
				{
					call SPON_viewDebugLog;
					_handled = true;
				};
				
				_handled; // Return.
			}
		] call SPON_addKeyEventHandler;
	};
};

SPON_TRACE_2("Initiated",SPON_Core_serverLogging,_useAction);

nil; // Return.
