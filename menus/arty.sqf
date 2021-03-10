call fnc_loki_sZone_marker_create;

sleep 0.2;

onMapSingleClick "sZoneLocal setMarkerPosLocal _pos";



lbClear 72011;
lbAdd [72011,"   "];
lbAdd [72011,"[R3F] Artillery Center"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Artillery (sm)"];
lbAdd [72011,"Artillery (med)"];
lbAdd [72011,"Artillery (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Carpet Bomb (sm)"];
lbAdd [72011,"Carpet Bomb (med)"];
lbAdd [72011,"Carpet Bomb (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Cluster Bomb (sm)"];
lbAdd [72011,"Cluster Bomb (med)"];
lbAdd [72011,"Cluster Bomb (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Crazy Vaclav's Pchela1T Attack"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Fuel Air Bomb (sm)"];
lbAdd [72011,"Fuel Air Bomb (med)"];
lbAdd [72011,"Fuel Air Bomb (large)"];

lbAdd [72011,"  ---  "];
lbAdd [72011,"Flare Burst Red (sm)"];
lbAdd [72011,"Flare Burst Red (med)"];
lbAdd [72011,"Flare Burst Red (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Flare Burst Green (sm)"];
lbAdd [72011,"Flare Burst Green (med)"];
lbAdd [72011,"Flare Burst Green (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Flare Burst White (sm)"];
lbAdd [72011,"Flare Burst White (med)"];
lbAdd [72011,"Flare Burst White (large)"];
lbAdd [72011,"  ---  "];

lbAdd [72011,"Smoke Cover Red (sm)"];
lbAdd [72011,"Smoke Cover Red (med)"];
lbAdd [72011,"Smoke Cover Red (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Smoke Cover Green (sm)"];
lbAdd [72011,"Smoke Cover Green (med)"];
lbAdd [72011,"Smoke Cover Green (large)"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"Smoke Cover White (sm)"];
lbAdd [72011,"Smoke Cover White (med)"];
lbAdd [72011,"Smoke Cover White (large)"];
lbAdd [72011,"  ---  "];

lbAdd [72011,"Loki's Nightmare"];
lbAdd [72011,"Precision Strike"];
lbAdd [72011,"Copperhead"];



lbSetCurSel [4,0];
sleep 0.2;

onMapSingleClick "sZoneLocal setMarkerPosLocal _pos";

LN_ListBoxSel = 
{


	switch (lbText [72011,lbCurSel 72011]) do
	{

		case "Artillery (sm)": {ctrlEnable [6,false]; [40,40,"colorgreen"] call fnc_loki_sZone_marker_create2};
		case "Artillery (med)": {ctrlEnable [6,false]; [150,150,"coloryellow"] call fnc_loki_sZone_marker_create2};
		case "Artillery (large)": {ctrlEnable [6,false]; [300,300,"colorred"] call fnc_loki_sZone_marker_create2};
		
		case "Precision Strike": {ctrlEnable [6,false]; [40,40,"colorgreen"] call fnc_loki_sZone_marker_create2};

		case "Fuel Air Bomb (sm)": {ctrlEnable [6,false]; [80,80,"colorgreen"] call fnc_loki_sZone_marker_create2};		
		case "Fuel Air Bomb (med)": {ctrlEnable [6,false]; [150,150,"coloryellow"] call fnc_loki_sZone_marker_create2};		
		case "Fuel Air Bomb (large)": {ctrlEnable [6,false]; [300,300,"colorred"] call fnc_loki_sZone_marker_create2};	
		
		case "Flare Burst Red (sm)": {ctrlEnable [6,false]; [80,80,"colorgreen"] call fnc_loki_sZone_marker_create2};			
		case "Flare Burst Red (med)": {ctrlEnable [6,false]; [150,150,"coloryellow"] call fnc_loki_sZone_marker_create2};			
		case "Flare Burst Red (large)": {ctrlEnable [6,false]; [300,300,"colorred"] call fnc_loki_sZone_marker_create2};	
		
		case "Flare Burst Green (sm)": {ctrlEnable [6,false]; [80,80,"colorgreen"] call fnc_loki_sZone_marker_create2};			
		case "Flare Burst Green (med)": {ctrlEnable [6,false]; [150,150,"coloryellow"] call fnc_loki_sZone_marker_create2};			
		case "Flare Burst Green (large)": {ctrlEnable [6,false]; [300,300,"colorred"] call fnc_loki_sZone_marker_create2};
		
		case "Flare Burst White (sm)": {ctrlEnable [6,false]; [80,80,"colorgreen"] call fnc_loki_sZone_marker_create2};			
		case "Flare Burst White (med)": {ctrlEnable [6,false]; [150,150,"coloryellow"] call fnc_loki_sZone_marker_create2};			
		case "Flare Burst White (large)": {ctrlEnable [6,false]; [300,300,"colorred"] call fnc_loki_sZone_marker_create2};					
		
		case "Smoke Cover Red (sm)": {ctrlEnable [6,false]; [10,10,"colorgreen"] call fnc_loki_sZone_marker_create2};			
		case "Smoke Cover Red (med)": {ctrlEnable [6,false]; [20,20,"coloryellow"] call fnc_loki_sZone_marker_create2};		
		case "Smoke Cover Red (large)": {ctrlEnable [6,false]; [60,60,"colorred"] call fnc_loki_sZone_marker_create2};	
		
		case "Smoke Cover Green (sm)": {ctrlEnable [6,false]; [10,10,"colorgreen"] call fnc_loki_sZone_marker_create2};			
		case "Smoke Cover Green (med)": {ctrlEnable [6,false]; [20,20,"coloryellow"] call fnc_loki_sZone_marker_create2};		
		case "Smoke Cover Green (large)": {ctrlEnable [6,false]; [60,60,"colorred"] call fnc_loki_sZone_marker_create2};
		
		case "Smoke Cover White (sm)": {ctrlEnable [6,false]; [10,10,"colorgreen"] call fnc_loki_sZone_marker_create2};			
		case "Smoke Cover White (med)": {ctrlEnable [6,false]; [20,20,"coloryellow"] call fnc_loki_sZone_marker_create2};		
		case "Smoke Cover White (large)": {ctrlEnable [6,false]; [60,60,"colorred"] call fnc_loki_sZone_marker_create2};					
						
		case "Copperhead": {ctrlEnable [6,false]; [20,20,"colorred"] call fnc_loki_sZone_marker_create2};
		
		case "Carpet Bomb (sm)": {ctrlEnable [6,true]; [20,200,"colorgreen"] call fnc_loki_sZone_marker_create2a};	
		case "Carpet Bomb (med)": {ctrlEnable [6,true]; [40,400,"coloryellow"] call fnc_loki_sZone_marker_create2a};	
		case "Carpet Bomb (large)": {ctrlEnable [6,true]; [60,600,"colorred"] call fnc_loki_sZone_marker_create2a};		
		
		case "Cluster Bomb (sm)": {ctrlEnable [6,true]; [10,30,"colorgreen"] call fnc_loki_sZone_marker_create2a};
		case "Cluster Bomb (med)": {ctrlEnable [6,true]; [20,45,"coloryellow"] call fnc_loki_sZone_marker_create2a};			
		case "Cluster Bomb (large)": {ctrlEnable [6,true]; [30,85,"colorred"] call fnc_loki_sZone_marker_create2a};		
				
		
		case "Crazy Vaclav's Pchela1T Attack": {ctrlEnable [6,false]; [50,50,"colorgreen"] call fnc_loki_sZone_marker_create2};	

		case "Loki's Nightmare": {ctrlEnable [6,false]; [80,80,"colorgreen"] call fnc_loki_sZone_marker_create2};	

	};
	ctrlSetText [5,(format ["Request"])];
};

Request2 = 
{

	switch (lbText [72011,lbCurSel 72011]) do
	{
		case "[R3F] Artillery Center": {call fnc_SatPhone_Create};
		case "Artillery (sm)": {["Sh_122_HE",markerPos sZoneLocal,40,10,1] execVM '\loki_lost_key\loki_scripts\arty\artillery.sqf'};
		case "Artillery (med)": {["Sh_122_HE",markerPos sZoneLocal,150,20,2] execVM '\loki_lost_key\loki_scripts\arty\artillery.sqf'};		
		case "Artillery (large)": {["Sh_122_HE",markerPos sZoneLocal,300,30,3] execVM '\loki_lost_key\loki_scripts\arty\artillery.sqf'};
				
		case "Precision Strike": {[this] exec '\loki_lost_key\loki_scripts\arty\Precision.sqs'};

		case "Fuel Air Bomb (sm)": {["SH_122_H","SH_122_HE",40,markerPos sZoneLocal,80,30,[60]] execVM '\loki_lost_key\loki_scripts\arty\FuelBomb.sqf'};
		case "Fuel Air Bomb (med)": {["Bo_GBU12_LGB","SH_122_HE",70,markerPos sZoneLocal,150,60,[100]] execVM '\loki_lost_key\loki_scripts\arty\FuelBomb.sqf'};
		case "Fuel Air Bomb (large)": {["Bo_GBU12_LGB","Bo_GBU12_LGB",120,markerPos sZoneLocal,300,90,[250]] execVM '\loki_lost_key\loki_scripts\arty\FuelBomb.sqf'};

		case "Flare Burst Red (sm)": {["F_40mm_Red",markerPos sZoneLocal,10,1,1,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Flare Burst Red (med)": {["F_40mm_Red",markerPos sZoneLocal,150,3,2,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Flare Burst Red (large)": {["F_40mm_Red",markerPos sZoneLocal,200,7,3,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};

		case "Flare Burst Green (sm)": {["F_40mm_Green",markerPos sZoneLocal,10,1,1,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Flare Burst Green (med)": {["F_40mm_Green",markerPos sZoneLocal,150,3,2,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Flare Burst Green (large)": {["F_40mm_Green",markerPos sZoneLocal,200,7,3,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};				

		case "Flare Burst White (sm)": {["F_40mm_White",markerPos sZoneLocal,10,1,1,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Flare Burst White (med)": {["F_40mm_White",markerPos sZoneLocal,150,3,2,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Flare Burst White (large)": {["F_40mm_White",markerPos sZoneLocal,200,7,3,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};				
		
						
		case "Carpet Bomb (sm)": {[15, 100, 30, 50, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\CarpetBomb.sqf'};
		case "Carpet Bomb (med)": {[20, 200, 50, 50, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\CarpetBomb.sqf'};
		case "Carpet Bomb (large)": {[30, 300, 70, 50, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\CarpetBomb.sqf'};		
		
		case "Cluster Bomb (sm)": {[20, 60, 35, 500, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\ClusterBomb.sqf'};
		case "Cluster Bomb (med)": {[40, 90, 70, 550, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\ClusterBomb.sqf'};					
		case "Cluster Bomb (large)": {[60, 170, 100, 600, markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\ClusterBomb.sqf'};					

		case "Smoke Cover Red (sm)": {["SmokeShellRed",markerPos sZoneLocal,1,1,1,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Smoke Cover Red (med)": {["SmokeShellRed",markerPos sZoneLocal,20,3,2,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Smoke Cover Red (large)": {["SmokeShellRed",markerPos sZoneLocal,60,7,3,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};

		case "Smoke Cover Green (sm)": {["SmokeShellGreen",markerPos sZoneLocal,1,1,1,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Smoke Cover Green (med)": {["SmokeShellGreen",markerPos sZoneLocal,20,3,2,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Smoke Cover Green (large)": {["SmokeShellGreen",markerPos sZoneLocal,60,7,3,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};				

		case "Smoke Cover White (sm)": {["SmokeShell",markerPos sZoneLocal,1,1,1,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Smoke Cover White (med)": {["SmokeShell",markerPos sZoneLocal,20,3,2,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};
		case "Smoke Cover White (large)": {["SmokeShell",markerPos sZoneLocal,60,7,3,250] execVM '\loki_lost_key\loki_scripts\arty\support.sqf'};				

					
		
		case "Crazy Vaclav's Pchela1T Attack": {["CamelAttack", markerPos sZoneLocal, markerDir sZoneLocal] execVM '\loki_lost_key\loki_scripts\arty\CamelAttack.sqf'};

		case "Loki's Nightmare": {["Sh_122_HE",markerPos sZoneLocal,40,20,2] execVM '\loki_lost_key\loki_scripts\arty\LNightmare.sqf'};
		case "Copperhead":{[this] exec '\loki_lost_key\loki_scripts\arty\copperhead.sqs'};

	};
closedialog 0;
onUnload = "deletemarker sZoneLocal";
};



Rotate = 
{
	_dir = (markerDir sZoneLocal) + 22.5;
	sZoneLocal setMarkerDirLocal (_dir);
	sZoneAnimLocal setMarkerDirLocal (_dir - 180);
};