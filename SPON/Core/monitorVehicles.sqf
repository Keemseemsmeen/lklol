// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\monitorVehicles
// Function: SPON_monitorVehicles
//
// Description:
//   Initialise and begin vehicle and man monitoring.
//
// Parameters:
//   None
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

// -----------------------------------------------------------------------------
// Only start monitoring once.
if (not (isNil {SPON_men})) exitWith { nil; };

// Keep records of all the men and vehicles in the game.
SPON_men = [];
SPON_vehicles = [];

// Associative lists (can use "in"/"find" on objects or names).
SPON_players_object = [];
SPON_players_name = [];
SPON_players_connected = [];

SPON_recordVehicles = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\recordVehicles.sqf";

// -----------------------------------------------------------------------------
// Since the vehicles command is "broken" (it doesn't return soldiers),
// manually look for men and vehicles.

// Find all Vehicles (Following code adapted from CENT_tracers).
SPON_worldTrigger = createTrigger ["EmptyDetector",
	getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition")];
SPON_worldTrigger setTriggerType "NONE";
SPON_worldTrigger setTriggerActivation ["ANY", "PRESENT", true];
SPON_worldTrigger setTriggerArea [50000, 50000, 0, false];
SPON_worldTrigger setTriggerStatements ["this", "", ""];

// Monitor for newly added vehicles.
[] spawn
{
	while {true} do
	{
		call SPON_recordVehicles;
		
		sleep SPON_monitorVehiclesPollDelay; // Set by coreInit.sqf
	};
};




/* =========== New version which is broken =======================
// Only start monitoring once.
if (not (isNil "SPON_men")) exitWith { nil; };



private "_handler";

SPON_missionStarted = false;

// Keep records of all the men and vehicles in the game.
SPON_men = [];
SPON_vehicles = [];

// Associative lists (can use "in"/"find" on objects or names).
SPON_players_object = []; // Current player object (Object)
SPON_players_name = []; // Name of player. Can change if relogged (String)
SPON_players_connected = []; // Is the player currently connected? (Boolean)
SPON_players_objectEverFound = []; // Has the player object ever been found? (Boolean)

if (isServer) then
{
	SPON_players_id = []; // Unique ID of player (Number)
};

SPON_recordVehicles = compile preprocessFileLineNumbers
	"\loki_lost_key\SPON\Core\recordVehicles.sqf";

// -----------------------------------------------------------------------------
// Since the vehicles command is "broken" (it doesn't return soldiers),
// manually look for men and vehicles.

// Find all Vehicles (Following code adapted from CENT_tracers).
SPON_worldTrigger = createTrigger ["EmptyDetector",
	getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition")];
SPON_worldTrigger setTriggerType "NONE";
SPON_worldTrigger setTriggerActivation ["ANY", "PRESENT", true];
SPON_worldTrigger setTriggerArea [50000, 50000, 0, false];
SPON_worldTrigger setTriggerStatements ["this", "", ""];

// Monitor for newly added vehicles.
[] spawn
{
	while {true} do
	{
		call SPON_recordVehicles;
		
		sleep SPON_monitorVehiclesPollDelay; // Set by coreInit.sqf parameters.
	};
};

// -----------------------------------------------------------------------------
// SPON_onPlayerConnectedInt event handler
_handler =
{
	SPON_GET_PARAMS_3(_name,_id,_playerIndex);
	
	if (_playerIndex < (count SPON_players_name)) then
	{
		SPON_TRACE_3("Player re-connected",_name,_id,_playerIndex);
		SPON_players_name set [_index, _name];
		SPON_players_connected set [_index, true];
		SPON_players_objectEverFound set [_index, false];
		SPON_players_object set [_index, objNull];
	}
	else
	{
		SPON_TRACE_3("Player connected for first time",_name,_id,_playerIndex);
		SPON_PUSH(SPON_players_name,_name);
		SPON_PUSH(SPON_players_connected,true);
		SPON_PUSH(SPON_players_objectEverFound,false);
		SPON_PUSH(SPON_players_object,objNull);
	};
	
	// Give the mission maker something to use.
	["SPON_onPlayerConnected", _this] call SPON_publishLocalEvent;
	
	nil; // Return.
};

["SPON_onPlayerConnectedInt", _handler] call SPON_addEventHandler;

// -----------------------------------------------------------------------------
// SPON_onPlayerDisconnectedInt event handler
_handler =
{
	SPON_GET_PARAMS_3(_name,_id,_playerIndex);
	
	SPON_TRACE_2("Player disconnected",_name,_id);
	
	private ["_oldObject"];
	_oldObject = SPON_players_object select _index;
	
	SPON_players_object set [_playerIndex, objNull];
	SPON_players_connected set [_playerIndex, false];
	
	// Give the mission maker something to use.
	["SPON_onPlayerDisconnected", [_name, _id, _oldObject]] call SPON_publishLocalEvent;
	
	// Deprecated!
	["SPON_playerDisconnected", [_oldObject, _name]] call SPON_publishLocalEvent;
	
	nil; // Return.
};

["SPON_onPlayerDisconnectedInt", _handler] call SPON_addEventHandler;

// -----------------------------------------------------------------------------
// SPON_startMissionNonJIP event handler
_handler =
{
	SPON_TRACE("Mission started (non-JIP)");
	SPON_missionStarted = true;
	SPON_joinedInProgress = false;
	
	nil; // Return.
};

["SPON_startMissionNonJIP", _handler] call SPON_addEventHandler;

// -----------------------------------------------------------------------------
// SPON_startMissionJIP handler
// Players should accept new info when they log in.
_handler =
{
	SPON_GET_PARAMS_2(_names,_connected);
	
	if (_targetIndex == SPON_playerIndex) then
	{
		SPON_TRACE_2("Mission started (JIP)",_names,_connected);
		
		SPON_players_name = _names;
		SPON_players_connected = _connected;

		private "_oldSize";
		
		_oldSize = count SPON_players_object;
		SPON_players_object resize (count _names);
		for "_i" from _oldSize to ((count _names) - 1) do
		{
			SPON_players_object set [_i, objNull];
		};
		
		SPON_missionStarted = true;
		SPON_joinedInProgress = true;
	};
	
	nil; // Return.
};
	
["SPON_startMissionJIP", _handler] call SPON_addEventHandler;

// -----------------------------------------------------------------------------

if (isServer) then
{
	if (SPON_isMP) then
	{
		onPlayerConnected = "[_name, _id] call SPON_Core_connectedToServer";
		onPlayerDisconnected = "[_name, _id] call SPON_Core_disconnectedFromServer";

		SPON_Core_connectedToServer =
		{
			SPON_GET_PARAMS_2(_name,_id);
			
			if (_name == "__SERVER__") then
			{
				["SPON_startMissionNonJIP", nil] call SPON_publishGlobalEvent;
			}
			else
			{
				// If the mission has already started, then connecting player is
				// JIP and needs to be updated with player info.
				if (SPON_missionStarted) then
				{
					["SPON_startMissionJIP",
						[SPON_players_name, SPON_players_connected]] call
						SPON_publishGlobalEvent;
				};
				
				private ["_newPlayerIndex"];
				_newPlayerIndex = SPON_players_id find _id;
				if (_newPlayerIndex < 0) then
				{
					_newPlayerIndex = count SPON_players_id
				};
				
				// Tell everyone, including the new player, of the new connection.
				["SPON_onPlayerConnectedInt", [_name, _id, _newPlayerIndex]] call SPON_publishGlobalEvent;
			};
		};
		
		SPON_Core_disconnectedFromServer =
		{
			SPON_GET_PARAMS_2(_name,_id);
			
			private "_playerIndex";
			_playerIndex = SPON_players_id find _id;
			
			["SPON_onPlayerDisconnectedInt", [_name, _id, _playerIndex]] call SPON_publishGlobalEvent;
		};
	}
	else // !SPON_isMP
	{
		SPON_TRACE("TEST: STARTED SP MISSION");
		["SPON_onPlayerConnectedInt", [name player, -1, 0]] call SPON_publishLocalEvent;
		["SPON_startMissionNonJIP", nil] call SPON_publishLocalEvent;
	};
};

*/

nil; // Return.
