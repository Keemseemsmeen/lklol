class LOKI_settingsDialog
{
	idd = -1;
	movingEnable = 1;
	controlsBackground[] = {ARS_Moniter,daBackground};
	controls[] = {ARS_Moniter,Header,daBackground,sTitle,sText,sEdit,sText3,sCombo,sButton,sText4,FogNumber,Weather,sText5};

#include "Master_LOKI_Dialog_GUI.hpp"	
#include "Master_LOKI_Dialog_Sets.hpp"
	
	
	
	class sTitle : LOKI_RscText
	{
	idc = -1;
	x = 0.25; 
	y = 0.50;
	w = 0.3; 
	h = 0.25;
	SizeEx = 0.042;
	style = ST_CENTER;
	colorText[] = {0,0.72,0.72,1};
	colorBackground[] = {0,0,0,0};
	text = "A Better View v7.2";
	};

	class sText : sTitle
	{
	idc = -1;
	x = 0.25; 
	y = 0.55;
	style = ST_LEFT;
	text = "View Distance: ";
	};

	class sEdit : LOKI_RscEdit
	{
	idc = 1;
	x = 0.65; 
	y = 0.655;
	w = 0.200; 
	h = 0.045;
	SizeEx = 0.042;
	colorText[] = {0,0.72,0.72,1};
	colorSelection[] = {0,0.,0,1};
	colorBackground[] = {0.4,0.4,0.4,1};
	};



	class sText3 : sText
	{
	idc = -1;
	y = 0.590;
	style = ST_LEFT;
	text = "Terrain Detail: ";
	};
	
	class sCombo : LOKI_RscCombo
	{
	idc = 3;
	x = 0.65; 
	y = 0.695;
	w = 0.200; 
	h = 0.045; 
	SizeEx = 0.042;
	colorText[] = {0,0.72,0.72,1};
	colorBackground[] = {0,0,0,0.5};
	colorSelect[] = {0,0.72,0,1};
	colorSelect2[] = {0,0.72,0,1};
	colorScrollbar[] = {0,0.72,0,1};
	colorSelectBackground[] = {0,0.33,0,0.5};
	colorSelectBackground2[] = {0.2,0.2,0.2,1};
	};

	class sText4 : sText
	{
	idc = -1;
	y = 0.630;
	style = ST_LEFT;
	text = "Fog: ";
	};	
	
	class FogNumber : LOKI_RscCombo
	{
	idc = 2;
	x = 0.65; 
	y = 0.735;
	w = 0.200; 
	h = 0.045; 
	SizeEx = 0.042;
	colorText[] = {0,0.72,0.72,1};
	colorBackground[] = {0,0,0,0.5};
	colorSelect[] = {0,0.72,0,1};
	colorSelect2[] = {0,0.72,0,1};
	colorScrollbar[] = {0,0.72,0,1};
	colorSelectBackground[] = {0,0.33,0,0.5};
	colorSelectBackground2[] = {0.2,0.2,0.2,1};
	};
	class sText5 : sText
	{
	idc = -1;
	y = 0.665;
	style = ST_LEFT;
	text = "Weather: ";
	};	
	
	class Weather : LOKI_RscCombo
	{
	idc = 5;
	x = 0.65; 
	y = 0.775;
	w = 0.200; 
	h = 0.045; 
	SizeEx = 0.042;
	colorText[] = {0,0.72,0.72,1};
	colorBackground[] = {0,0,0,0.5};
	colorSelect[] = {0,0.72,0,1};
	colorSelect2[] = {0,0.72,0,1};
	colorScrollbar[] = {0,0.72,0,1};
	colorSelectBackground[] = {0,0.33,0,0.5};
	colorSelectBackground2[] = {0.2,0.2,0.2,1};
	};


	
	class sButton : LOKI_RscButton
	{
	idc = -1;
	x = 0.425; 
	y = 0.800;
	w = 0.25;
	SizeEx = 0.042;
	colorText[] = {0,0.72,0.72,1};
	colorBackground[] = {0,0.33,0,0.5};
	colorBackgroundActive[] = {0,0.72,0,0.72};
	colorFocused[] = {0,0.72,0,1};
	text = "Accept";
	action = "[] call BM_set";
	};
};