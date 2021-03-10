// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// ------------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

#define SPON_ASSOC_KEYS 0
#define SPON_ASSOC_VALUES 1
#define SPON_ASSOC_DELETE_NIL 2
#define SPON_ASSOC_DEFAULT_VALUE 3

// ------------------------------------------------------------------------------
SPON_assocCreate =
{
	SPON_GET_DEFAULT_PARAM(0,_array,[]);
	SPON_GET_DEFAULT_PARAM(1,_deleteNil,true);
	SPON_GET_DEFAULT_PARAM(2,_defaultValue,nil);
	
	_keys = [];
	_values = [];
	
	_keys resize (count _array);
	_values resize (count _array);
	
	for "_i" from 0 to ((count _array) - 1) do
	{
		_keys set [_i, (_array select _i) select 0];
		_values set [_i, (_array select _i) select 1];
	};
	
	[_keys, _values, _deleteNil, _defaultValue]; // Return.
};

// ------------------------------------------------------------------------------
SPON_assocEach =
{
	SPON_GET_PARAMS_2(_assoc,_code);
	
	private ["_x", "_keys", "_values"];
	
	_keys = _assoc select SPON_ASSOC_KEYS;
	_values = _assoc select SPON_ASSOC_VALUES;
	
	for "_i" from 0 to ((count _keys) - 1) do
	{
		[_keys select _i, _values select _i] call _code;
	};
};

// ------------------------------------------------------------------------------
SPON_assocHasKey =
{
	SPON_GET_PARAMS_2(_assoc,_key);
	
	_key in (_assoc select SPON_ASSOC_KEYS); // Return.
};

// ------------------------------------------------------------------------------
SPON_assocGet =
{
	SPON_GET_PARAMS_2(_assoc,_key);
	
	private "_index";
	
	_index = (_assoc select SPON_ASSOC_KEYS) find _key;
	if (_index >= 0) then
	{
		(_assoc select SPON_ASSOC_VALUES) select _index; // Return.
	}
	else
	{
		_assoc select SPON_ASSOC_DEFAULT_VALUE; // Return.
	};
};

// ------------------------------------------------------------------------------
SPON_assocSet =
{
	SPON_GET_PARAMS_3(_assoc,_key,_value);
	
	private "_index";
	
	_index = (_assoc select SPON_ASSOC_KEYS) find _key;
	if (_index >= 0) then
	{
		if ((isNil "_value") and (_assoc select SPON_ASSOC_DELETE_NIL)) then
		{
			_assoc set [SPON_ASSOC_KEYS, (_assoc select SPON_ASSOC_KEYS)- _key];
			
			private "_values";
			_values = _assoc select SPON_ASSOC_VALUES;
			
			for "_i" from _index to ((count _values) - 2) do
			{
				_values set [_i, _values select (_i + 1)];
			};
			
			_values resize ((count _values) - 1);
		}
		else
		{
			(_assoc select SPON_ASSOC_VALUES) set [_index, _value];
		};
	}
	else
	{
		// Only insert the nil value if 
		if (not ((isNil "_value") and (_assoc select SPON_ASSOC_DELETE_NIL))) then
		{
			SPON_PUSH(_assoc select SPON_ASSOC_KEYS,_key);
			SPON_PUSH(_assoc select SPON_ASSOC_VALUES,_value);
		};
	};
	
	_assoc; // Return.
};

nil; // Return.
