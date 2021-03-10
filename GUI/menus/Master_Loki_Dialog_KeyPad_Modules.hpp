//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 1st Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
		class Ambientlife: LOKI_RscButton
	{
		idc = 72401;
		x = 0.105;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "Ambient Life";
		SizeEx = 0.025;
		action = "call fnc_loki_Spawn_Animals_Logic;"; 

	};	
	
		class ACM: LOKI_RscButton
	{
		idc = 72402;
		x = 0.105;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "A.C.M. (all out)";
	    action = "closeDialog 0;[] call fnc_loki_Spawn_ACM_Logic; hint 'its on like Donkey Kong!';";  

	};		

		class SECOP: LOKI_RscButton
	{
		idc = 72403;
		x = 0.105;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "SecOps";
		action = "closeDialog 0;call fnc_loki_Spawn_SECOP_Logic;"; 
	    
	};	

		class ALICE: LOKI_RscButton
	{
		idc = 72404;
		x = 0.105;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		text = "ALICE";
	    action = "closeDialog 0;call fnc_loki_Spawn_AliceManager_Logic;";		
		SizeEx = 0.025;
	};	

		class SILVIE: LOKI_RscButton
	{
		idc = 72405;
		x = 0.105;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		text = "SILVIE";
		action = "closeDialog 0;call fnc_loki_Spawn_SilvieManager_Logic;";
		SizeEx = 0.025;
		
	};	
	
		class BISsupport: LOKI_RscButton
	{
		idc = 72406;
		x = 0.105;
		y = 0.690;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "BIS SSM";
	    action = "call fnc_loki_SSM_create; closedialog 0";

	};	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 2nd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class SOM1: LOKI_RscButton
	{
		idc = 72411;
		x = 0.270;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "SOM ambush";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\ambush.sqf'";
	};

		class SOM2: LOKI_RscButton
	{
		idc = 72412;
		x = 0.270;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		text = "SOM attack";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\attack.sqf'";
	};

		class SOM3: LOKI_RscButton
	{
		idc = 72413;
		x = 0.270;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		text = "SOM destroy";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\destroy.sqf'";
	};

		class SOM4: LOKI_RscButton
	{
		idc = 72414;
		x = 0.270;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		text = "SOM escort";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\escort.sqf'";
	};

		class SOM5: LOKI_RscButton
	{
		idc = 72415;
		x = 0.270;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		text = "SOM patrol";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\patrol.sqf'";
	};	

		class SOM6: LOKI_RscButton
	{
		idc = 72416;
		x = 0.270;
		y = 0.690;
		w = 0.200;
		h = 0.075;
		text = "SOM rescue";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\rescue.sqf'";
	};	

		class SOM7: LOKI_RscButton
	{
		idc = 72417;
		x = 0.270;
		y = 0.765;
		w = 0.200;
		h = 0.075;
		text = "SOM search";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\search.sqf'";
	};
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 3rd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class SOM8: LOKI_RscButton
	{
		idc = 72418;
		x = 0.385;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "SOM trap";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\trap.sqf'";
	};

		class SOM9: LOKI_RscButton
	{
		idc = 72419;
		x = 0.385;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		text = "SOM defend";
		SizeEx = 0.025;
		action = "closeDialog 0; [] execVM 'loki_lost_key\loki_scripts\somscripts\defend.sqf'";
		
	};	