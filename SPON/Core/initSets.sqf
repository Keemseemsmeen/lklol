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
SPON_setCreate =
{
	SPON_GET_DEFAULT_PARAM(0,_array,[]);
	
	_set = [];
	
	_set resize (count _array);
	
	for "_i" from 0 to ((count _array) - 1) do
	{
		_set set [_i, _array select _i];
	};
	
	_set; // Return.
};

// ------------------------------------------------------------------------------
SPON_setContains =
{
	SPON_GET_PARAMS_2(_setA,_value);
	
	_value in _setA; // Returns.
};

// ------------------------------------------------------------------------------
SPON_setInsert  =
{
	SPON_GET_PARAMS_2(_set,_value);	
	
	if (not (_value in _set)) then
	{
		SPON_PUSH(_set,_value); // Return.
	};
	
	_set;
};

// ------------------------------------------------------------------------------
SPON_setRemove =
{
	SPON_GET_PARAMS_2(_set,_value);	
	
	_set = _set - [_value]; // Return.
};

// ------------------------------------------------------------------------------
SPON_setAdd =
{
	SPON_GET_PARAMS_2(_setA,_setB);
	
	_setA + (_setB - _setA); // Return.
};

// ------------------------------------------------------------------------------
SPON_setSubtract =
{
	SPON_GET_PARAMS_2(_setA,_setB);
	
	_setA - _setB; // Return.
};

nil; // Return.
