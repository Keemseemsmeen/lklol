// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\initPublicObjectVariable
//
// Description:
//   Initialise public object variables. This is a way to make the values
//   attached to an object be copied to all machines.
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------
// Function: SPON_publicObjectVariable
//
// Description:
//   Transmits the current local value of an object variable to all other
//   machines.
//
//   e.g.
//     _object setVariable ["count", 26];
//     [_object, "count"] call SPON_publicObjectVariable;
//
// Parameters:
//   0: _object - Object on which the variable has been set on the local
//        machine [Object].
//   1: _varName - Name of the object variable to make public (this must already
//        have been set on the local machine) [String].
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
SPON_publicObjectVariable =
{
	SPON_GET_PARAMS_2(_object,_varName);
	
	["SPON_updateObjectVariable",
		[_object,_varName,_object getVariable _varName]] call
			SPON_publishGlobalEvent;
	
	nil; // Return.
};


// -----------------------------------------------------------------------------
// Function: SPON_addPublicObjectVariableHandler
//
// Description:
//
// Parameters:
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
// SPON_addPublicObjectVariableHandler =
// {
// };


// -----------------------------------------------------------------------------
// Handle the event to update the object variable.
// SPON_objectVariableObjects = []; // List of objects with publiced values on them.

private ["_updateObjectVariable"];
_updateObjectVariable =
{
	SPON_GET_PARAMS_3(_object,_varName,_value);
	
	_object setVariable [_varName, _value];
	
// 	if (isServer) then
// 	{
// 		_varName = toUpper _varName; // Upper case so find command will work.
// 		
// 		// Make sure we know this object should have values broadcast on JIP.
// 		if (_object in SPON_objectVariableObjects) then
// 		{
// 			private ["_values", "_index", "_varNames"];
// 			_varNames = _object getVariable "SPON_objectVariableNames";
// 			_values = _object getVariable "SPON_objectVariableValues";
// 			
// 			_index = _varNames find _varName;
// 			
// 			if (_index < 0) then
// 			{
// 				// This particular value hasn't been set before.
// 				SPON_PUSH(_varNames,_varName);
// 				SPON_PUSH(_values,_value);
// 			}
// 			else
// 			{
// 				// Been set before, just update.
// 				_values set [_index, _value];
// 			};
// 		}
// 		else
// 		{
// 			// This object has never been "publiced" before.
// 			SPON_PUSH(SPON_objectVariableObjects,_object);
// 			_object setVariable ["SPON_objectVariableNames", [_varName]];
// 			_object setVariable ["SPON_objectVariableValues", [_value]];
// 		};
// 	};
	
	nil; // Return.
};

["SPON_updateObjectVariable", _updateObjectVariable] call SPON_addEventHandler;

// if (isServer) then
// {
// 	SPON_updateObjectVariablesForJipper =
// 	{
// 		SPON_GET_PARAMS_1(_jipper);
// 		
// 		private ["_object", "varNames", "_values", "_jipData", "_objectData"];
// 		
// 		_jipData = [];
// 		
// 		{
// 			_object = _x;
// 			_varNames = _object getVariable "SPON_objectVariableNames";
// 			_values = _object getVariable "SPON_objectVariableValues";
// 			
// 			_objectData = [_object, _varNames, _values];
// 			SPON_PUSH(_jipData,_objectData);
// 			
// 		} forEach SPON_objectVariableObjects;
// 		
// 		SPON_updateAllObjectVariables = [_jipper,_jipData];
// 		
// 		publicVariable "jipData";
// 	};
// };

nil; // Return.
