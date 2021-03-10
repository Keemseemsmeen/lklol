// SPON RearView v0.3.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
#define SPON_THIS_FILE SPON\RearView\look
//
// Description:
//   Moves the player's camera to the appropriate rear view position.
//
// Parameters:
//   0: _vehicle - Vehicle being driven by player [Vehicle]
//   1: _mirrorPositionModel - Position of mirror relative to the vehicle [Position]
//   2: _looking - Direction we are looking in [Number: MIRROR_LEFT,
//       MIRROR_CENTRE, MIRROR_RIGHT]
//   3: _isCamera - We are looking using a remote camera, not a mirror.
//
// Returns:
//   nil
//
// -----------------------------------------------------------------------------

#include "macros\macros.inc.sqf"

#include "rearView.inc.sqf"

// -----------------------------------------------------------------------------

SPON_GET_PARAMS_4(_vehicle,_mirrorPositionsModel,_looking,_isCamera);

private "_looking";

SPON_RV_looking = _looking;
SPON_RV_usingCamera = _isCamera;

// Move camera to the mirror position and keep updating the position.
[_vehicle, _mirrorPositionsModel select _looking, _looking, _isCamera] spawn
{
	SPON_GET_PARAMS_4(_vehicle,_mirrorPositionModel,_looking,_isCamera);
	
	private ["_mirror", "_mirrorPositionWorld", "_vectorDir"];
	
	SPON_TRACE_4("Looking into rear-view mirror",typeOf _vehicle,_mirrorPositionModel,_looking,_isCamera);
	
	// Create a remote camera to act as though it was the player looking in the
	// rear-view mirror.
	_mirror = "Camera" camCreate [0, 0, 0];
	_mirror switchCamera "INTERNAL";

	camUseNVG (call SPON_RV_isNVGOn);

	waitUntil
	{
		if (_isCamera and (isNull SPON_RV_display)) then
		{
			cutRsc ["SPON_RV_cameraOverlay", "PLAIN"];
		};
		
		if ((SPON_RV_looking == _looking) and
			(call SPON_RV_canRearView) and
			(cameraOn == _mirror)) then
		{
			// Work out where the mirror is currently positioned.
			_mirrorPositionWorld = _vehicle modelToWorld _mirrorPositionModel;
			_mirror setPos _mirrorPositionWorld;

			// Look directly backwards from where the vehicle is pointing.
			_vectorDir = vectorDir _vehicle;
			_vectorDir set [0, -(_vectorDir select 0)];
			_vectorDir set [1, -(_vectorDir select 1)];
			_vectorDir set [2, -(_vectorDir select 2)];
			
			// LEFT/RIGHT cameras look in the appropriate direction, rather than
			// reverse. Centre camera is same as regular mirrors.
			if (_isCamera) then
			{
				private "_tmp";
				_tmp = (_vectorDir select 0);
				
				switch SPON_RV_looking do
				{
					case LEFT_MIRROR:
					{
						_vectorDir set [0, (_vectorDir select 1)];
						_vectorDir set [1, -_tmp];
					};
					case RIGHT_MIRROR:
					{
						_vectorDir set [0, -(_vectorDir select 1)];
						_vectorDir set [1, _tmp];
					};
				};
			};
			
			// Up direction is not affected by mirroring.
			_mirror setVectorDirAndUp [_vectorDir, vectorUp _vehicle];
			
			false; // WaitUntil - continue.
		}
		else
		{
			true; // WaitUntil - end.
		};
	};
	
	SPON_TRACE_2("Stopped looking into rear-view mirror",typeOf _vehicle,_looking);
	
	// Clear the overlay, if it is still visible.
	if (_isCamera and (not (isNull SPON_RV_display))) then
	{
		cutText["", "PLAIN", 0];
	};
	
	// In case the player stops, or is stopped from, looking in the mirror,
	// rather than changes view.
	if (SPON_RV_looking == _looking) then
	{
		SPON_RV_looking = NO_MIRROR;
		SPON_RV_usingCamera = false;
	};
	
	// Go back to the normal view, assuming camera view hasn't been moved by
	// something else. Always goes back to unzoomed 1st person if using plain
	// mirrors or 1st person gunner view if using camera.
	// People who use 3rd person are to be ignored.
	if (cameraOn == _mirror) then
	{
		if _isCamera then
		{
			(vehicle player) switchCamera "GUNNER";
		}
		else
		{
			(vehicle player) switchCamera "INTERNAL";
		};
	};
	
	camDestroy _mirror;
	
	nil; // Return.
};
	
nil; // Return.
