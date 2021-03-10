call fnc_loki_sZone_marker_create;



sleep 0.2;

onMapSingleClick "sZoneLocal setMarkerPosLocal _pos";



lbClear 72011;

lbAdd [72011,"Arm Air Vehicles"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Need C4?"];
lbAdd [72011,"Got Mines?"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"das BiG Guns"];
//lbAdd [72011,"Order 66"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Laser Designator"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Mine Field (sm)"];
lbAdd [72011,"Mine Field (med)"];
lbAdd [72011,"Mine Field (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Hunter Killer M1A1 TUSK"];
lbAdd [72011,"  ---  "];




lbSetCurSel [72011,0];


Request2 = 
{

	switch (lbText [72011,lbCurSel 72011]) do
	{
		case "Arm Air Vehicles": {[] execVM '\loki_lost_key\loki_scripts\magic\arm_air.sqf'};		
		case "Need C4?": {call fnc_loki_add_c4};
		case "Got Mines?": {[] execVM '\loki_lost_key\loki_scripts\magic\mineE.sqf'};
		case "das BiG Guns": {[] execVM '\loki_lost_key\loki_scripts\magic\BGuns.sqf'};
		
		case "Order 66": {[] execVM '\loki_lost_key\loki_scripts\magic\order66.sqf'};
		
		case "Laser Designator": {player addweapon "laserdesignator"; player addmagazine "laserbatteries"; hint 'laserdesignator and laserbattery added';};
		
		
		case "Mine Field (sm)": {[10, 30, 20, 10, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\MineField.sqf'};
		case "Mine Field (med)": {[20, 45, 40, 10, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\MineField.sqf'};					
		case "Mine Field (large)": {[30, 90, 60, 10, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\MineField.sqf'};					
		
		case "Hunter Killer M1A1 TUSK": {call fnc_loki_HunKil_Tank1;};
		
		
	};

};


LN_ListBoxSel = 
{


	switch (lbText [72011,lbCurSel 72011]) do
	{

		case "Arm Air Vehicles": {};		
		case "Need C4?": {};
		case "Got Mines?": {};
		case "das BiG Guns": {};
		
		case "Order 66": {};
		case "Laser Designator": {};
		
		case "Mine Field (sm)": {ctrlEnable [6,true];sZoneLocal setMarkerSizeLocal [10,30]; sZoneLocal setMarkerColorLocal "ColorGreen"; sZoneLocal setMarkerShapeLocal "ELLIPSE"; sZoneAnimLocal setMarkerPosLocal (getMarkerPos sZoneLocal); onMapSingleClick "sZoneLocal setMarkerPosLocal _pos; sZoneAnimLocal setMarkerPosLocal _pos"};
		case "Mine Field (med)": {ctrlEnable [6,true];sZoneLocal setMarkerSizeLocal [20,45]; sZoneLocal setMarkerColorLocal "ColorYellow"; sZoneLocal setMarkerShapeLocal "ELLIPSE"; sZoneAnimLocal setMarkerPosLocal (getMarkerPos sZoneLocal); onMapSingleClick "sZoneLocal setMarkerPosLocal _pos; sZoneAnimLocal setMarkerPosLocal _pos"};		
		case "Mine Field (large)": {ctrlEnable [6,true];sZoneLocal setMarkerSizeLocal [30,90]; sZoneLocal setMarkerColorLocal "ColorRed"; sZoneLocal setMarkerShapeLocal "ELLIPSE"; sZoneAnimLocal setMarkerPosLocal (getMarkerPos sZoneLocal); onMapSingleClick "sZoneLocal setMarkerPosLocal _pos; sZoneAnimLocal setMarkerPosLocal _pos"};

		case "Hunter Killer M1A1 TUSK": {};
		
		

	};
};
Rotate = 
{
	_dir = (markerDir sZoneLocal) + 22.5;
	sZoneLocal setMarkerDirLocal (_dir);
	sZoneAnimLocal setMarkerDirLocal (_dir - 180);
};
