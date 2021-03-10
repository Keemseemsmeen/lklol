// Initiate SPON Core and SPON RearView
//
// Init Core in debug mode for the demo, but normally just use parameters of []
// to initialise this without debug mode.
[] call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initCore.sqf";

[] call compile preprocessFileLineNumbers "\loki_lost_key\SPON\RearView\initRearView.sqf";

// -----------------------------------------------------------------------------
// Mission-specific code, not normally needed.
// Place markers at mirror positions for the purpose of the demo.
// 
#include "RearView\macros\macros.inc.sqf"
#include "RearView\rearView.inc.sqf"

// Weight and volume of a static particle.
#define VOLUME 1
#define WEIGHT 1.275

private "_vehicleFound";
_vehicleFound =
{
	SPON_GET_PARAMS_1(_vehicle);
	
	private ["_mirrorPositions", "_cameraPositions"];

	// Map out the standard mirror positions.
	_mirrorPositions = [_vehicle, false] call SPON_RV_findPositions;

	if ((count _mirrorPositions) > 0) then
	{
		private ["_i", "_position", "_colour"];
		
		for "_i" from 0 to 2 do
		{
			_position = _mirrorPositions select _i;
		
			if ((count _position) > 0) then
			{
				_colour = switch _i do
				{
					case LEFT_MIRROR:
					{
						[1, 0, 0, 1]; // Red on left-hand side.
					};
					case CENTRE_MIRROR:
					{
						[0, 0, 1, 1]; // Blue in centre.
					};
					case RIGHT_MIRROR:
					{
						[0, 1, 0, 1]; // Green on right-hand side.
					};
				};
				
				drop ["\ca\data\Cl_basic", "", "Billboard", 1000, 3600,
					_position, [0,0,0], 0, WEIGHT, VOLUME, 0, [0.2], [_colour],
					[0], 0, 0, "", "", _vehicle];
			};
		};
	};
	
	// Map out the camera positions, available on very few vehicles.
	_cameraPositions = [_vehicle, true] call SPON_RV_findPositions;

	if ((count _cameraPositions) > 0) then
	{
		private ["_i", "_position", "_colour"];
		
		for "_i" from 0 to 2 do
		{
			_position = _cameraPositions select _i;
		
			if ((count _position) > 0) then
			{
				_colour = [1, 1, 0, 1];
				
	//			drop ["\ca\data\Cl_basic", "", "Billboard", 1000, 3600,
	//				_position, [0,0,0], 0, WEIGHT, VOLUME, 0, [0.2], [_colour],
	//				[0], 0, 0, "", "", _vehicle];
			};
		};
	};
};

// Track vehicles so we are aware of them when they are created.
[] call SPON_monitorVehicles;

{
	[_x] call _vehicleFound;
} forEach SPON_vehicles;

["SPON_vehicleFound", _vehicleFound] call SPON_addEventHandler;


	
	hintSilent ("-= SPON RearView demo =-\n\n" +
	
		"Press <vehicle-turbo> plus one of <turn-out>, <heli-rudder-left> or <heli-rudder-right> " +
		"(defaults to LEFT SHIFT + Z/X/C) " +
		"while driving one of the vehicles to use your mirrors.");


nil; // Return.