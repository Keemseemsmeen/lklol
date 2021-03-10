// BACKGROUND AND MAP -------------------------------------------------------------	

	class daBackground : LOKI_RscText
	{
	idc = 72099;
	x = 0.020;
	y = 0.020;
	w = 1.0;
	h = 0.850;
	sizeEx = 0.5;
	colorBackground[] = {0.1,0.1,0.1,0.75};
	moving = 1;
	
	};
	
	
	
	class ARS_Moniter {
		idc = -1;
		moving = 1;
		type = CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {};
		colorBackground[] = {};
		font = "Bitstream";
		sizeEx = 1.1;
		x = 0.000;
		y = 0.000;
		w = 1.125;
		h = 0.950;
		text = "\loki_lost_key\GUI\img\ARS_Monitor.paa";
	};	