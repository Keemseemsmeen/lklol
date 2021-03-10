

		class Home: LOKI_RscButton
	{
		idc = 72100;
		x = -0.005;
		y = 0.110;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Home";
		action = "home = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Home.sqf'";
		SizeEx = 0.025;
		
	};

		class Admin: LOKI_RscButton
	{
		idc = 72101;
		x = -0.005;
		y = 0.185;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Admin";
		action = "admin = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Admin.sqf'";
		SizeEx = 0.025;
		
	};


		class Work: LOKI_RscButton
	{
		idc = 72102;
		x = -0.005;
		y = 0.260;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Work";
		action = "work = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Work.sqf';";
		SizeEx = 0.025;
		
	};
	
		class Work2: LOKI_RscButton
	{
		idc = 72103;
		x = -0.005;
		y = 0.335;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Work 2";
		action = "work = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Work2.sqf';";
		SizeEx = 0.025;
		
	};	
	
		class Debug: LOKI_RscButton
	{
		idc = 72104;
		x = -0.005;
		y = 0.410;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Debug";
		action = "debug = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Debug.sqf';";
		SizeEx = 0.025;
		
	};

		class Cinema: LOKI_RscButton
	{
		idc = 72105;
		x = -0.005;
		y = 0.485;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Cinema";
		action = "cinema = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Cinema.sqf';";
		SizeEx = 0.025;
		
	};
		class Fun: LOKI_RscButton
	{
		idc = 72106;
		x = -0.005;
		y = 0.560;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Fun";
		action = "fun = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Fun.sqf';";
		SizeEx = 0.025;
		
	};

		class Modules: LOKI_RscButton
	{
		idc = 72107;
		x = -0.005;
		y = 0.635;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Modules";
		action = "modules = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Modules.sqf';";
		SizeEx = 0.025;
		
	};

		class SITCOM: LOKI_RscButton
	{
		idc = 72108;
		x = -0.005;
		y = 0.710;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "SITCOM";
		action = "";
		SizeEx = 0.025;
		
	};
	
		class Button3: LOKI_RscButton
	{
		idc = 72109;
		x = -0.005;
		y = 0.785;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Button3";
		action = "";
		SizeEx = 0.025;
		
	};	
	
		class Testing: LOKI_RscButton
	{
		idc = 72110;
		x = -0.005;
		y = 0.860;
		w = 0.125;
		h = 0.050;
		style = ST_CENTER;
		text = "Testing";
		//action = "test = [] execVM '\loki_lost_key\GUI\scripts\KeyPad_Testing.sqf'";
		SizeEx = 0.025;
		
	};	
	
	
	
	
// Bottom Row -----------------------------------------------------------------------------------

	class Exit : LOKI_RscButton
	{
	idc = 72111;
	x = 0.515;
	y = 0.880;
	w = 0.060;
	h = 0.060;
	style = ST_CENTER;
	text = "eXit";
    sizeEx = 0.040;
	colorText[] = {0.72,0,0,1};
	action = "closedialog 0";
	};		
	
	
// Top Bar   -------------------------------------------------------------------------------	
		class Version: LOKI_RscButton
	{
		idc = 72113;
		x = 1.0;
		y = 0.010;
		w = 0.200;
		h = 0.075;
		style = ST_LEFT;
		text = "v72.Zulu";
		SizeEx = 0.025;
		action = "[] execVM '\loki_lost_key\GUI\scripts\version.sqf'";
	    
	};
	
	class Header : LOKI_RscText {
		idc = 72114;
		x = 0.050;
		y = 0.020;
		w= 1.0;
		h= 0.06;
		style = ST_LEFT;
		text="LOKI                               LOST  KEY        ";
		sizeEx = 0.04;
		colorBackground[] = {0.1,0.1,0.1,0};
	};	