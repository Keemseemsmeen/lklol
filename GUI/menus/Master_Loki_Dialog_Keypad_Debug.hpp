
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 1st Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
		class fnc_loki_library: LOKI_RscButton
	{
		idc = 72160;
		x = 0.105;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "Functions Library";
		SizeEx = 0.025;
		action = "call BIS_fnc_help; closedialog 0;"; 

	};	
	
		class cfg_viewer: LOKI_RscButton
	{
		idc = 72161;
		x = 0.105;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "cfg_Viewer";
	    action = "closeDialog 0;[] call BIS_fnc_configviewer";  

	};		

		class cfg_Explorer: LOKI_RscButton
	{
		idc = 72162;
		x = 0.105;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "cfg_Explorer";
		action = "closeDialog 0;createDialog ""HJ_ConfigExplorer"";"; 
	    
	};	

		class loki_Debug: LOKI_RscButton
	{
		idc = 72163;
		x = 0.105;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		text = "Debug Console";
	    action = "createdialog 'loki_debug';";		
		SizeEx = 0.025;
	};	
	
		class locationFinder: LOKI_RscButton
	{
		idc = 72164;
		x = 0.105;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		text = "Player Location";
	    action = "call fnc_loki_locationFinder";		
		SizeEx = 0.025;
	};	
	
		class Settings: LOKI_RscButton
	{
		idc = 72165;
		x = 0.105;
		y = 0.690;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "View Settings";
	    action = "[] execVM '\loki_lost_key\loki_scripts\ABV\ABV_Settings.sqf'; closedialog 0";

	};		

	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 2nd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
		class FPS: LOKI_RscButton
	{
		idc = 72166;
		x = 0.270;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "FPS On/Off";
		action = "call fnc_loki_FPS";
		SizeEx = 0.025;
		
	};	

		class ObjectStatus: LOKI_RscButton
	{
		idc = 72167;
		x = 0.270;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		text = "Object Status";
		SizeEx = 0.025;
	    action = "call (loki_logic getVariable ""FNC_status"")";

	};
	
		class unitCounter: LOKI_RscButton
	{
		idc = 72168;
		x = 0.270;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		text = "Unit Counter";
		SizeEx = 0.025;
	    action = "call fnc_loki_unitCounter";

	};

		class order66: LOKI_RscButton
	{
		idc = 72169;
		x = 0.270;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		text = "Order 66";
		SizeEx = 0.025;
	    action = "call fnc_loki_order_66; closeDialog 0; hint 'Order 66 Received Master'";

	};	
	
		class TeamStatus: LOKI_RscButton
	{
		idc = 72170;
		x = 0.270;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Team Status";
	    action = "CloseDialog 0;player execVM 'loki_lost_key\TeamStatusDialog\x_teamstatus.sqf'";

	};	
	
//----------------------------------------------------------------------------		
//
// idd's 72171 - 72199 reservered for any extras i add