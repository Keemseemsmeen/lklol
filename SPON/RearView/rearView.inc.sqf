// SPON RearView v0.3.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
// SPON\RearView\rearView.inc.sqf
//
// -----------------------------------------------------------------------------

// Keys used to look in mirrors (left, centre, right).
#define LOOK_LEFT "TurnOut"
#define LOOK_CENTRE "HeliRudderLeft"
#define LOOK_RIGHT "HeliRudderRight"

#define LOOK_MODIFIER "VehicleTurbo"

#define MIRROR_POSITIONS_VAR "SPON_RV_mirrorPositions"
#define CAMERA_POSITIONS_VAR "SPON_RV_cameraPositions"

// Max damage when mirrors still work.
#define MAX_VEHICLE_DAMAGE 0.6

// States of SPON_RV_looking and index in config array.
#define NO_MIRROR -1
#define LEFT_MIRROR 0
#define CENTRE_MIRROR 1
#define RIGHT_MIRROR 2

// Positions within vehicles that you need to be turned out to use mirrors.
#define STRYKER_DRIVER_TURNED_OUT_POS [-0.531738, 2.17529, -0.654793]
#define STRYKER_TOW_DRIVER_TURNED_OUT_POS [-0.405029, 2.17505, -0.654797]

// Positions within vehicles that have remote camera positions.
#define STRYKER_DRIVER_TURNED_IN_UNZOOMED_POS [-0.435059, 1.9043, -0.257942]
#define STRYKER_DRIVER_TURNED_IN_ZOOMED_POS [-0.488525, 3.02148, -0.753242]

#define STRYKER_TOW_DRIVER_TURNED_IN_UNZOOMED_POS [-0.308105,1.90405,-0.257946]
#define STRYKER_TOW_DRIVER_TURNED_IN_ZOOMED_POS [-0.361572,3.02148,-0.753239]

#define ABRAMS_DRIVER_TURNED_IN_POS [-0.000732422, 1.64844, -1.0228]

// Margin of error for stryker turned out position (ATGM is 12 cm different).
#define CAMERA_POSITION_MARGIN 0.01

#define ASCII_DEGREE_SIGN 176
