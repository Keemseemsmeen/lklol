// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\CORE\viewDebugLog
//
// Description:
//   Shows the debug log.
//
// Parameters:
//   none
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "ui\handles.hpp"

// -----------------------------------------------------------------------------
// Function: SPON_debugClientListSelChanged
//
// Description:
//   Updates the edit-box below the client log when the selection is changed.
//
SPON_debugClientListSelChanged = 
{
	SPON_GET_PARAMS_2(_control,_index);
	
	_text = lbText [SPON_Core_debugClientListIdc, _index];
	ctrlSetText [SPON_DEBUG_CLIENT_EDIT_IDC, _text];

	nil; // Return.
};

// -----------------------------------------------------------------------------
// Function: SPON_debugServerListSelChanged
//
// Description:
//   Updates the edit-box below the server log when the selection is changed.
//
SPON_debugServerListSelChanged =
{
	SPON_GET_PARAMS_2(_control,_index);

	_text = lbText [SPON_DEBUG_SERVER_LIST_IDC, _index];
	ctrlSetText [SPON_DEBUG_SERVER_EDIT_IDC, _text];
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
_ok = createDialog "SPON_dlgDebugLog";
if (!_ok) exitWith { hint "Failed to open debug log window."; nil; };

// Use a large client log if the server log isn't going to be used.
if ((not SPON_Core_serverLogging) or isServer) then
{
	private ["_display", "_position",
		"_clientEditControl", "_serverEditControl"];

	_display = findDisplay SPON_DEBUG_DISPLAY_IDD;
	_clientEditControl = _display displayCtrl SPON_DEBUG_CLIENT_EDIT_IDC;
	_serverEditControl = _display displayCtrl SPON_DEBUG_SERVER_EDIT_IDC;

	// Move client edit box down.
	_position = ctrlPosition _serverEditControl;
	_clientEditControl ctrlSetPosition _position;
	_clientEditControl ctrlCommit 0;
	
	// Hide the controls we don't need.
	ctrlShow [SPON_DEBUG_CLIENT_LIST_IDC, false];
	ctrlShow [SPON_DEBUG_SERVER_TITLE_IDC, false];
	ctrlShow [SPON_DEBUG_SERVER_LIST_IDC, false];
	ctrlShow [SPON_DEBUG_SERVER_EDIT_IDC, false];
	
	SPON_Core_debugClientListIdc = SPON_DEBUG_BIG_LIST_IDC;
}
else
{
	ctrlShow [SPON_DEBUG_BIG_LIST_IDC, false];
	
	SPON_Core_debugClientListIdc = SPON_DEBUG_CLIENT_LIST_IDC;
};

// Fill up the log and scroll down to the last entry.
call SPON_debugFillLog;

nil; // Return.
