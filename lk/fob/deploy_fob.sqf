player removeaction playerac1;
deletevehicle lavhqtrig;
dhq=false;

nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";


hint "Building FOB...";

GroupHQG1 = CreateGroup WEST;
g1 = GroupHQG1 createUnit ["USMC_Soldier_AT", [(getpos lavhq1) select 0,(getpos lavhq1) select 1,0], [], 18, "NONE"];
g2 = GroupHQG1 createUnit ["USMC_Soldier_AR", [(getpos lavhq1) select 0,(getpos lavhq1) select 1,0], [], 18, "NONE"];
g3 = GroupHQG1 createUnit ["USMC_Soldier_Medic", [(getpos lavhq1) select 0,(getpos lavhq1) select 1,0], [], 18, "NONE"];
g4 = GroupHQG1 createUnit ["USMC_Soldier_LAT", [(getpos lavhq1) select 0,(getpos lavhq1) select 1,0], [], 18, "NONE"];
g5 = GroupHQG1 createUnit ["USMC_SoldierM_Marksman", [(getpos lavhq1) select 0,(getpos lavhq1) select 1,0], [], 18, "NONE"];
g1 = leader GroupHQG1;
wp1 = GroupHQG1 addwaypoint [position lavhq1, 0];
wp1 setwaypointtype "Sentry";
{_x setSkill 1} foreach units GroupHQG1;
GroupHQG1 setformation "DIAMOND";

deletevehicle lavhq1;

hq1d = createVehicle ["LAV25_HQ_unfolded", [(getpos lavhq1) select 0,(getpos lavhq1) select 1,0], [], 0, "NONE"];


hq1trig = createTrigger ["EmptyDetector", [0,0,0]]; 
hq1trig setTriggerArea [0, 0, 0, false];
hq1trig setTriggerActivation ["NONE", "present", false];
hq1trig setTriggerStatements ["!alive hq1d", "hint ""FOB HQ has been destroyed""; nohq=true; hqdp=false; dhq=false; hq1ddone=false; nul = [player] execVM ""\loki_lost_key\lk\menu\close_menu.sqf""; nul = [] execVM ""\loki_lost_key\lk\fob\delete_fob.sqf""", ""];


sleep 3;

fob1 = [getPos hq1d, random 360, "smallbase"] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));


if fobrespawn then {
"respawn_west" setMarkerPos position hq1d};


coin setPos (getpos hq1d);

uavcons=true;
barcons=true;
arty=true;
hqcons=true;
sm=true;
uavlh=true;

hqdp=true;
hq1ddone=true;
nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";
hint "FOB has been deployed!";

