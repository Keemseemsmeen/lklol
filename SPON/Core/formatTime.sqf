// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\CORE\formatTime
//
// Description:
//   Formats integer time in seconds as "H:MM:SS" or "H:MM:SS.mmm". This is
//   intended to show time elapsed, rather than time-of-day.
//
// Parameters:
//   0: _seconds - Number of seconds to format [number]
//   1: _wantMilliseconds - Want to show milliseconds [boolean = false]
//
//  Returns:
//   Formatted time [String]
//	
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_2(_seconds,_wantMilliseconds);

if (isNil {_wantMilliseconds}) then { _wantMilliseconds = false; };

private ["_wholeSeconds", "_tensOfSeconds", "_minutes", "_tensOfMinutes", "_hours"];

// Discover all the digits to use.
_hours = floor(_seconds / 3600);
_seconds = _seconds - (_hours * 3600);
_tensOfMinutes = floor(_seconds / 600);
_seconds = _seconds - (_tensOfMinutes * 600);
_minutes = floor(_seconds / 60);
_seconds = _seconds - (_minutes * 60);
_tensOfSeconds = floor(_seconds / 10);
_wholeSeconds = floor(_seconds - (_tensOfSeconds * 10));

_elapsed = format ["%1:%2%3:%4%5", _hours, _tensOfMinutes, _minutes,
	_tensOfSeconds, _wholeSeconds];
	
// Add the milliseconds if required.
if (_wantMilliseconds) then
{
	private ["_ms", "_hundreds", "_tens"];
	
	_ms = floor(1000 * (_seconds mod 1));
	_hundreds = floor(_ms / 100);
	_ms = _ms - (_hundreds * 100);
	_tens = floor(_ms / 10);
	_ms = _ms - (_tens * 10);
	_elapsed = format ["%1.%2%3%4",	_elapsed, _hundreds, _tens, _ms];
};

_elapsed; // Return.
