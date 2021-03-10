// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
// File: SPON\Core\core.inc.sqf 
//
// -----------------------------------------------------------------------------

#define REQUIRED_ARMA_VERSION 1.09

// -- DEBUG LOG --
#define DEBUG_MODE_OFF "DEBUG_OFF"
#define DEBUG_MODE_CLIENT "DEBUG_CLIENT"
#define DEBUG_MODE_CLIENT_SERVER "DEBUG_CLIENT_SERVER"

// Global event which broadcasts debug messages from the server.
#define SERVER_DEBUG_EVENT "SPON_serverDebug"

// This is the backtick (`) key.
#define DEBUG_KEYCODE 41

// Select last element of a list box control.
#define SELECT_LAST_ELEMENT(X) lbSetCurSel [X, ((lbSize X) - 1)]
#define SPON_DEBUG_LOG_ACTION_PRIORITY -2

#define DEBUG_MODES [DEBUG_MODE_OFF, DEBUG_MODE_CLIENT, DEBUG_MODE_CLIENT_SERVER]

// -- Vehicle monitoring --
// Interval between monitoring vehicles.
#define DEFAULT_VEHICLE_MONITOR_DELAY 15

// -- Error dialog --
// Time before which we won't bother trying to display errors.
#define MIN_ERROR_DISPLAY_TIME 3

// -- Key event handlers. --
// The display that accepts key events, allows opening your own dialogs, etc.
#define MASTER_DISPLAY_IDD 46

#define SPON_HANDLE_KEY_UP "UP"
#define SPON_HANDLE_KEY_DOWN "DOWN"

#define SPON_VALID_KEY_HANDLER_TYPES [SPON_HANDLE_KEY_UP, SPON_HANDLE_KEY_DOWN]






