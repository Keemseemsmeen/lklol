//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//
// 1st Column
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
		class scalar: LOKI_RscButton
	{
		idc = 72351;
		x = 0.105;
		y = 0.560;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Scalar (sm)";
	    action = "closeDialog 0; call fnc_loki_Scalar_Spawner;";

	};
	
		class scalarBig: LOKI_RscButton
	{
		idc = 72352;
		x = 0.105;
		y = 0.635;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Scalar (big)";
	    action = "closeDialog 0; call fnc_loki_Scalar_SpawnerBig;";

	};
	
		class holoMap: LOKI_RscButton
	{
		idc = 72353;
		x = 0.105;
		y = 0.710;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "HoloMap";
	    action = "closeDialog 0; call fnc_loki_HoloMap;";

	};	

		class scuba: LOKI_RscButton
	{
		idc = 72354;
		x = 0.105;
		y = 0.785;
		w = 0.200;
		h = 0.075;
		SizeEx = 0.025;
		text = "Scuba";
	    action = "closeDialog 0; call fnc_loki_Scuba;";

	};

// MUSIC PLAYER TEXT ------------------------------------------------------------

	class Music : LOKI_RscButton
	{
	idc = 72380;
	x = 0.930;
	y = 0.370;
	w = 0.150;
	h = 0.040;
	style = ST_CENTER;
	colorBackground[] = {0.25,0.25,0.25,1.0};
	text = "Music";
	SizeEx = 0.033;	
	action = "[] execVM '\loki_lost_key\loki_scripts\MusicPlayer\MusicPlayer.sqf'";
	};

	class MusicStop : LOKI_RscButton
	{
	idc = 72381;
	x = 0.940;
	y = 0.490;
	w = 0.040;
	h = 0.040;
	style = ST_CENTER;
	colorText[] = {0.72,0,0,1};
	colorBackground[] = {0.25,0.25,0.25,1.0};
	text = "[]";
	SizeEx = 0.033;	
	action = "playMusic """";";
	};

	class MusicPlay : LOKI_RscButton
	{
	idc = 72382;
	x = 0.940;
	y = 0.430;
	w = 0.040;
	h = 0.040;
	style = ST_CENTER;
	colorText[] = {0,0.72,0,1};
	colorBackground[] = {0.25,0.25,0.25,1.0};
	text = ">";
	SizeEx = 0.040;	
	action = "_index=lbCurSel 72011;_tune=lbData [72011,_index]; playMusic _tune;";
	};	
	
	class MusicPrev : LOKI_RscButton
	{
	idc = 72383;
	x = 1.030;
	y = 0.490;
	w = 0.040;
	h = 0.040;
	style = ST_CENTER;
	colorText[] = {0.5,0.5,0,1};
	colorBackground[] = {0.25,0.25,0.25,1.0};
	text = "<<";
	SizeEx = 0.040;	
	action = "_cur = lbCurSel 72011; _count = ((lbSize 72011) - 1); if (_cur == 0) then {lbSetCurSel [72011, _count];} else {lbSetCurSel [72011, (_cur - 1)];}; _index=lbCurSel 72011;_tune=lbData [72011,_index]; playMusic _tune;";
	};	
	
	class MusicNext : LOKI_RscButton
	{
	idc = 72384;
	x = 1.030;
	y = 0.430;
	w = 0.040;
	h = 0.040;
	style = ST_CENTER;
	colorText[] = {0.5,0.5,0,1};
	colorBackground[] = {0.25,0.25,0.25,1.0};
	text = ">>";
	SizeEx = 0.040;	
	action = "_cur = lbCurSel 72011; _count = ((lbSize 72011) - 1); if (_cur == 0) then {lbSetCurSel [72011, _count];} else {lbSetCurSel [72011, (_cur + 1)];}; _index=lbCurSel 72011;_tune=lbData [72011,_index]; playMusic _tune;";
	};	

class MusicVolume : LOKI_RscXSliderH
{
	idc = 72385;
	x = 0.930;
	y = 0.550;
	access = 0;
	type = 3;
	style = "0x400  + 0x10";
	h = 0.043;
	w = 0.150;
	color[] = {0,0.72,0.72,1};
	colorActive[] = {1, 0.63, 0.33, 1};
	onSliderPosChanged = "_slider = _this select 0; _position = sliderPosition _slider; 0 fadeMusic (1 - _position);";
};		
		
//----------------------------------------------------------------------------	
	
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
