		class Request : LOKI_RscButton
	{
		idc = 72157;
		x = 0.620;
		y = 0.880;
		w = 0.125;
		h = 0.050;
		text = "MapClick";
		SizeEx = 0.025;	
		action = "[] call Request";
	};		

		class Request2 : LOKI_RscButton
	{
		idc = 72158;
		x = 0.720;
		y = 0.880;
		w = 0.125;
		h = 0.050;
		colorText[] = {0,0.72,0,1};
		text = "Request";
		SizeEx = 0.025;		
		action = "[] call Request2";
	};		
	
		class Request3 : LOKI_RscButton
	{
		idc = 72159;
		x = 0.820;
		y = 0.880;
		w = 0.125;
		h = 0.050;
		colorDisabled[] = {0.1,0.1,0.1,1};
		colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
		text = "Rotate";
		action = "[] call Rotate";
		SizeEx = 0.025;	
    
	};	