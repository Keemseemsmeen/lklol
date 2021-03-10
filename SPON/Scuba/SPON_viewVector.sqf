// SPON Scuba v0.1.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
// SPON_viewVector $SPON_VERSION$
//
// Copyright (C) 2008 Bil Bas (bil dot bagpuss {at} gmail dot com / Spooner)
// License: GNU General Public License, version 3 <http://www.gnu.org/licenses/>
//
// Description:
//   Calculates the direction that the local player (camera) is looking in.
//   That is, it always points at the centre of the screen, regardless of
//   floating zone, weapon, scope, vehicle, freelook, rear-view mirror, etc.
//
//   The view vector is distinct from getDir, which is the direction of
//   overall facing, or from weaponDirection, which is the way the weapon is
//   pointing.
//
//   This is compatible with SPON Rearview and will give the direction
//   directly to the rear of the vehicle when mirrors are being used.
//
//   Obviously, this function will not give a meaningful value if called on a
//   dedicated server. Or if the player is dead.
//
//   To convert from a vector to a simple azimuth value (0..360), use the
//   well-known method:
//       vectorToAzimuth =
//       {
//           private ["_vector", "_azimuth"];
//         
//           _vector = _this select 0;
//         
//           // Calculate angle from vector (-180..+180).
//          _azimuth = (_vector select 0) atan2 (_vector select 1);
// 		 
//          // Convert to 0..360 azimuth value.
//          ((_azimuth + 360) mod 360); // Return.
//       };
//
//       _viewAzimuth = [call SPON_viewVector] call vectorToAzimuth;
//
//   If you are worried that the player might be zooming around in a remote
//   camera rather than acting as himself, just see where the camera is in
//   respect to the player, e.g.:
//       _usingRemoteCamera =
//          ((positionCameraToWorld [0, 0, 0]) distance (getPos (vehicle player))) > 5;
// 
// Parameters:
//   None.
//
// Returns:
//   Normal vector of current camera view [3D position array [X, Y, Z]]
//
// -----------------------------------------------------------------------------

private ["_position", "_viewPos", "_azimuth"];

// Find the location of the player camera's position.
_position = positionCameraToWorld [0, 0, 0];

// Find a position very far ahead of the camera that the player is using.
_viewPos = positionCameraToWorld [0, 0, 99999999];

_vector = [(_viewPos select 0) - (_position select 0),
	(_viewPos select 1) - (_position select 1),
	(_viewPos select 2) - (_position select 2)];

// Normalise the vector.
_magnitude = [0, 0, 0] distance _vector;

_vector = [(_vector select 0) / _magnitude, (_vector select 1) / _magnitude,
	(_vector select 2) / _magnitude];

_vector; // Return.
