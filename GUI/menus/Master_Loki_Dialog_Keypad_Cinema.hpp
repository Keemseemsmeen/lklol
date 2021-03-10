//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 1st Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class Clayman: LOKI_RscButton
	{
		idc = 72300;
		x = 0.105;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "Clayman";
		SizeEx = 0.025;
		action = "nul = [] execVM ""\loki_lost_key\AnimationViewer\init.sqf"";closeDialog 0;";

	};	
	
		class Bulletcam: LOKI_RscButton
	{
		idc = 72301;
		x = 0.105;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		text = "Bulletcam";
		action = "call (loki_logic getVariable ""FNC_bulletcam"");"; 
		SizeEx = 0.025;
		
	};	

		class Spectate: LOKI_RscButton
	{
		idc = 72302;
		x = 0.105;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		text = "Spectate";
	    action = "call fnc_loki_Spectator";		
		SizeEx = 0.025;
	    

	};		

		class SoundPlayer: LOKI_RscButton
	{
		idc = 72303;
		x = 0.105;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Sound Player";
	    action = "closeDialog 0;createDialog ""loki_sound_player"";[0] call (loki_logic getVariable ""FNC_sound"");"; 

	};	

		class Director: LOKI_RscButton
	{
		idc = 72304;
		x = 0.105;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Director";
	    action = "closeDialog 0; execVM '\loki_lost_key\GZL_Director\GZL_Director_Init.sqf';";

	};	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 2nd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class Intro1: LOKI_RscButton
	{
		idc = 72311;
		x = 0.270;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "Intro Short";
		SizeEx = 0.025;
		action = "nul = [] execVM ""\loki_lost_key\intro\x_intro_short.sqf"";closeDialog 0;";
	};

		class Intro2: LOKI_RscButton
	{
		idc = 72312;
		x = 0.270;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		text = "Random";
		SizeEx = 0.025;
		action = "nul = [] execVM ""\loki_lost_key\intro\x_intro.sqf"";closeDialog 0;";
	};

		class Intro3: LOKI_RscButton
	{
		idc = 72313;
		x = 0.270;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		text = "Intro3";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};

		class Intro4: LOKI_RscButton
	{
		idc = 72314;
		x = 0.270;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		text = "Intro4";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};

		class Intro5: LOKI_RscButton
	{
		idc = 72315;
		x = 0.270;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		text = "Intro5";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};	

		class Intro6: LOKI_RscButton
	{
		idc = 72316;
		x = 0.270;
		y = 0.690;
		w = 0.200;
		h = 0.075;
		text = "Intro6";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};	

		class Intro7: LOKI_RscButton
	{
		idc = 72317;
		x = 0.270;
		y = 0.765;
		w = 0.200;
		h = 0.075;
		text = "Intro7";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};	

//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 3rd Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class Outro1: LOKI_RscButton
	{
		idc = 72321;
		x = 0.385;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "Outro Short";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""intro\x_intro_short.sqf"";closeDialog 0;";
	};

		class Outro2: LOKI_RscButton
	{
		idc = 72322;
		x = 0.385;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		text = "Random";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""intro\x_intro.sqf"";closeDialog 0;";
	};

		class Outro3: LOKI_RscButton
	{
		idc = 72323;
		x = 0.385;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		text = "Outro3";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};

		class Outro4: LOKI_RscButton
	{
		idc = 72324;
		x = 0.385;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		text = "Outro4";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};

		class Outro5: LOKI_RscButton
	{
		idc = 72325;
		x = 0.385;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		text = "Outro5";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};	

		class Outro6: LOKI_RscButton
	{
		idc = 72326;
		x = 0.385;
		y = 0.690;
		w = 0.200;
		h = 0.075;
		text = "Outro6";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};	

		class Outro7: LOKI_RscButton
	{
		idc = 72327;
		x = 0.385;
		y = 0.765;
		w = 0.200;
		h = 0.075;
		text = "Outro7";
		SizeEx = 0.025;
		//action = "nul = [] execVM ""AnimationViewer\init.sqf"";closeDialog 0;";
	};	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 4th Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

		class Video1: LOKI_RscButton
	{
		idc = 72331;
		x = 0.500;
		y = 0.315;
		w = 0.200;
		h = 0.075;
		text = "Video1";
		SizeEx = 0.025;
		action = "['\ca\video_pmc\CP00_Reynolds_a.ogv',1.04] call bis_fnc_customGPSvideo;closeDialog 0;";
	};

		class Video2: LOKI_RscButton
	{
		idc = 72332;
		x = 0.500;
		y = 0.390;
		w = 0.200;
		h = 0.075;
		text = "Video2";
		SizeEx = 0.025;
		action = "['\ca\video_pmc\CP01_intro.ogv',1.04] call bis_fnc_customGPSvideo;closeDialog 0;";
	};

		class Video3: LOKI_RscButton
	{
		idc = 72333;
		x = 0.500;
		y = 0.465;
		w = 0.200;
		h = 0.075;
		text = "Video3";
		SizeEx = 0.025;
		action = "['\ca\video_pmc\cp03_intro.ogv',1.04] call bis_fnc_customGPSvideo;closeDialog 0;";
	};

		class Video4: LOKI_RscButton
	{
		idc = 72334;
		x = 0.500;
		y = 0.540;
		w = 0.200;
		h = 0.075;
		text = "Video4";
		SizeEx = 0.025;
		action = "['\ca\video_pmc\cp03_outro.ogv',1.04] call bis_fnc_customGPSvideo;closeDialog 0;";
	};

		class Video5: LOKI_RscButton
	{
		idc = 72335;
		x = 0.500;
		y = 0.615;
		w = 0.200;
		h = 0.075;
		text = "Video5";
		SizeEx = 0.025;
		action = "['\ca\video_pmc\cp10_outro_a.ogv',1.04] call bis_fnc_customGPSvideo;closeDialog 0;";
	};	

		class Custom1: LOKI_RscButton
	{
		idc = 72336;
		x = 0.500;
		y = 0.690;
		w = 0.200;
		h = 0.075;
		text = "Custom1";
		SizeEx = 0.025;
		action = "['\loki_lost_key\videos\fail.ogv',1.04] call bis_fnc_customGPSvideo;closeDialog 0;";
	};	

		class Custom2: LOKI_RscButton
	{
		idc = 72337;
		x = 0.500;
		y = 0.765;
		w = 0.200;
		h = 0.075;
		text = "Custom2";
		SizeEx = 0.025;
		action = "['\loki_lost_key\videos\Warning.ogv',1.04] call bis_fnc_customGPSvideo;closeDialog 0;";
	};	
	
	
	
// LIST BOX ------------------------------------------------------------------------------	
		
		//class ListBox : LOKI_RscListBox
		class ListBox :LOKI_RscListBox
	{
		idc = 72011;
		x = 0.520; 
		y = 0.340;
		w = 0.380; 
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
