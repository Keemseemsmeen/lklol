call fnc_loki_sZone_marker_create;



sleep 0.2;

onMapSingleClick "sZoneLocal setMarkerPosLocal _pos";



lbClear 72011;

lbAdd [72011,"UAV"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"AC-130 Gunship AI"];
lbAdd [72011,"AC-130 Gunship Player"];
lbAdd [72011,"  ---  "];





lbSetCurSel [4,0];


Request2 = 
{

	switch (lbText [72011,lbCurSel 72011]) do
	{
		case "UAV": {[] execVM "\loki_lost_key\LDL_ac130\Actions\uav_action_map.sqf"};		
		case "AC-130 Gunship AI": {[] execVM "\loki_lost_key\LDL_ac130\Actions\ac130_action_map_AI.sqf"};
		case "AC-130 Gunship Player": {[] execVM "\loki_lost_key\LDL_ac130\Actions\ac130_action_map.sqf"};
			
		

		
		
	};

};


LN_ListBoxSel = 
{


	switch (lbText [72011,lbCurSel 72011]) do
	{

		case "UAV": {};		
		case "AC-130 Gunship AI": {};
		case "AC-130 Gunship Player": {};

	};
};
Rotate = 
{
	_dir = (markerDir sZoneLocal) + 22.5;
	sZoneLocal setMarkerDirLocal (_dir);
	sZoneAnimLocal setMarkerDirLocal (_dir - 180);
};
