// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// Draw vehicle and missile blips on the HoloMap.
//
// Parameters:
//   0: _projector - HoloMap projector to draw on top of [Object]
//   1: _duration - Time to show blip particles for [Number: > 0]
//   2: _miniaturesUsed - Array to place all used miniatures into [Array of Objects]
//
// Returns:
//   None.
//
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "holomap.inc.sqf"

// ----------------------------------------------------------------------------

SPON_GET_PARAMS_3(_projector,_duration,_miniaturesUsed);

private ["_sensor", "_horizontalScale", "_verticalScale", "_projectorSide",
	"_sensorPos", "_sensorX", "_sensorY", "_worldPos", "_asl", "_agl", "_proxy",
	"_colour", "_proxyClass", "_projectorPos", "_visibility"];
	
_sensor = call (_projector getVariable SENSOR_VAR);
_horizontalScale = _projector getVariable HORIZ_SCALE_VAR;
_verticalScale = _projector getVariable VERT_SCALE_VAR;
_projectorSide = _projector getVariable SIDE_VAR;
_sensorPos = _projector getVariable SENSOR_POS_VAR;
_sensorX = _sensorPos select 0;
_sensorY = _sensorPos select 1;

// If there is jamming at either end of the system, you get nothing!
if (([_projector] call SPON_Holo_isJammed) or
	([_sensor] call SPON_Holo_isJammed)) exitWith
{
};

// Draw jamming ranges.
private ["_jammer", "_jammingRange", "_yPos", "_xPos", "_dotWorldPos", "_heightOffset"];
{
	SPON_EXPLODE_2(_x,_jammer,_jammingRange);
	
	if (isEngineOn _jammer) then
	{
		_worldPos = getPosASL _jammer;
		
		for "_angle" from 0 to 359 step ((2 * _horizontalScale / _jammingRange) max 20) do
		{
			_xPos = (_worldPos select 0) + (_jammingRange * sin _angle);
			_yPos = (_worldPos select 1) + (_jammingRange * cos _angle);
			
			if (((abs (_xPos - _sensorX)) <= _horizontalScale) and
				((abs (_yPos - _sensorY)) <= _horizontalScale)) then
			{
				_dotWorldPos = [_xPos, _yPos];
				
				SPON_Holo_measurer setPos _dotWorldPos;
				
				_height = (((getPosASL SPON_Holo_measurer) select 2) - SPON_Holo_minHeight) / _verticalScale;
				
				_heightOffset = [_dotWorldPos] call SPON_Holo_heightOffset;
				
				_projectorPos = [(_xPos - _sensorX) / _horizontalScale,
					(_yPos - _sensorY) / _horizontalScale,
					1 + _height + _heightOffset];
				
				drop [JAMMER_P3D, "", "billboard", 100000, _duration,
					_projectorPos, [0, 0, 0], 0, WEIGHT, VOLUME, 0,
					JAMMER_SIZE, JAMMER_COLOUR, [1], 0, 0, "", "", _projector];
			};
		};
	};
} forEach SPON_Holo_jammers;

// Show each vehicle.
{
	_worldPos = getPosASL _x;
	_visibility = 1 - ([_x] call SPON_Holo_getStealth);
	
	if ((not ([_x] call SPON_Holo_isJammed)) and
		(not (isNull _x)) and
		((abs ((_worldPos select 0) - _sensorX)) <= (_horizontalScale * _visibility)) and
		((abs ((_worldPos select 1) - _sensorY)) <= (_horizontalScale * _visibility))) then
	{
		_asl = _worldPos select 2;
		_agl = (getPos _x) select 2;
		
		_heightOffset = [_worldPos] call SPON_Holo_heightOffset;
		
		// Show a height-indicator for flying vehicles.
		if (_agl > 2) then
		{	
			_max = if (SPON_Holo_proxyAddonLoaded and SPON_Holo_useMiniatures) then
			{
				_asl - HEIGHT_STEP;
			}
			else
			{
				_asl - 25;
			};
			
			for "_i" from (_asl - _agl) to _max step HEIGHT_STEP do
			{
				_projectorPos = [((_worldPos select 0) - _sensorX) / _horizontalScale,
					((_worldPos select 1) - _sensorY) / _horizontalScale,
					1 + _heightOffset + ((_i - SPON_Holo_minHeight) / _verticalScale)];
					
				drop [HEIGHT_BLIP_P3D, "", "Billboard", _duration, _duration,
					_projectorPos, [0, 0, 0], 0, WEIGHT, VOLUME, 0,
					HEIGHT_SIZE, HEIGHT_COLOUR, [1], 0, 0, "", "", _projector];
			};
		};
		
		_projectorPos = [((_worldPos select 0) - _sensorX) / _horizontalScale,
					((_worldPos select 1) - _sensorY) / _horizontalScale,
					1 + _heightOffset + ((_asl - SPON_Holo_minHeight) / _verticalScale)];

		if (SPON_Holo_proxyAddonLoaded and SPON_Holo_useMiniatures) then
		{
			_proxy = _x getVariable PROXY_VAR;
			if (isNil "_proxy") then
			{
				_proxy = [_x] call SPON_Holo_createMiniature;
				_x setVariable [PROXY_VAR, _proxy];
			};
			
			_proxy setPos (_projector modelToWorld _projectorPos);
			_proxy setVectorDirAndUp [vectorDir _x, vectorUp _x];
			_proxy setVelocity [0, 0, 0];
			
			SPON_PUSH(_miniaturesUsed,_proxy);
			
			// Burning vehicles => smoke.
			if (not (alive _x)) then
			{
				drop [[BURNING_P3D, 8, 5, 8], "", "Billboard", _duration, _duration * 10,
					_projectorPos,
					[0.02 - random 0.04, 0.02 - random 0.04, - (random 0.02)], 1, WEIGHT * 0.995, VOLUME, 0,
					[0.01, 0.03], [[0.4, 0.4, 0.4, 0.5]], [0.5, 0.5], 0, 0, "", "", _projector];
			};
		}
		else
		{
			_colour = [_x, _projectorSide] call SPON_Holo_blipColour;
			drop [VEHICLE_BLIP_P3D, "", "BillBoard", _duration, _duration,
				_projectorPos,
				[0, 0, 0], 0, WEIGHT, VOLUME, 0,
				[(sizeOf (typeOf _x)) / SIZE_OF_FACTOR], _colour, [1], 0, 0, "", "", _projector];
		};
	};		
} forEach SPON_vehicles;

// Draw infantry.
if (SPON_Holo_showInfantry) then
{
	{
		_worldPos = getPosASL _x;
		
		if ((not ([_x] call SPON_Holo_isJammed)) and
			(SPON_Holo_showEnemyInfantry or ((side _x) == _projectorSide)) and
			(SPON_Holo_showNonGroupLeadersInfantry or (_x == (leader _x))) and
			SPON_ON_FOOT(_x) and (alive _x) and
			((abs ((_worldPos select 0) - _sensorX)) <= _horizontalScale) and
			((abs ((_worldPos select 1) - _sensorY)) <= _horizontalScale)) then
		{
			_asl = _worldPos select 2;
			_agl = (getPos _x) select 2;
			
			_colour = [_x, _projectorSide] call SPON_Holo_blipColour;
			_heightOffset = [_worldPos] call SPON_Holo_heightOffset;
			
			_projectorPos = [((_worldPos select 0) - _sensorX) / _horizontalScale,
						((_worldPos select 1) - _sensorY) / _horizontalScale,
						1 + _heightOffset + ((_asl - SPON_Holo_minHeight) / _verticalScale)];
			
			drop [INFANTRY_BLIP_P3D, "", "BillBoard", _duration, _duration,
					_projectorPos, [0, 0, 0], 0, WEIGHT, VOLUME, 0,
					[(sizeOf (typeOf _x)) / SIZE_OF_FACTOR], _colour, [1], 0, 0, "", "", _projector];
		};
	} forEach SPON_men;
};

// Draw vertical line to represent the "sensor" object.
_worldPos = getPosASL _sensor;
_asl = _worldPos select 2;
_agl = (getPos _sensor) select 2;
for "_i" from 0 to SENSOR_HEIGHT step SENSOR_GAP do
{
	_heightOffset = [_worldPos] call SPON_Holo_heightOffset;
	
	_projectorPos = [((_worldPos select 0) - _sensorX) / _horizontalScale,
							((_worldPos select 1) - _sensorY) / _horizontalScale,
							1 + _heightOffset + ((_asl - SPON_Holo_minHeight)/ _verticalScale) + _i];
							
	drop [SENSOR_P3D, "", "BillBoard", _duration, _duration,
						_projectorPos,
						[0, 0, 0], 0, WEIGHT, VOLUME, 0,
						SENSOR_SIZE, SENSOR_COLOUR, [1], 0, 0, "", "", _projector];
};

// Show smoke trails from missiles.
SPON_Holo_missiles = SPON_Holo_missiles - [objNull];

{
	_worldPos = getPosASL _x;

	if ((not ([_x] call SPON_Holo_isJammed)) and
		((abs (((getPos _x) select 0) - _sensorX)) <= _horizontalScale) and
		((abs (((getPos _x) select 1) - _sensorY)) <= _horizontalScale)) then
	{
		_asl = _worldPos select 2;
		_heightOffset = [_worldPos] call SPON_Holo_heightOffset;
		_projectorPos = [((_worldPos select 0) - _sensorX) / _horizontalScale,
						((_worldPos select 1) - _sensorY) / _horizontalScale,
						1 + _heightOffset + ((_asl - SPON_Holo_minHeight) / _verticalScale)];
						
		if (SPON_Holo_proxyAddonLoaded and SPON_Holo_useMiniatures) then
		{
			drop [[MISSILE_TRAIL_P3D, 8, 5, 8], "", "Billboard", _duration * 5, _duration * 5,
					_projectorPos,
					[0, 0, 0], 1, WEIGHT, VOLUME, 0,
					TRAIL_SIZE, TRAIL_COLOUR, [_duration * 5, 0], _duration * 5 / 8, 0, "", "", _projector];
		}
		else
		{
			drop [MISSILE_BLIP_P3D, "", "Billboard", _duration, _duration,
					_projectorPos,
					[0, 0, 0], 1, WEIGHT, VOLUME, 0,
					[(sizeOf (typeOf _x)) / SIZE_OF_FACTOR], MISSILE_BLIP_COLOUR, [0], 0, 0, "", "", _projector];
		};
	};
} forEach SPON_Holo_missiles;

nil; // Return.
