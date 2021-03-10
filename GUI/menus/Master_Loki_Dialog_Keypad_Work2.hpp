

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

		class BTK: LOKI_RscButton
	{
		idc = 72131;
		x = 0.105;
		y = 0.560;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "BTK Cargo";
	    action = "[] execVM '\loki_lost_key\BTK\Cargo Drop\Start.sqf'; closedialog 0; hint 'BTK CARGO SYSTEM ON'";

	};	

		class W2_C1_R2: LOKI_RscButton
	{
		idc = 72132;
		x = 0.105;
		y = 0.635;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "W2_C1_R2";
	    //action = "closeDialog 0;createDialog ""loki_debug_veh_creator"";[0] call (loki_logic getVariable ""FNC_create_vehicle"")";

	};	
		
		class W2_C1_R3: LOKI_RscButton
	{
		idc = 72133;
		x = 0.105;
		y = 0.710;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "W2_C1_R3";
	    //action = "closeDialog 0;createDialog ""loki_target_display"";[0] call (loki_logic getVariable ""FNC_target"");"; 

	};	
	
		class W2_C1_R4: LOKI_RscButton
	{
		idc = 72134;
		x = 0.105;
		y = 0.785;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "W2_C1_R4";
	    //action = "closeDialog 0;createDialog ""loki_target_display"";[0] call (loki_logic getVariable ""FNC_target"");"; 

	};	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 2nd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class LDLsupport: LOKI_RscButton
	{
		idc = 72135;
		x = 0.270;
		y = 0.560;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "LDL Support";
	    action = "[] execVM ""\loki_lost_key\menus\support.sqf"";";

	};	

		class LK: LOKI_RscButton
	{
		idc = 72136;
		x = 0.270;
		y = 0.635;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "LK Scripts";
	    action = "call fnc_loki_lk_scripts; closedialog 0; hint 'LK Command Menu added to your addaction menu.'";

	};	
	
		class MBG_Create: LOKI_RscButton
	{
		idc = 72137;
		x = 0.270;
		y = 0.710;
		w = 0.200;
		h = 0.075;
		text = "MBG_Create";
		SizeEx = 0.025;
		action = "call fnc_loki_MBG_Creator;closeDialog 0;hint 'MBG Build Menu added to your addaction menu.'";
	};

		class ION_RTE: LOKI_RscButton
	{
		idc = 72138;
		x = 0.270;
		y = 0.785;
		w = 0.200;
		h = 0.075;
		text = "ION_RTE";
		SizeEx = 0.025;
		action = "[] spawn ION_RTE_pStartRTE; closedialog 0;";
	};	

//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 3rd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	

		class SPON_MAP: LOKI_RscButton
	{
		idc = 72139;
		x = 0.385;
		y = 0.560;
		w = 0.200;
		h = 0.075;
		text = "SPON MAP";
	    //action = "[] execVM ""\loki_lost_key\menus\Arty.sqf"";";		
		SizeEx = 0.025;
	    

	};
	
		class SPON_RearView: LOKI_RscButton
	{
		idc = 72140;
		x = 0.385;
		y = 0.635;
		w = 0.200;
		h = 0.075;
		text = "SPON RearView";
		SizeEx = 0.025;
		action = "[] execVM '\loki_lost_key\SPON\initRearView.sqf'";
	    
	};

		class SAM: LOKI_RscButton
	{
		idc = 72141;
		x = 0.385;
		y = 0.710;
		w = 0.200;
		h = 0.075;
		text = "Mando S.A.M.";
		SizeEx = 0.025;
		action = "closeDialog 0; call fnc_loki_Spawn_MandoSAM"; 	   

	};		

		class CAS: LOKI_RscButton
	{
		idc = 72142;
		x = 0.385;
		y = 0.785;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Mando C.A.S.";
	    action = "closeDialog 0; call fnc_loki_Spawn_MandoMissile";

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
