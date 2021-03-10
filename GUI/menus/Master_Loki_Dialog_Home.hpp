
	class loki {
		idc = -1;
		moving = 1;
		type = CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {};
		colorBackground[] = {};
		font = "Bitstream";
		x = 0.020;
		y = 0.020;
		w = 1.0;
		h = 0.850;
		sizeEx = 0.5;
		text = "\loki_lost_key\GUI\img\loki.paa";
	};	
	
			class credits: LOKI_RscButton
	{
		idc = 72115;
		x = 0.100;
		y = 0.785;
		w = 0.175;
		h = 0.050;
		style = ST_CENTER;
		SizeEx = 0.033;
		text = "Credits";
	    action = "closeDialog 0; call fnc_loki_credits;";

	};	
	
		class knownIssues: LOKI_RscButton
	{
		idc = 72116;
		x = 0.250;
		y = 0.785;
		w = 0.175;
		h = 0.050;
		style = ST_CENTER;
		SizeEx = 0.033;
		text = "Known Issues";
	    action = "call fnc_loki_knownIssues; closedialog 0";

	};	
	
		class howTo: LOKI_RscButton
	{
		idc = 72117;
		x = 0.600;
		y = 0.785;
		w = 0.175;
		h = 0.050;
		style = ST_CENTER;
		SizeEx = 0.033;
		text = "How To";
	    action = "call fnc_loki_howTo; closedialog 0";

	};	

		class About: LOKI_RscButton
	{
		idc = 72118;
		x = 0.750;
		y = 0.785;
		w = 0.175;
		h = 0.050;
		style = ST_CENTER;
		SizeEx = 0.033;
		text = "About";
	    action = "call fnc_loki_About; closedialog 0";

	};