// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\Core\recordVehicles
//
// Description:
//   Records changes in men and vehicles in the game.
//
// Parameters:
//   none
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"


// -----------------------------------------------------------------------------

private ["_recordPlayer", "_recordMan", "_updateLists"]; // Local functions.

// -----------------------------------------------------------------------------
// Function: _recordPlayer
//
// Description:
//   Try to record a new player object, whether just connected or a respawn.
//   Publishes "SPON_playerConnected" only if the player just connected.
//
// Parameters:
//   0: _newPlayer - Person to record as a player [Man / Seagull]
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
_recordPlayer =
{
	SPON_GET_PARAMS_1(_newPlayer);
	
	// Was the player already connected (i.e. did they respawn)?
	private ["_alreadyConnected"]; 

	if (not (_newPlayer in SPON_players_object)) then
	{
		private ["_index"];
		
		_index = SPON_players_name find (name _newPlayer);
		if (_index >= 0) then
		{
			SPON_players_object set [_index, _newPlayer];
			
			if (SPON_players_connected select _index) then
			{
				_alreadyConnected = true;
			}
			else
			{
				SPON_players_connected set [_index, true];
				_alreadyConnected = false;
			};
		}
		else // Not found in list.
		{
			SPON_PUSH(SPON_players_object,_newPlayer);
			SPON_PUSH(SPON_players_name,name _newPlayer);
			SPON_PUSH(SPON_players_connected,true);
			
			_alreadyConnected = false;
		};
		
		if (not _alreadyConnected) then
		{
			["SPON_playerConnected", [_newPlayer]] call SPON_publishLocalEvent;
		};
	};
	
	nil; // Return.	
};

// -----------------------------------------------------------------------------
// Function: _recordMan
//
// Description:
//   Records whether a man is new to the game or not.
//
// Parameters:
//   0: _man - Person to record [Man]
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
_recordMan =
{
	SPON_GET_PARAMS_1(_man);
	
	// Check if this is the first time we've seen this person.
	if (alive _man) then
	{
		if (not (_man in SPON_men)) then
		{
			SPON_PUSH(SPON_men,_man);
			
			["SPON_manFound", [_man]] call SPON_publishLocalEvent;
			
			// Check if they are a player spawning in.
			if (isPlayer _man) then
			{
				[_man] call _recordPlayer;
			};
		};
	};
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
// Function: _updateLists
//
// Description:
//   Updates the SPON_players list and publishes SPON_playerConnected and
//   SPON_playerDisconnected as appropriate.
//
//   Also removes any dead men from SPON_men.
//
// Parameters:
//   none
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
_updateLists =
{
	// Check for changes in any of the existing players.
	private ["_i", "_playerObject"];

	// Check for disconnects in the existing player list (any respawns will have
	// been replaced already).
	for "_i" from 0 to ((count SPON_players_object) - 1) do
	{
		_playerObject = SPON_players_object select _i;
		
		if ((SPON_players_connected select _i) and (not (isPlayer _playerObject))) then
		{
			private ["_oldPlayerName"];
			_oldPlayerName = SPON_players_name select _i;
				
			// If the man's name has changed, then the player must have been
			// taken over by an AI when he disconnected, otherwise it is just the
			// player's corpse.
			// If the player disconnected and was deleted, then _man will be null
			// and won't have the same name as the player had.
			if ((name _playerObject) != _oldPlayerName) then
			{
				// No longer a player and has been taken over as AI.
				["SPON_playerDisconnected", [_playerObject, _oldPlayerName]
					] call SPON_publishLocalEvent;
			};
			
			// Player is no longer connected, so clear out everything but name
			// in the players lists.
			SPON_players_object set [_i, objNull];
			SPON_players_connected set [_i, false];
		};
	};
	
	// List of men who have died and might as well be removed from SPON_men.
	private "_deadMen";
	_deadMen = [];
	
	// Check for new players "possessing" existing AI.
	{
		if (isPlayer _x) then
		{
			[_x] call _recordPlayer;
		} else{if ((isNull _x) or (not (alive _x))) then
		{
			SPON_PUSH(_deadMen,_x);
		}; };
		
	} forEach SPON_men;
	
	// If we found any corpses, remove them from the list of men.
	if ((count _deadMen) > 0) then
	{
		SPON_men = SPON_men - _deadMen;
		SPON_TRACE_2("_updateLists - removed dead men",count _deadMen);
	};
	
	SPON_TRACE_4("_updateLists",{isPlayer _x} count SPON_players_object,count SPON_players_object,count SPON_players_name,{_x} count SPON_players_connected);
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
// If this is the first time the function has been called, wait until there is
// something to monitor.
if (isNil "SPON_recordVehiclesRunBefore") then
{
	SPON_recordVehiclesRunBefore = true;
	
	assert (not (isNil "SPON_worldTrigger"));
	waitUntil { (count (list SPON_worldTrigger)) > 0 };
};

SPON_TRACE("Recording new vehicles/men...");

private ["_vehicle"];
{
	_vehicle = _x;
	
	if (_vehicle isKindOf "Man") then
	{
		[_vehicle] call _recordMan;
	}
	else{if ((_vehicle isKindOf "LandVehicle") or
		(_vehicle isKindOf "Ship") or
		(_vehicle isKindOf "Air")) then
	{
		// Record the crewmen.
		{
			[_x] call _recordMan;
		} forEach (crew _vehicle);
		
		// Record the vehicle itself.
		if (not (_vehicle in SPON_vehicles)) then
		{
			SPON_PUSH(SPON_vehicles,_vehicle);
			
			["SPON_vehicleFound", [_vehicle]] call SPON_publishLocalEvent;
		};
	}
	else{if (_vehicle isKindOf "Seagull") then
	{
		if (isPlayer _vehicle) then
		{
			[_vehicle] call _recordPlayer;
		};
	}; }; };
} forEach (list SPON_worldTrigger);

// Make sure the players lists are up to date.
call _updateLists;

/* =========== New version which is broken =======================

// -----------------------------------------------------------------------------

private ["_recordPlayer", "_recordMan", "_updateLists"]; // Local functions.

// -----------------------------------------------------------------------------
// Function: _recordPlayer
//
// Description:
//   Try to record a new player object, whether just connected or a respawn.
//   Publishes "SPON_playerConnected" only if the player just connected.
//
// Parameters:
//   0: _newPlayer - Person to record as a player [Man / Seagull]
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
_recordPlayer =
{
	SPON_GET_PARAMS_1(_newPlayer); 

	if (not (_newPlayer in SPON_players_object)) then
	{
		private ["_index", "_newPlayerName"];
		
		_index = SPON_players_name find (name _newPlayer);
		
		if (_index >= 0) then
		{
			SPON_players_object set [_index, _newPlayer];
			
			if (not (SPON_players_objectEverFound select _index)) then
			{
				["SPON_playerConnected", [_newPlayer]] call SPON_publishLocalEvent;
			};
		};
	};
	
	nil; // Return.	
};

// -----------------------------------------------------------------------------
// Function: _recordMan
//
// Description:
//   Records whether a man is new to the game or not.
//
// Parameters:
//   0: _man - Person to record [Man]
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
_recordMan =
{
	SPON_GET_PARAMS_1(_man);
	
	// Check if this is the first time we've seen this person.
	if (alive _man) then
	{
		if (not (_man in SPON_men)) then
		{
			SPON_PUSH(SPON_men,_man);
			
			["SPON_manFound", [_man]] call SPON_publishLocalEvent;
			
			// Check if they are a player spawning in.
			if (isPlayer _man) then
			{
				[_man] call _recordPlayer;
			};
		};
	};
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
// Function: _updateLists
//
// Description:
//   Updates the SPON_players list and publishes SPON_playerConnected and
//   SPON_playerDisconnected as appropriate.
//
//   Also removes any dead men from SPON_men.
//
// Parameters:
//   none
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------
_updateLists =
{
	// List of men who have died and might as well be removed from SPON_men.
	private "_deadMen";
	_deadMen = [];
	
	// Check for new players "possessing" existing AI or dead AI.
	{
		if ((isNull _x) or (not (alive _x))) then
		{
			SPON_PUSH(_deadMen,_x);
		}
		else{if ((alive _x) and (isPlayer _x)) then
		{
			[_x] call _recordPlayer;
		}; };
		
	} forEach SPON_men;
	
	// If we found any corpses, remove them from the list of men.
	if ((count _deadMen) > 0) then
	{
		SPON_men = SPON_men - _deadMen;
		SPON_TRACE_1("_updateLists - removed dead men from SPON_men",count _deadMen);
	};
	
	SPON_TRACE_4("_updateLists",{isPlayer _x} count SPON_players_object,count SPON_players_object,count SPON_players_name,{_x} count SPON_players_connected);
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
// If this is the first time the function has been called, wait until there is
// something to monitor.
if (isNil "SPON_recordVehiclesRunBefore") then
{
	SPON_recordVehiclesRunBefore = true;
	
	waitUntil { (count (list SPON_worldTrigger)) > 0 };
};

SPON_TRACE("Recording new vehicles/men...");

private ["_vehicle"];
{
	_vehicle = _x;
	
	if (_vehicle isKindOf "Man") then
	{
		[_vehicle] call _recordMan;
	}
	else{if ((_vehicle isKindOf "LandVehicle") or
		(_vehicle isKindOf "Ship") or
		(_vehicle isKindOf "Air")) then
	{
		// Record the crewmen.
		{
			[_x] call _recordMan;
		} forEach (crew _vehicle);
		
		// Record the vehicle itself.
		if (not (_vehicle in SPON_vehicles)) then
		{
			SPON_PUSH(SPON_vehicles,_vehicle);
			
			["SPON_vehicleFound", [_vehicle]] call SPON_publishLocalEvent;
		};
	}
	else{if (_vehicle isKindOf "Seagull") then
	{
		if (isPlayer _vehicle) then
		{
			[_vehicle] call _recordPlayer;
		};
	}; }; };
} forEach (list SPON_worldTrigger);

// Make sure the players lists are up to date.
call _updateLists;

*/

nil; // Return.
