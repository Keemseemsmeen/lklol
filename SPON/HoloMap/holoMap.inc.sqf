// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// ----------------------------------------------------------------------------
// HoloMap definitions.
// ----------------------------------------------------------------------------

// Non-moving particle weight and volume.
#define WEIGHT 1.275
#define VOLUME 1

// Table is the object to project the map over.
#define TABLE_CLASS_VANILLA "dbo_table"
#define TABLE_CLASS_ADDON "dbo_table"

#define SPHERE_MODEL "\ca\data\koule.p3d"

// Icons - addon only.
#define HEAVY_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\heavy.p3d"
#define INFANTRY_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\infantry.p3d"
#define LIGHT_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\light.p3d"
#define AIR_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\air.p3d"
#define COMMAND_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\command.p3d"

#define VEHICLE_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\vehicle.p3d"
#define SUPPLY_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\supplyVehicle.p3d"
#define REPAIR_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\repairVehicle.p3d"
#define SALVAGE_ICON_P3D "\SPON_HoloMap\SPON\HoloMap\icons\salvageVehicle.p3d"

// Blips.
#define BLIP_P3D "\ca\data\cl_basic.p3d"
#define VEHICLE_BLIP_P3D BLIP_P3D
#define INFANTRY_BLIP_P3D BLIP_P3D
#define MISSILE_BLIP_P3D BLIP_P3D
#define SENSOR_P3D BLIP_P3D
#define HEIGHT_BLIP_P3D BLIP_P3D

// Trail used with miniatures.
#define MISSILE_TRAIL_P3D "\ca\data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d"
#define BURNING_P3D "\ca\data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d"

// Blip colours.
#define FRIENDLY_COLOUR [[0, 0, 1, 1]]
#define NON_FRIENDLY_COLOUR [[1, 0, 0, 1]]

#define DEAD_COLOUR [[0.2, 0.2, 0.2, 1]]

#define MISSILE_BLIP_COLOUR [[1, 1, 1, 1]]

// Sensor "tower", to represent the detection centre.
#define SENSOR_HEIGHT 0.02
#define SENSOR_GAP 0.0025
#define SENSOR_SIZE [SENSOR_GAP * 2]
#define SENSOR_COLOUR [[1, 1, 0, 1]]

// Range markers.
#define RANGE_COLOUR [[1, 1, 0, 0.5]]
#define RANGE_SIZE [0.005]
#define RANGE_P3D BLIP_P3D

// Aircraft height indicators.
#define HEIGHT_SIZE [0.01]
#define HEIGHT_COLOUR [[1, 1, 1, 0.5]]

// Missile smoke trails.
#define TRAIL_SIZE [0.005, 0.015]
#define TRAIL_COLOUR [[1, 1, 1, 1], [1, 1, 1, 1]]

#define JAMMER_SIZE [0.05]
#define JAMMER_COLOUR [[1, 0, 1, 0.2]]
#define JAMMER_P3D BLIP_P3D

// Drawing of terrain on the map.
#define TERRAIN_PARTICLE_SIZE 0.1
#define TERRAIN_CELL_SIZE (TERRAIN_PARTICLE_SIZE / 3)
#define TERRAIN_OFFSET (TERRAIN_PARTICLE_SIZE / 2)

// Distance between height spacers.
#define HEIGHT_STEP 50

#define MAX_DISTANCE_TO_SEE_MAP 10

// Variables on full-size vehicles.
#define PROXY_VAR "SPON_Holo_proxy"

// How much smaller than the result of "sizeOf" to draw vehicles.
#define SIZE_OF_FACTOR 1000

#define TERRAIN_UPDATE_DELAY 8
#define TERRAIN_DURATION (TERRAIN_UPDATE_DELAY + 1)
#define BLIPS_UPDATE_DELAY 0.2
#define BLIP_DURATION (BLIPS_UPDATE_DELAY + 0.1)

// Variables on the map projector.
#define SENSOR_VAR "SPON_Holo_sensor"
#define HORIZ_SCALE_VAR "SPON_Holo_horizontalScale"
#define VERT_SCALE_VAR "SPON_Holo_verticalScale"
#define SENSOR_POS_VAR "SPON_Holo_sensorPos"
#define SIDE_VAR "SPON_Holo_side"

#define STEALTH_VAR "SPON_Holo_stealth"
