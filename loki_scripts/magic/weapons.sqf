


veh = createVehicle ["USBasicAmmunitionBox", position player, [], 0, "NONE"];

[veh] execVM "\loki_lost_key\loki_scripts\magiccrate.sqs";

hint "box will disappear after 90 secs...";

sleep 90;

deletevehicle veh;

if (true) exitWith {};



