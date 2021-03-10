sZoneLocal = createMarker ["sZoneLocal", [(position player select 0), (position player select 1) +1500 , 0]];
sZoneLocal setMarkerBrushLocal "SOLID";
sZoneLocal setMarkerShapeLocal "ELLIPSE";
sZoneLocal setMarkerColorLocal "ColorGreen";
sZoneLocal setMarkerDirLocal 0;
sZoneLocal setMarkerSizeLocal [20,20];


click = 0;
hint 'click on Map for Friendly Spawn Point';
onMapSingleClick "sZoneLocal setMarkerPosLocal _pos; click = 1";
waitUntil {click == 1};
call fnc_loki_groupSpawn;