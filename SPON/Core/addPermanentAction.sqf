// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\SPON_addPermanentAction
//
// Description:
//   Adds a permanent, "respawn-proof", action to the player. When the player
//   dies it will automatically be removed from his corpse and added to his new
//   body. The action will also always be available in vehicles.
//
// Example:
//   ["Explode", "explodeAction.sqf"] call SPON_addPermanentAction;
// 
// Parameters:
//   The parameters are passed directly to the addAction command so should be
//   appropriate for that command.
//
// Returns:
//   nil (you should never need to remove the action yourself, since it is
//   supposed to be permanent).
//
// -----------------------------------------------------------------------------

#include "core.inc.sqf"
#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------

if (SPON_isDedicatedServer) exitWith { nil }; // Client-side only.

if (isNil "SPON_Core_permaActionParams") then
{
	SPON_Core_permaActionParams = [];
	
	// Add the action to a vehicle.
	SPON_Core_addPermaAction = 
	{
		SPON_GET_PARAMS_2(_vehicle,_params);
		
		private ["_actions"];
					
		_actions = _vehicle getVariable "SPON_Core_permaActions";
		if (isNil "_actions") then
		{
			_actions = [];
		};
		
		SPON_PUSH(_actions,_vehicle addAction _params);
		
		_vehicle setVariable ["SPON_Core_permaActions", _actions];
	};
	
	SPON_Core_removeAllPermaActions =
	{
		SPON_GET_PARAMS_1(_vehicle);
		
		private ["_actions"];
		
		_actions = _vehicle getVariable "SPON_Core_permaActions";
		
		if (not (isNil "_actions")) then
		{
			{
				_vehicle removeAction _x;
			} forEach _actions;
		};
		
		_vehicle setVariable ["SPON_Core_permaActions", []];
	};
	
	SPON_Core_addGetInGetOutForPermaActions =
	{
		SPON_GET_PARAMS_1(_vehicle);
		
		_vehicle addEventHandler ["GETIN",
			{
				SPON_GET_PARAMS_3(_vehicle,_crewPosition,_man);
				
				if (player == _man) then
				{
					{
						[_vehicle, _x] call SPON_Core_addPermaAction;
					} forEach SPON_Core_permaActionParams;
				};
			}
		];
		
		_vehicle addEventHandler ["GETOUT",
			{
				SPON_GET_PARAMS_3(_vehicle,_crewPosition,_man);
				
				if (player == _man) then
				{
					[_vehicle] call SPON_Core_removeAllPermaActions;
				};
			}
		];
		
		SPON_TRACE_1("Added getin/getout handlers",_vehicle);
	};
	
	// Add event handlers for getin/getout to all vehicles.
	[] spawn
	{
		// Have to wait until the vehicle monitoring and event handling are compiled.
		waitUntil
		{
			(not (isNil "SPON_monitorVehicles")) and
				(not (isNil "SPON_addEventHandler"));
		};
		
		// Monitor vehicles and add getin/getout handlers.
		["SPON_vehicleFound", SPON_Core_addGetInGetOutForPermaActions] call
			SPON_addEventHandler;
		
		call SPON_monitorVehicles;
		
		{
			[_x] call SPON_Core_addGetInGetOutForPermaActions;
		} forEach SPON_vehicles;
	};
	
	// Add a killed handler to the player object.
	[] spawn
	{
		waitUntil { (not (isNull player)) and (alive player) };
		
		// Ensure that the corpse loses the actions and the new player object 
		// gains them again.
		player addEventHandler ["KILLED", {
			SPON_GET_PARAMS_1(_corpse);
			
			// Remove all the old actions from the corpse.
			SPON_TRACE_2("Removing actions from corpse",SPON_Core_permaActionParams,_corpse);
			
			[_corpse] call SPON_Core_removeAllPermaActions;
			
			if ((vehicle _corpse) != _corpse) then
			{
				[vehicle _corpse] call SPON_Core_removeAllPermaActions;
			};
			
			[] spawn
			{
				waitUntil { (not (isNull player)) and (alive player) };
				
				// Add the same actions onto the new body.
				SPON_TRACE_1("Reapplying actions on respawn",SPON_Core_permaActionParams);
				{
					[player, _x] call SPON_Core_addPermaAction;
				} forEach SPON_Core_permaActionParams;
			};
		}];
	};
};

SPON_PUSH(SPON_Core_permaActionParams,_this);

// Add the player action when the player is created.
_this spawn
{
	private ["_params"];
	_params = _this;
	
	waitUntil { (not (isNull player)) and (alive player) };
	
	[player, _params] call SPON_Core_addPermaAction;
	
	if (SPON_IN_VEHICLE(player)) then
	{
		[vehicle player, _params] call SPON_Core_addPermaAction;
	};
};

nil; // Return.
