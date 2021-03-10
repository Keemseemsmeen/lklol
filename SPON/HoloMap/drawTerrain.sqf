// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// Draw HoloMap terrain.
//
// Parameters:
//   0: _projector - HoloMap projector to draw map on top of [Object]
//   1: _duration - Time to show map terrain [Number: > 0].
//
// Returns:
//   None.
//
// ----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"
#include "holomap.inc.sqf"

// ----------------------------------------------------------------------------

SPON_GET_PARAMS_2(_projector,_duration);

private ["_projector", "_horizontalScale", "_verticalScale", 
	"_sensorX", "_sensorY", "_colour", "_height",
	"_spacing", "_xPos", "_yPos", "_worldPos", "_height", "_heightOffset",
	"_projectorPos"];
	
_sensor = call (_projector getVariable SENSOR_VAR);
_horizontalScale = _projector getVariable HORIZ_SCALE_VAR;
_verticalScale = _projector getVariable VERT_SCALE_VAR;
_sensorX = (getPos _sensor) select 0;
_sensorY = (getPos _sensor) select 1;

// If there is jamming at either end of the system, you get nothing!
if (([_projector] call SPON_Holo_isJammed) or
	([_sensor] call SPON_Holo_isJammed)) exitWith
{
};

// Current position of sensor, to use for plotting blips until the terrain
// updates again.
_projector setVariable [SENSOR_POS_VAR, [_sensorX, _sensorY]];

// Draw ranging rings.
_spacing = if (_horizontalScale >= 50000) then
{
	10000;
}
else{if (_horizontalScale >= 10000) then
{
	5000;
}
else{if (_horizontalScale >= 5000) then
{
	1000;
}
else{if (_horizontalScale >= 1000) then
{
	500;
}
else
{
	100;
}; }; }; };

for "_distance" from _spacing to _horizontalScale step _spacing do
{
	for "_angle" from 0 to 359 step 10 do
	{
		_xPos = (_distance * sin _angle);
		_yPos = (_distance * cos _angle);
		
		_worldPos = [_sensorX + _xPos, _sensorY + _yPos, 0];
		
		SPON_Holo_measurer setPos _worldPos;
		
		_height = (((getPosASL SPON_Holo_measurer) select 2) - SPON_Holo_minHeight) / _verticalScale;
		
		_heightOffset = [_worldPos] call SPON_Holo_heightOffset;
		
		_projectorPos = [_xPos / _horizontalScale,
			_yPos / _horizontalScale,
			1 + _height + _heightOffset];
		
		drop [RANGE_P3D, "", "billboard", 100000, _duration,
			_projectorPos, [0, 0, 0], 0, WEIGHT, VOLUME, 0,
			RANGE_SIZE, RANGE_COLOUR, [1], 0, 0, "", "", _projector];
	};
};

// TODO: 0) Read all locations on map at start of mission.
// TODO: 1) Read all heights + respective basecolours into 2d array.
// TODO: 2) Calculate max height for colour scaling and scale all the colours.
// TODO: 3) Drop particles in groups of 1000?
// TODO: Reduce particle density if too much land on table.

// 6500 particles to draw a complete land terrain.

for "_i" from -1 to 1 step TERRAIN_CELL_SIZE do
{
	sleep 0.001;
	for "_j" from -1 to 1 step TERRAIN_CELL_SIZE do
	{
		_pos = [_sensorX + _i * _horizontalScale,
			_sensorY + _j * _horizontalScale];
		if (SPON_Holo_showSea or (not (surfaceIsWater _pos))) then
		{
			SPON_Holo_measurer setPos _pos;
			_height = (getPosASL SPON_Holo_measurer) select 2;
			
			_colour = [_pos] call SPON_Holo_terrainTextureColour;
			
			// Lighter based on height.
			for "_k" from 0 to 2 do
			{
				_colour set [_k, (_colour select _k) *
					(0.1 + (_height - SPON_Holo_minHeight) / (SPON_Holo_maxHeight - SPON_Holo_minHeight))];
			};
					
			drop ["\ca\data\cl_basic", "", "billboard", 100000, _duration,
				[_i, _j, 1 + ((_height - SPON_Holo_minHeight) / _verticalScale)], [0, 0, 0], 0, WEIGHT, VOLUME, 0,
				[TERRAIN_PARTICLE_SIZE], [_colour], [1], 0, 0, "", "", _projector];
		};
	};
};

nil; // Return.
