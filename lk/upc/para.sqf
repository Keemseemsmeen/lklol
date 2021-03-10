para=false;
droped=false;
nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";

_mapMarkText = "Click on the map to designate the Paratroopers Drop";
_closeMapMessage = "Close the map to initiate procedure";
_droppoint = "SD_DropMarker";
_dropMarkerType = "b_inf";
_incomingMessage = "This is eagle one, we are inbound with 53 Paratroopers Group, please stand by...";
_triggerDistance = 200;

SD_dropmarked = true;
hint _mapMarkText;
_mapString = format["SD_DropMarker = createMarker [""%1"", _pos]; ""%1"" setMarkerType ""%2"";SD_dropmarked=false",_droppoint, _dropMarkerType];
onMapSingleClick _mapString;
waitUntil{!SD_dropmarked};
onMapSingleClick "";

hint _closeMapMessage;
waitUntil{!visibleMap};
hintSilent "";

_dpos = getmarkerpos "SD_DropMarker";

	Grouppara1 = CreateGroup West;
	b5c130 = createVehicle ["C130J", _dpos, [], -3000, "FLY"];
	pilot22 = Grouppara1 createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CAN_COLLIDE"];
	pilot22 moveInDriver b5c130;
	b5c130 flyinheight 300;


acinf2 = [getpos b5c130, side player, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Infantry" >> "USMC_InfSquad")] call BIS_fnc_spawnGroup;
acinf2 setFormation "DIAMOND";
acinf1 = [getpos b5c130, side player, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Infantry" >> "USMC_FireTeam")] call BIS_fnc_spawnGroup;
{_x MoveInCargo b5c130} ForEach Units acinf2;
{_x MoveInCargo b5c130} ForEach Units acinf1;
[acinf1] join acinf2;
player hcsetgroup [acinf2,""];


_wp = Grouppara1 addWaypoint [getMarkerpos _droppoint, 0];
_wp setwaypointtype "MOVE";
_wp setWaypointStatements ["true", "nul = [acinf2,b5c130] execVM ""\loki_lost_key\lk\oth\eject.sqf""; pilot22 flyinheight 500; droped=true;"];


_paratrig = createTrigger ["EmptyDetector", [0,0,0]]; 
_paratrig setTriggerArea [0, 0, 0, false];
_paratrig setTriggerActivation ["NONE", "present", false];
_paratrig setTriggerStatements ["{alive _x} count units acinf2 == 0", "hint ""Paratroopers Drop is available again""; para=true; nul = [player] execVM ""\loki_lost_key\lk\menu\close_menu.sqf""", ""];



waitUntil {droped};
sleep 15;
deletevehicle b5c130;
deletevehicle pilot22;
deletemarker "SD_DropMarker";

