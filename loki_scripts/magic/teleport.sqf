deleteMarker sZoneLocal; 
deleteMarker sZoneAnimLocal;
hint "Select Map Position";
onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;closeDialog 0;";

if (true) exitWith {};