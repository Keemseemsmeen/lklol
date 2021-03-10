		class Teleport: LOKI_RscButton
	{
		idc = 72150; 
		x = 0.510;
		y = 0.125;
		w = 0.125;
		h = 0.050;
		text = "Teleport";
		SizeEx = 0.025;
		
	    action = "[] execVM '\loki_lost_key\loki_scripts\magic\teleport.sqf';";

	};

		class HALO: LOKI_RscButton
	{
		idc = 72151; 
		x = 0.510;
		y = 0.185;
		w = 0.125;
		h = 0.050;
		text = "H.A.L.O.";
		SizeEx = 0.025;
	    action = "[this] execVM '\loki_lost_key\loki_scripts\magic\halomapclick.sqf'";
	};
	
		class HALO_Height: LOKI_RscEdit
	{
		idc = 72153;
		x = 0.510;
		y = 0.260;
		w = 0.125;
		h = 0.050;
		text = "H.A.L.O. Height";
		SizeEx = 0.022;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelection[] = {0,0,0,1};

	};		

		class satView: LOKI_RscButton
	{
		idc = 72154; 
		x = 0.510;
		y = 0.335;
		w = 0.125;
		h = 0.050;
		text = "satView";
		SizeEx = 0.025;
	    action = "[player, 1] execVM ""\loki_lost_key\pxs_SatView\init_satellite.sqf"";"; 
	  
	};
	
		class Gigan: LOKI_RscButton
	{
		idc = 72155;
		x = 0.510;
		y = 0.410;
		w = 0.125;
		h = 0.050;
		SizeEx = 0.025;
		text = "Gigan";
	    action = "handle = [] execVM ""\loki_lost_key\gcam\gcam.sqf"";closedialog 0;";
		
	};		
	
		class Extraction: LOKI_RscButton
	{
		idc = 72156;
		x = 0.510;
		y = 0.485;
		w = 0.125;
		h = 0.075;
		SizeEx = 0.025;
		text = "Extraction";
	    action = "[] execVM ""\loki_lost_key\menus\extraction.sqf"";";

	};	