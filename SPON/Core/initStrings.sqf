// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// ------------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// ------------------------------------------------------------------------------
// Only works with single character in "middle" string.
SPON_splitString =
{
	SPON_GET_PARAMS_2(_string,_middle);
	
	private ["_charArray", "_middleChar", "_split", "_fragment"];
	
	_charArray = toArray _string;
	_middleChar = (toArray _middle) select 0;
	_split = [];
	_fragment = [];
	
	{
		if (_x == _middleChar) then
		{
			SPON_PUSH(_split,toString _fragment);
			_fragment = [];
		}
		else
		{
			SPON_PUSH(_fragment,_x);
		};
	} forEach _charArray;
	
	if ((count _fragment) > 0) then
	{
		SPON_PUSH(_split,toString _fragment);
	}
	else{if ((count _charArray) > 0) then
	{
		// If last char is the "middle" then add an empty string.
		if ((_charArray select ((count _charArray) - 1)) == _middleChar) then
		{
			SPON_PUSH(_split,"");
		};
	}; };
	
	_split ; // Return.
};

// ------------------------------------------------------------------------------

SPON_joinStrings =
{
	SPON_GET_PARAMS_2(_strings,_middle);
	
	private ["_joined"];

	if ((count _strings) > 0) then
	{
		_joined = _strings select 0;
	
		for "_i" from 1 to ((count _strings) - 1) do
		{
			_joined = _joined + _middle + (_strings select _i);
		};
	}
	else
	{
		_joined = "";
	};
	
	_joined; // Return.
};

// ------------------------------------------------------------------------------
SPON_compareStrings =
{
	SPON_GET_PARAMS_2(_a,_b);
	
	_a = toArray _a;
	_b = toArray _b;
	
	private "_result";
	
	_result = 0;
	
	for "_i" from 0 to ((count _a) min (count _b)) do
	{
		if ((_a select _i) > (_b select _i)) exitWith
		{
			_result = +1;
		};
	
		if ((_a select _i) < (_b select _i)) exitWith
		{
			_result = -1;
		};
	};
	
	if (_result == 0) then
	{
		// Two strings are same for their common length.
		if ((count _a) > (count _b)) then
		{
			+1; // Return.
		}
		else{if ((count _a) < (count _b)) then
		{
			-1; // Return.
		}
		else // ==
		{
			0; // Return.
		}; };
	}
	else
	{
		_result; // Return.
	};
};

// ------------------------------------------------------------------------------

SPON_stringGT =
{
	(_this call SPON_compareStrings) > 0;
};

// ------------------------------------------------------------------------------

SPON_stringGTE =
{
	(_this call SPON_compareStrings) >= 0;
};

// ------------------------------------------------------------------------------

SPON_stringLT =
{
	(_this call SPON_compareStrings) < 0;
};

// ------------------------------------------------------------------------------

SPON_stringLTE =
{
	(_this call SPON_compareStrings) <= 0;
};

nil; // Return.
