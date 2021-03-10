

	class daMap : LOKI_RscMapControl
	{
	idc = -1;	
	x = 0.105;
	y = 0.130;
	w = 0.40; 
	h = 0.40;
	colorBackground[] = {0.5,0.5,0.5,0.75};
	colorOutside[] = {0.1,0.5,0.1,0.44};
	colorRailway[] = {0.1,0.1,0.5,0.44};
	};	
	

//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 1st Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class Weapons: LOKI_RscButton
	{
		idc = 72119;
		x = 0.105;
		y = 0.560;
		w = 0.200;
		h = 0.075;
		text = "Weapon Systems";
		SizeEx = 0.025;
		action = "closeDialog 0;createDialog ""loki_debug_weap_creator"";[0,0] call (PG_logic getVariable ""FNC_create_weapon"");"; 

	};	

		class VehicleCreator: LOKI_RscButton
	{
		idc = 72120;
		x = 0.105;
		y = 0.635;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Vehicle Creator";
	    action = "closeDialog 0;createDialog ""loki_debug_veh_creator"";[0] call (loki_logic getVariable ""FNC_create_vehicle"")";

	};	
		
		class Targets: LOKI_RscButton
	{
		idc = 72121;
		x = 0.105;
		y = 0.710;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Targets";
	    action = "closeDialog 0;createDialog ""loki_target_display"";[0] call (loki_logic getVariable ""FNC_target"");"; 

	};	
	
		class W_C1_R4: LOKI_RscButton
	{
		idc = 72122;
		x = 0.105;
		y = 0.785;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "W_C1_R4";
	    //action = "closeDialog 0;createDialog ""loki_target_display"";[0] call (loki_logic getVariable ""FNC_target"");"; 

	};	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 2nd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class Magick: LOKI_RscButton
	{
		idc = 72123;
		x = 0.270;
		y = 0.560;
		w = 0.200;
		h = 0.075;
		text = "Magick";
		action = "[] execVM ""\loki_lost_key\menus\Magick.sqf"";";
		SizeEx = 0.025;
		
	};

		class Mischief: LOKI_RscButton
	{
		idc = 72124;
		x = 0.270;
		y = 0.635;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Mischief";
		action = "[] execVM ""\loki_lost_key\menus\mischief.sqf"";";
	};	
	
		class Camps: LOKI_RscButton
	{
		idc = 72125;
		x = 0.270;
		y = 0.710;
		w = 0.200;
		h = 0.075;
		text = "Camps";
		SizeEx = 0.025;
		action = "[] execVM ""\loki_lost_key\menus\Camps.sqf"";";
	};

		class W_C2_R4: LOKI_RscButton
	{
		idc = 72126;
		x = 0.270;
		y = 0.785;
		w = 0.200;
		h = 0.075;
		text = "W_C2_R4";
		SizeEx = 0.025;
		//action = "[] spawn ION_RTE_pStartRTE; closedialog 0;";
	};	

//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 3rd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		
		class Artillery: LOKI_RscButton
	{
		idc = 72127;
		x = 0.385;
		y = 0.560;
		w = 0.200;
		h = 0.075;
		text = "Artillery";
	    action = "[] execVM ""\loki_lost_key\menus\Arty.sqf"";";		
		SizeEx = 0.025;
	    

	};
	
		class AmmoCrates: LOKI_RscButton
	{
		idc = 72128;
		x = 0.385;
		y = 0.635;
		w = 0.200;
		h = 0.075;
		text = "Ammo Crates";
		SizeEx = 0.025;
		action = "[] execVM '\loki_lost_key\menus\AmmoCrates.sqf'";
	    
	};

		class EnemyGroups: LOKI_RscButton
	{
		idc = 72129;
		x = 0.385;
		y = 0.710;
		w = 0.200;
		h = 0.075;
		text = "Enemy Groups";
		SizeEx = 0.025;
		action = "[] execVM '\loki_lost_key\menus\EnemyGroups.sqf'"; 	   

	};		

		class AlliedGroups: LOKI_RscButton
	{
		idc = 72130;
		x = 0.385;
		y = 0.785;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Allied Groups";
	    action = "[] execVM '\loki_lost_key\menus\GroupFriendly.sqf'";

	};


	
	
	
// LIST BOX ------------------------------------------------------------------------------	
		
		//class ListBox : LOKI_RscListBox
		class ListBox :LOKI_RscListBox
	{
		idc = 72011;
		x = 0.620; 
		y = 0.340;
		w = 0.280; 
		h = 0.50;
		sizeEx = 0.030;
		rowHeight = 0.030;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "[] call LN_ListBoxSel";
	
		soundSelect[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
		soundExpand[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
		soundCollapse[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
	
	};				
