class rscAAN
{
	idd = 3000;
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	onLoad = "uinamespace setvariable ['BIS_AAN',_this select 0]";
	onUnLoad = "uinamespace setvariable ['BIS_AAN',nil]";

	#define BAR_WHITE_HEIGHT	0.06
	#define BAR_RED_HEIGHT	0.2
	
	class ControlsBackground
	{
		class BackgroundBarWhite: RscText
		{
			x = safezoneXAbs;
			y = safezoneY + safezoneH - BAR_WHITE_HEIGHT;
			w = safezoneWAbs;
			h = BAR_WHITE_HEIGHT;
			colorBackground[] = {1,1,1,1};
		};
		class BackgroundBarRed: BackgroundBarWhite
		{
			y = safezoneY + safezoneH - BAR_WHITE_HEIGHT - BAR_RED_HEIGHT;
			h = BAR_RED_HEIGHT;
			colorBackground[] = {0.5,0,0,0.6};
		};
	};
	class Controls
	{
		class AANlogo_corner: RscPicture
		{
			x = safezoneXAbs + safezoneW - (BAR_RED_HEIGHT * 6/4);
			y = safezoneY;
			w = BAR_RED_HEIGHT * 6/4;
			h = BAR_RED_HEIGHT;
			colorText[] = {1,1,1,0.3};
			text = "\ca\ui\data\ui_rsctitle_aan_logo_corner_CA.paa";
		};
		class AANlogo: RscPicture
		{
			x = safezoneXAbs;
			y = safezoneY + safezoneH - BAR_WHITE_HEIGHT - BAR_RED_HEIGHT;
			w = BAR_RED_HEIGHT * 3;
			h = BAR_RED_HEIGHT;
			colorText[] = {1,1,1,1};
			text = "\ca\ui\data\ui_rsctitle_aan_logo_CA.paa";
		};
		class TextHeader: RscStructuredText
		{
			idc = 3001;
			x = safezoneXAbs + 0.5;
			y = safezoneY + safezoneH - BAR_WHITE_HEIGHT - BAR_RED_HEIGHT + BAR_RED_HEIGHT * 0.1;
			w = safezoneW - 0.5;
			h = BAR_RED_HEIGHT - BAR_RED_HEIGHT * 0.2;
			colorText[] = {1,1,1,1};
			style = ST_LEFT + ST_MULTI;
			class Attributes
			{
				font="TahomaB";
				color="#ffffff";
				align="left";
				shadow=0;
				valign="middle";
			};
		};
		class TextLine: TextHeader
		{
			idc = 3002;
			x = safezoneXAbs;
			y = safezoneY + safezoneH - BAR_WHITE_HEIGHT + 0.01;
			w = 10;
			h = BAR_WHITE_HEIGHT;
			colorText[] = {0,0,0,1};
			class Attributes
			{
				color="#000000";
				align="left";
				shadow=0;
				valign="middle";
			};
		};
		class TextClock: RscText
		{
			idc = 3003;
			style = ST_CENTER;
			x = safezoneXAbs + safezoneW - 0.15;
			y = safezoneY + safezoneH - BAR_WHITE_HEIGHT;
			w = 0.15;
			h = BAR_WHITE_HEIGHT;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			sizeEx = BAR_WHITE_HEIGHT;
		};

		class BackgroundBlackLeft: RscText
		{
			x = safezoneX;
			y = safezoneY;
			w = (safezoneW - safezoneWAbs) / 2;
			h = safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class BackgroundBlackRight: BackgroundBlackLeft
		{
			x = safezoneXAbs + safezoneWAbs;
		};
	};
};