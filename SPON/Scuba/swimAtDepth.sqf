// SPON Scuba v0.1.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Map\swimAtDepth
//
// Description:
//   Force an AI to swim at a particular depth.
//  
// Parameters:
//   0: AI to swim [Man]
//   1: Depth, in metres, at which to swim [Number]
//
// Returns:
//   nil
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "scuba.inc.sqf"

// ----------------------------------------------------------------------------

SPON_GET_PARAMS_2(_man,_depth);

waitUntil { time > 1 }; // Ensure man has started swimming and functions loaded.

if ((isPlayer _man) or (not (local _man))) exitWith {};

if (_depth < 0) exitWith
{
	private ["_msg"];
	_msg = format ["Cannot swim above water (depth requested %1m above surface)", _depth];
	SPON_ERROR(_msg);
};

private ["_oldDepth", "_breathOffset"];
	
// Check if the value has already been set, in which case just change the value,
// rather than starting a new script.
_oldDepth = _man getVariable "SPON_Scuba_swimDepth";

_man setVariable ["SPON_Scuba_swimDepth", _depth];

_breathOffset = random 3; // So everyone doesn't breathe at same time!

if (isNil "_oldDepth") then
{
	private "_pos";
	
	SPON_TRACE_2("Started",_man,_depth);
	[_man] call SPON_Scuba_preserveGear;
	
	waitUntil
	{
		if ((not (isPlayer _man)) and (alive _man) and (local _man) and
			(surfaceIsWater (getPos _man))) then
		{
			_depth = _man getVariable "SPON_Scuba_swimDepth";
			
			if (_depth > 0) then
			{
				_pos = getPos _man;
				_pos set [2, -_depth];
				_man setPos _pos;
				
				if (_depth >= 0.5) then
				{
					if ((((floor (time + _breathOffset)) mod 3) == 0) and random 1 < 0.2) then
					{
						for "_i" from 5 to (10 + random 5) do
						{
						drop ["\ca\data\Cl_basic", "", "Billboard", 0.33, 1,
							[-0.05 + (random 0.1), 0.55 + (random 0.1), -depth + 1.6],
							[0, 0, 0], 0, 1, 0.95, 1, [0.05, 0.1, 0.2],
							[[1, 1, 1, 0.04], [1, 1, 1, 0.02], [1, 1, 1, 0.01]],
							[0], 0, 0, "", "", _man];
						};
					};
				};
			};
			
			false; // Continue.
		}
		else
		{
			true; // Exit.
		};
	};
	
	SPON_TRACE_2("Finished",_man,_depth);
	
	[_man] call SPON_Scuba_restoreGear;
};

nil; // Return.
