// SPON RearView v0.3.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\RearView\initRearView
//
// Description:
//   Initiates rear-view mirror system. Requires that SPON Core has already been
//   initialised.
//
// Parameters:
//   None.
//
// Returns:
//   nil
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

#include "rearView.inc.sqf"
#include "ui\handles.hpp"

if (SPON_isDedicatedServer) exitWith { nil };

// -----------------------------------------------------------------------------
// Ensure that RearView isn't initialised more than once.
if (not (isNil "SPON_RearView_version")) exitWith
{
	private "_version";
	_version = 'v0.3.0';
	SPON_TRACE_2("SPON RearView run when already initialised",SPON_RearView_version,_version);
	
	nil; // Return.
};

SPON_RearView_version = 'v0.3.0';

// Ensure that isAddon is false if we are running from a mission-script.
if (isNil "SPON_RearView_isAddon") then
{
	SPON_RearView_isAddon = false;
};

// -----------------------------------------------------------------------------

private ["_rearViewKeyDownHandler"];
_rearViewKeyDownHandler =
{
	SPON_GET_PARAMS_4(_keyCode,_shift,_control,_alt);
	
	private ["_handled"];
	
	if (SPON_RV_modifierDown and (call SPON_RV_canRearView)) then
	{
		private ["_vehicle", "_mirrorPositions", "_cameraPositions", 
			"_isCamera", "_positions"];
		
		_vehicle = vehicle player;
	
		_mirrorPositions = _vehicle getVariable MIRROR_POSITIONS_VAR;
		
		// If the vehicle has never been checked for mirrors before, then
		// assign it mirrors or no mirrors.
		if (isNil "_mirrorPositions") then
		{
			_mirrorPositions = [_vehicle, false] call SPON_RV_findPositions;
			_vehicle setVariable [MIRROR_POSITIONS_VAR, _mirrorPositions];
		};
		
		_cameraPositions = _vehicle getVariable CAMERA_POSITIONS_VAR;
		
		if (isNil "_cameraPositions") then
		{
			_cameraPositions = [_vehicle, true] call SPON_RV_findPositions;
			_vehicle setVariable [CAMERA_POSITIONS_VAR, _cameraPositions];
		};
		
		// Check whether to use camera or mirror positions.
		_isCamera = if (_vehicle isKindOf "M1Abrams") then
		{
			true; // M1A1 only has cameras; no mirrors.
		}
		else{if (_vehicle isKindOf "StrykerBase") then
		{
			private ["_eyePosInModel", "_validCameraPos"];
			
			_eyePosInModel = (vehicle player) worldToModel
				(positionCameraToWorld [0, 0, 0]);
				
			// Camera is available regardless of being zoomed or not, as long
			// as we are turned in.
			if (_vehicle isKindOf "Stryker_TOW") then
			{
				_validCameraPos = ((_eyePosInModel distance STRYKER_TOW_DRIVER_TURNED_IN_UNZOOMED_POS) <
					CAMERA_POSITION_MARGIN) or ((_eyePosInModel distance STRYKER_TOW_DRIVER_TURNED_IN_ZOOMED_POS) <
					CAMERA_POSITION_MARGIN);
			}
			else
			{
				_validCameraPos = ((_eyePosInModel distance STRYKER_DRIVER_TURNED_IN_UNZOOMED_POS) <
					CAMERA_POSITION_MARGIN) or ((_eyePosInModel distance STRYKER_DRIVER_TURNED_IN_ZOOMED_POS) <
					CAMERA_POSITION_MARGIN);
			};
				
			_validCameraPos or ((SPON_RV_looking != NO_MIRROR) and SPON_RV_usingCamera); // Value.
		}
		else
		{
			false; // Everything else just has mirrors, if any.
		}; };
		
		if (_isCamera) then
		{
			_positions = _cameraPositions;
		}
		else
		{
			_positions = _mirrorPositions;
		};
		
		// Check that the array contains both left and right positions.
		if ((count _positions) > 0) then
		{
			private ["_mirrorRequested"];
			
			if (_keyCode in SPON_RV_keysRight) then
			{
				_mirrorRequested = RIGHT_MIRROR;
			}
			else{if (_keyCode in SPON_RV_keysLeft) then
			{
				_mirrorRequested = LEFT_MIRROR;
			}
			else
			{
				_mirrorRequested = CENTRE_MIRROR;
			}; };
			
			if ((SPON_RV_looking != _mirrorRequested) and
				(count (_positions select _mirrorRequested) > 0)) then
			{
				[_vehicle, _positions, _mirrorRequested, _isCamera] call SPON_RV_look;
			};
			
			_handled = true;
		}
		else
		{
			_handled = false;
		};
	}
	else
	{
		_handled = false;
	};
	
	_handled; // Return.
};

// -----------------------------------------------------------------------------
SPON_RV_onLoad =
{
	SPON_GET_PARAMS_1(_display);
	SPON_RV_display = _display;
	
	private ["_label", "_dirOffset", "_labelControl"];
	
	switch SPON_RV_looking do
	{
		case LEFT_MIRROR:
		{
			_label = "STR_SPON_RV_LEFT";
			_dirOffset = -90;
		};
		case RIGHT_MIRROR:
		{
			_label = "STR_SPON_RV_RIGHT";
			_dirOffset = 90;
		};
		case CENTRE_MIRROR:
		{
			_label = "STR_SPON_RV_CENTRE";
			_dirOffset = 180;
		};
	};
	_label = localize _label;
	
	_labelControl = _display displayCtrl SPON_RV_DIRECTION_IDC;
	
	[_dirOffSet, _label, _labelControl] spawn
	{
		SPON_GET_PARAMS_3(_dirOffSet,_label,_labelControl);
		
		private ["_direction"];
		waitUntil
		{
			_direction =  (round (((getDir (vehicle player)) + _dirOffset) + 360)) mod 360;
			_labelControl ctrlSetText 
				(format [_label, _direction, toString [ASCII_DEGREE_SIGN]]);

			isNull _labelControl;
		};
	};
	
	nil; // Return.
};

// -----------------------------------------------------------------------------
// Stop looking if modifier is released.
private ["_rearViewModifierUpHandler"];
_rearViewModifierUpHandler =
{
	SPON_RV_looking = NO_MIRROR;
	SPON_RV_modifierDown = false;
	
	false; // Return.
};

// -----------------------------------------------------------------------------
// Remember if the modifier is down.
private ["_rearViewModifierDownHandler"];
_rearViewModifierDownHandler =
{
	SPON_RV_modifierDown = true;
	
	// Capture the key while actually looking with the mirror, otherwise, allow
	// it as regular operation.
	SPON_RV_looking != NO_MIRROR; // Return.
};

// -----------------------------------------------------------------------------

// [VehicleType, [Left, Centre, Right]]
#define BIKE_POSITIONS         [[-0.5, 0.5, -0.1], [], [0.2, 0.5, -0.1]]
#define URAL_SUPPORT_POSITIONS [[-1.5, 2.1, 0.5], [], [1.25, 2, 0.5]]]
#define UAZ_HIGH_POSITIONS     [[-0.93, 0.7, -0.45], [], [0.93, 0.7, -0.45]]]

// Standard mirror positions.
SPON_RV_mirrorPositions =
[
    ["Ikarus_TK_CIV_EP1",             [[-1.5, 4.60, 0.55], [-0.35, 4.20, 0.55], [1.15, 4.60, 0.55]]],
	["Ikarus",             			  [[-1.5, 4.60, 0.55], [-0.35, 4.20, 0.55], [1.15, 4.60, 0.55]]],

	// Luxury pickup.
 	["hilux1_civil_1_open", 		  [[-1, 1.1, -0.2], [-0.05, 0.85, 0.05], [1, 1.1, -0.2]]],
	
	["SUV_PMC",        				  [[-1.15, 0.55, 0.03], [0, 0.55, 0.15], [1.15, 0.55, 0.03]]], 
	["HMMWV",           			  [[-1.35, 0.7, -0.925], [], [1.175, 0.7, -0.925]]],
	
	// Landrover_Closed and Landrover need mirrors lower down than MG model,
	// which is their parent.
 	["Landrover_Closed",    [[-1, 1, -0.05], [], [1, 1, -0.05]]],
 	["LandroverMG",         [[-1, 1.1, -0.55], [], [1, 1.1, -0.55]]],
 	
 	["M1030",               BIKE_POSITIONS],
 	
 	 // East transport helo.
 	["Mi17_rockets_RU",             [[-1.05, 6.7, -1.5], [], [1.05, 6.7, -1.5]]],
	

 	// Pickup, sedan and hatchback are slightly different from the standard Skoda.
 	["datsun1_civil_1_open",[[-0.9, 0.7, -0.05], [0, 0.52, 0.22], [0.9, 0.7, -0.05]]],
 	["car_sedan",           [[-1.2, 0.6, -0.45], [-0.3, 0.35, -0.1], [0.75, 0.6, -0.45]]],
 	["car_hatchback",       [[-1.05, 0.5, -0.45], [-0.2, 0.26, -0.15], [0.75, 0.5, -0.45]]],
	["SkodaBase",           [[-1.00, 0.65, -0.45], [-0.3, 0.27, -0.15], [0.675, 0.65, -0.45]]],
	
	// Stryker mirrors are only available when turned out.
	["Stryker_TOW",         [[-1.28, 3.25, -0.63], [], [1.58, 3.25, -0.63]]], 
	["M1130_CV_EP1",         [[-1.38, 3.0, -0.15], [], [1.50, 3.0, -0.15]]],
	["LAV25_Base",               [[-1.38, 3.0, -0.53], [], [1.60, 3.0, -0.53]]],
	

	// Tractor view is over the shoulder, not a mirror.
	["tractor",             [[-0.5, -0.6, 0.4], [], [0, -0.6, 0.4]]],
	
	// MG is lower than the other 5tons.
	["Truck5t",             [[-1.5, 2.2, 0.6], [], [1.5, 2.2, 0.6]]],
	["Truck5tMG",           [[-1.5, 2.2, -0.2], [], [1.5, 2.2, -0.2]]],
	
	["TT650G",              BIKE_POSITIONS],
	
	// UAZ and UAZ_AGS30 need mirrors higher up than MG model,
	// which is their parent.
	["UAZ",                 UAZ_HIGH_POSITIONS,
	["UAZ_AGS30",           UAZ_HIGH_POSITIONS,
	["UAZMG",               [[-0.93, 0.65, -0.65], [], [0.93, 0.65, -0.65]]],
	
	// The support Urals have slightly different positions.
	["UralRepair",          URAL_SUPPORT_POSITIONS,
	["UralRefuel",          URAL_SUPPORT_POSITIONS,
	["UralReammo",          URAL_SUPPORT_POSITIONS,
 	["Ural",                [[-1.35, 2.2, 0.25], [], [1.37, 2.2, 0.25]]]
];

// Camera positions, for high-tech vehicles. [LEFT, REAR, RIGHT]
SPON_RV_cameraPositions =
[
	// turned in position is: [-0.435059, 1.9043, -0.257942]
	["StrykerBase",         [[-1.15, 1.9043, -0.5], [-0.6, -3.05, -0.4], [1.25, 1.9043, -0.5]]],
	
	// Turned in position is: [-0.000732422, 1.64844, -1.0228]
	["M1Abrams",            [[-1.9, 1.64844, -1.2], [0, -4.4, -0.9], [1.9, 1.64844, -1.2]]]
];



SPON_RV_looking = NO_MIRROR; // Which direction mirror/camera is looking in.
SPON_RV_usingCamera = false; // True if it is remote camera, not mirror.

SPON_RV_findPositions = compile preprocessFileLineNumbers
	"\loki_lost_key\SPON\RearView\findPositions.sqf";
	
SPON_RV_look = compile preprocessFileLineNumbers
	"\loki_lost_key\SPON\RearView\look.sqf";
	
SPON_RV_canRearView = compile preprocessFileLineNumbers
	"\loki_lost_key\SPON\RearView\canRearView.sqf";
	
SPON_RV_modifierDown = false; // Whether "look" key is down.

SPON_RV_display = objNull;

// Work out if NVG are being used, based on whether ArmALib is loaded.
if ((count (supportInfo "*:extcall*")) == 0) then
{
	SPON_RV_isNVGOn = { false }; // We can't tell, so assume it isn't on.
}
else
{
	SPON_RV_isNVGOn = compile "(toUpper ('isNVGon' extCall [])) == 'TRUE'";
};

// Add key event handlers for starting and stopping looking in the mirror.

SPON_RV_keysLeft = (actionKeys LOOK_LEFT);
{
	["DOWN", _x, _rearViewKeyDownHandler] call SPON_addKeyEventHandler;
} forEach SPON_RV_keysLeft;

SPON_RV_keysRight = (actionKeys LOOK_RIGHT);
{
	["DOWN", _x, _rearViewKeyDownHandler] call SPON_addKeyEventHandler;
} forEach SPON_RV_keysRight;

{
	["DOWN", _x, _rearViewKeyDownHandler] call SPON_addKeyEventHandler;
} forEach (actionKeys LOOK_CENTRE);

{
	["DOWN", _x, _rearViewModifierDownHandler] call SPON_addKeyEventHandler;
	["UP", _x, _rearViewModifierUpHandler] call SPON_addKeyEventHandler;
} forEach (actionKeys LOOK_MODIFIER);

SPON_TRACE_2("Initiated",SPON_RearView_isAddon,SPON_RearView_version);

nil; // Return.
