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
//   None.
//
// Returns:
//   nil
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "scuba.inc.sqf"

// ----------------------------------------------------------------------------

SPON_Scuba_acceleratedSwim = 1; // =2x speed.
SPON_Scuba_upSpeed = 1; // m/s
SPON_Scuba_downSpeed = 0.5; // m/s

SPON_Scuba_putSatchelAction = -1;
SPON_Scuba_touchOffSatchelAction = -1;

SPON_Scuba_breathMax = 2 * 60; // Unaided breathing time.
SPON_Scuba_airSupplyMax = 15 * 60; // Air tank time.
SPON_Scuba_suffocateIn = 10; // Number of seconds for 1.0 damage without air.

SPON_Scuba_airSupplyCurrent = SPON_Scuba_airSupplyMax;

SPON_Scuba_light = objNull;
SPON_Scuba_lightAction = -1;

SPON_Scuba_diving = false;

SPON_Scuba_lightCanBeToggled = false;

SPON_Scuba_viewVector = compile preprocessFileLineNumbers "\loki_lost_key\SPON\Scuba\SPON_viewVector.sqf";
	
// Move up and down with the helicopter controls.
{
	_index = (["DOWN", _x, SPON_Scuba_handleUpOn] call SPON_addKeyEventHandler);
	//SPON_PUSH(_upIndices,_index);
} forEach (actionKeys "HeliUp");

{
	_index = (["UP", _x, SPON_Scuba_handleUpOff] call SPON_addKeyEventHandler);
	//SPON_PUSH(_upIndices,_index);
} forEach (actionKeys "HeliUp");

{
	_index = (["DOWN", _x, SPON_Scuba_handleDownOn] call SPON_addKeyEventHandler);
	//SPON_PUSH(_downIndices,_index);
} forEach (actionKeys "HeliDown");

{
	_index = (["UP", _x, SPON_Scuba_handleDownOff] call SPON_addKeyEventHandler);
	//SPON_PUSH(_downIndices,_index);
} forEach (actionKeys "HeliDown");

// Turn the light on and off with the headlights key.
{
	_index = (["DOWN", _x, SPON_Scuba_toggleLight] call SPON_addKeyEventHandler);
} forEach (actionKeys "Headlights");

{
	_index = (["UP", _x, SPON_Scuba_toggleLightReenable] call SPON_addKeyEventHandler);
} forEach (actionKeys "Headlights");

while { true } do
{
	waitUntil { alive player };

	sleep 0.01; // Give other scripts time to equip the player.
	
	while { alive player } do
	{
		while { not (call SPON_Scuba_isPossible) } do
		{
			sleep 2;
		};
		
		SPON_Scuba_diving = true;
		
		[true] call SPON_Scuba_updateLightAction;
		
		SPON_Scuba_breathCurrent = SPON_Scuba_breathMax;

		SPON_Scuba_playerDepth = 0;
		
		// Store the player's kit in a plastic bag.
		[player] call SPON_Scuba_preserveGear;
		
		[] call SPON_Scuba_updatePutSatchelAction;
		
		SPON_Scuba_goingUp = false;
		SPON_Scuba_goingDown = false;
		
		SPON_TRACE("Player began scuba diving!");
		
		private ["_lastFrameTime", "_swimmingWeight"];
		_lastFrameTime = time;
		
		//_swimmingWeight = "Logic" createVehicle (getPos player);
		createCenter sideLogic;
		_grpSPON_Swimmer = createGroup sideLogic;
		_swimmingWeight = _grpSPON_Swimmer createUnit ["Logic", (getPos player), [], 0, "NONE"];
		
		//["SPON_Scuba_startedScuba", [player, _swimmingWeight]] call SPON_publishRemoteEvent;
		
		//player addAction ["Fire Harpoon", "\loki_lost_key\SPON\Scuba\fireHarpoon.sqf", nil, 0, false, true];

		waitUntil
		{
			if (call SPON_Scuba_isPossible) then
			{			
				_swimmingPos = getPos player;
				_swimmingPos set [2, SPON_Scuba_playerDepth];
				
				_elapsed = time - _lastFrameTime;
				_lastFrameTime = time;
					
				_depth = [_swimmingPos] call SPON_Scuba_seaDepthAt;
				
				if (SPON_Scuba_acceleratedSwim > 0) then
				{	
					// If the swimmer is moving over 1kmph (normal max swim speed is 4kmph),
					// then move them faster.
					if ((speed player) > 1) then
					{
						private ["_swimmingVelocity", "_xVel", "_swimSpeed",
							"_swimmingPosTmp", "_xVel", "_yVel"];
							
						_swimmingVelocity = velocity player;
						
						_xVel = _swimmingVelocity select 0;
						_swimSpeed = _swimmingVelocity distance [0, 0, 0];
						
						_swimmingPosTmp = _swimmingPos + [];
						
						if ((abs _xVel) > 0) then
						{
							_swimmingPosTmp set [0, (_swimmingPos select 0) +
								((_xVel / _swimSpeed) * _elapsed * SPON_Scuba_acceleratedSwim)];
						};
						
						_yVel = _swimmingVelocity select 1;
						
						if ((abs _yVel) > 0) then
						{
							_swimmingPosTmp set [1, (_swimmingPos select 1) +
								((_yVel / _swimSpeed) * _elapsed * SPON_Scuba_acceleratedSwim)];
						};
						
						// Only accept the new position if it is deep enough.
						if (([_swimmingPosTmp] call SPON_Scuba_seaDepthAt) < MIN_DEPTH) then
						{
							_swimmingPos = _swimmingPosTmp;
						};
					};
				};
				
				// Move up or down, based on which keys are pressed.
				if (SPON_Scuba_goingUp) then
				{
					if (not SPON_Scuba_goingDown) then
					{
						_swimmingPos set [2, (_swimmingPos select 2) + (_elapsed * SPON_Scuba_upSpeed)];
					};
				}
				else{if(SPON_Scuba_goingDown) then
				{
					_swimmingPos set [2, (_swimmingPos select 2) - (_elapsed * SPON_Scuba_downSpeed)];
				}; };
				
				// If on the sea bed, then limit depth, if over surface, prevent flying.
				_swimmingPos set [2, ((_swimmingPos select 2) max (_depth - MIN_DEPTH)) min 0];
				
				SPON_Scuba_playerDepth = _swimmingPos select 2;
				
				if (SPON_Scuba_playerDepth < MIN_DEPTH_NEED_AIR) then
				{
					// Use up air underwater.
					if (SPON_Scuba_airSupplyCurrent > 0) then
					{
						SPON_Scuba_airSupplyCurrent = (SPON_Scuba_airSupplyCurrent - _elapsed) max 0;
					}
					else
					{
						SPON_Scuba_breathCurrent = (SPON_Scuba_breathCurrent - _elapsed) max 0;
						
						if (SPON_Scuba_breathCurrent == 0) then
						{
							player setdamage ((damage player) +
								(_elapsed / SPON_Scuba_suffocateIn));
						};
					};
				}
				else
				{
					// Get your breath back on the surface.
					if (SPON_Scuba_breathCurrent < SPON_Scuba_breathMax) then
					{
						SPON_Scuba_breathCurrent = SPON_Scuba_breathMax;
					};
				};
				
				if (surfaceIsWater _swimmingPos) then
				{
					// Only setPos the player if in deep enough water,
					// to prevent random death ;P
					if (_depth < MIN_DEPTH) then
					{
						player setPos _swimmingPos;
					};
					
					_swimmingWeight setPos (getPos player);
				};
				
				hintSilent format ["Depth: %1m\nBreath: %2s\nAir-supply: %3\nHealth: %4\nLight: %5\n(Sea depth: %6)",
					round -(_swimmingPos select 2),
					floor SPON_Scuba_breathCurrent,
					[SPON_Scuba_airSupplyCurrent] call SPON_formatTime,
					1 - damage player,
					not (isNull SPON_Scuba_light),
					round -_depth];
				
				false; // Continue.
			}
			else
			{
				true; // End.
			};
		};
		
		deleteVehicle _swimmingWeight;
		
		SPON_Scuba_diving = false;
		
		SPON_TRACE("Player stopped scuba diving!");
		
		player removeAction SPON_Scuba_putSatchelAction;
		[false] call SPON_Scuba_updateLightAction;
		
		hint "";
		
		[player] call SPON_Scuba_restoreGear;
		
		// {
			// ["UP", _x] call SPON_removeKeyEventHandler;
		// } forEach _upIndices;
		
		// {
			// ["DOWN", _x] call SPON_removeKeyEventHandler;
		// } forEach _downIndices;
	};
};
