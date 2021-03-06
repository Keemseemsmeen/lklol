#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

#define ReadAndWrite 0

#define ProcTextWhite "#(argb,8,8,3)color(1,1,1,1)"
#define ProcTextEmpty "#(argb,8,8,3)color(1,1,1,0)"
#define ProcTextBlack "#(argb,8,8,3)color(0,0,0,1)"
#define ProcTextGray "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define ProcTextRed "#(argb,8,8,3)color(1,0,0,1)"
#define ProcTextGreen "#(argb,8,8,3)color(0,1,0,1)"
#define ProcTextBlue "#(argb,8,8,3)color(0,0,1,1)"

//Colors
#define Color_KackG 				{0.36, 0.4, 0.38, 1}
#define Color_KackY					{0.8, 0.7, 0.6, 1}
#define Color_KackB 				{0.51, 0.48, 0.46, 1}
#define Color_WhiteDark 			{1, 1, 1, 0.5}
#define Color_White					{1, 1, 1, 1}
#define Color_Black 				{0, 0, 0, 1}
#define Color_Gray 					{1, 1, 1, 0.5}
#define Color_GrayLight 			{0.6, 0.6, 0.6, 1}
#define Color_GrayDark 				{0.2, 0.2, 0.2, 1}
#define Color_DarkRed 				{0.5, 0.1, 0, 0.5}
#define Color_Green 				{0.8, 0.9, 0.4, 1}
#define Color_Orange 				{0.9, 0.45, 0.1, 1}
#define Color_Red 					{0.9, 0.2, 0.2, 1}
#define Color_Blue 					{0.2, 0.2, 0.9, 1}
#define Color_NoColor				{0, 0, 0, 0}

#define CA_UI_element_background 		{1, 1, 1, 0.7}
#define CA_UI_background 				{0.023529, 0, 0.0313725, 1}
#define CA_UI_help_background 			{0.2, 0.1, 0.1, 0.7}
#define CA_UI_title_background			{0.24, 0.47, 0.07, 1.0}
#define CA_UI_green						{0.84,1,0.55,1}

//Colors background
//#define CA_UI_background 			{0.6, 0.6, 0.6, 0.4}
#define CA_UI_background                        {0.023529, 0, 0.0313725, 1}
#define Color_MainBack 				{1, 1, 1, 0.9} //hlavni pozadi

//Font Size
#define TextSize_IGUI_normal 		0.023 // test //19/768
#define TextSize_small 				0.022 //16/768
#define TextSize_normal 			0.024 //19/768
#define TextSize_medium 			0.027 //23/768
#define TextSize_large  			0.057 //44/768



// Constants to standardize and help simplify positioning and sizing
#define Dlg_ROWS 36 // determines default text and control height
#define Dlg_COLS 90 // guide for positioning controls

// (Calculate proportion, then /100 to represent as percentage)
#define Dlg_CONTROLHGT ((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH ((100/Dlg_COLS)/100)

// modifiers
#define Dlg_TEXTHGT_MOD 0.9
#define Dlg_ROWSPACING_MOD 1.3

#define Dlg_ROWHGT (Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT (Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)

//-----------------------------------------------------------------------------
// Fonts
#define FontM "TahomaB"
#define FontHTML "TahomaB"
//"CourierNewB64" "TahomaB" "Bitstream" "Zeppelin32"


//-----------------------------------------------------------------------------
// standard base dialog control class definitions
//-----------------------------------------------------------------------------

class LOKI_RscText
{
  type = CT_STATIC;
  idc = 72999;
  style = ST_CENTER;
  x = safeZoneX;
  y = safeZoneY;
  w = 0.3;
  h = Dlg_CONTROLHGT;
  sizeEx = 0.25;
  colorText[] = {0,0.72,0.72,1};
  colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
  font = Zeppelin32;
  
  text = "";
};

class LOKI_RscPicture
{
	access = ReadAndWrite;
	idc = -1;
	type = CT_STATIC;
	style = ST_PICTURE;
	font = Zeppelin32;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0, 0, 0, 0};
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
};


class LOKI_RscXSliderH  {
	type = 43;
	style = "0x400  + 0x10";
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.400000;
	color[] = {1,1,1,0.400000 };
	colorActive[] = {1,1,1,1 };
	colorDisabled[] = {1,1,1,0.200000 };
	arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
	border = "\ca\ui\data\ui_border_frame_ca.paa";
	thumb = "\ca\ui\data\ui_slider_bar_ca.paa";
};


class LOKI_RscStandardDisplay { 
	access = 0; 
	movingEnable = 1; 
	enableSimulation = 1; 
	enableDisplay = 1; 
};

class LOKI_info_text
{
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	x = 0.0; w = 0.3;
	y = 0.0; h = 0.03;
	sizeEx = 0.023;
	colorBackground[] = {0.5, 0.5, 0.5, 0};
	colorText[] = {0.85, 0.85, 0.85, 1};
	font = "Zeppelin32";
	text = "";
};

class LOKI_RscEdit
{
  type = CT_EDIT;
  idc = -1;
  style = ST_CENTER;

  x = 0.1;
  y = 0.1;
  w = 0.1;
  h = Dlg_CONTROLHGT;
  sizeEx = 0.033;

  colorText[] = {0,0.72,0.72,1};
  colorSelection[] = {0,0.72,0.72,1};
  colorBackground[] = {0.1,0.1,0.1,0};
  font = Zeppelin32;

  autocomplete = false;
  text = "";
};

class LOKI_RscButton
{
	// common control items
	access = ReadAndWrite;
	type = CT_ACTIVETEXT;
	style = ST_LEFT;
	x = safeZoneX; 
	y = safeZoneY;
	w = 0.3;
	h = 0.1;

	// text properties
	text = "";
	font = Zeppelin32;
	sizeEx = 0.015;
		color[] = {0,0.72,0.72,1};
		colorActive[] = { 1, 0.2, 0.2, 1 }; 
		colorFocused[] = { 0, 1, 0, 1 }; // border color for focused state 
		colorDisabled[] = { 0, 0, 1, 0.7 }; // text color for disabled state
		colorBackground[] = {0.1,0.1,0.1,0};
		colorBackgroundDisabled[] = { 1, 1, 1, 0.5 }; // background color for disabled state 
		colorBackgroundActive[] = { 0.5, 0.5, 0.5, 0.5 }; // background color for active state 
		offsetX = 0.003;
		offsetY = 0.003;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		colorShadow[] = {0.023529, 0, 0.0313725, 0};
		colorBorder[] = {0.023529, 0, 0.0313725, 0};
	borderSize = 0.008; // when negative, the border is on the right side of background


	// sounds
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
};


class LOKI_RscListBox
{
	type = 5;
	style = 0 + 0x10;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorSelect2[] = {0.023529, 0, 0.0313725, 1};
	colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};
	colorSelectBackground2[] = {0.58, 0.1147, 0.1108, 1};
	period = 1;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class LOKI_RscLB_LIST :LOKI_RscListBox
{
  // type = defined in derived class
  idc = -1;
  style = ST_LEFT;

  x = 0.1;
  y = 0.1;
  w = 0.2;
  h = Dlg_CONTROLHGT;
  sizeEx = Dlg_TEXTHGT;
  rowHeight = Dlg_TEXTHGT;

  color[] = {Dlg_Color_White,1};
  colorText[] = {Dlg_ColorScheme_WindowText,1};
  colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1}; // always clear?
  colorSelect[] = {Dlg_ColorScheme_WindowText,1};
  colorSelect2[] = {Dlg_ColorScheme_WindowText,1};
  colorScrollbar[] = {Dlg_Color_White,1};
  colorSelectBackground[] = {Dlg_ColorScheme_3DControlBackground,1};
  colorSelectBackground2[] = {Dlg_ColorScheme_HighlightBackground,1};
  font = Zeppelin32;
  
  soundSelect[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
  soundExpand[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
  soundCollapse[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
};
//-------------------------------------

//-------------------------------------
class LOKI_RscCombo: LOKI_RscLB_LIST
{
  type = CT_COMBO;
  
    thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	border = "\ca\ui\data\ui_border_scroll_ca.paa";

  wholeHeight = 0.3;
};

//-------------------------------------
class LOKI_RscHTML
{
  type = CT_HTML;
  idc = -1;
  style = ST_LEFT;
  
  x = 0.1;
  y = 0.1;
  w = 0.2;
  h = 0.4;

	colorText[] = {Dlg_ColorScheme_WindowText,1};
	colorLink[] = {0.05, 0.2, 0.05, 1};
	colorBold[] = {0, 1, 1, 1};
	colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
	colorLinkActive[] = {0, 0, 0.2, 1};
	colorPicture[] = {Dlg_Color_Black, 1};
	colorPictureLink[] = {Dlg_Color_Black, 1};
	colorPictureSelected[] = {Dlg_Color_Black, 1};
	colorPictureBorder[] = {Dlg_Color_Black, 1};

	prevPage = "\ca\ui\data\arrow_left_ca.paa";
	nextPage = "\ca\ui\data\arrow_right_ca.paa";
	filename = "";
	
	class HeadingStyle {
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = Dlg_TEXTHGT;
	};
	
	class H1: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.5;
	};
	
	class H2: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.4;
	};
	
	class H3: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.3;
	};
	
	class H4: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.2;
	};
	
	class H5: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.1;
	};
	
	class H6: HeadingStyle {
		sizeEx = Dlg_TEXTHGT;
	};
	
	class P: HeadingStyle {
		sizeEx = Dlg_TEXTHGT;
	};
};
//-------------------------------------
class LOKI_RscStructuredText
{
	access = ReadAndWrite;
  type = CT_STRUCTURED_TEXT;
	idc = -1;
  style = ST_MULTI;
  
  x = 0.1;
  y = 0.1;
	w = 0.1;
	h = 0.05;
	sizeEx = Dlg_CONTROLHGT;
  size = Dlg_TEXTHGT;
	lineSpacing = 1;

	colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
	colorText[] = {Dlg_ColorScheme_DialogText, 1};

	text = "";

  class Attributes
  {
     font = FontM;
     color = "#ffffff";
     align = "left";
     shadow = false;
  };
};
//-------------------------------------










// MAP CONTROLS
class LOKI_RscMapControl 
{
	access = ReadAndWrite;
	type = 101;
	idc = -1;
	style = 48;
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.04;
	colorSea[] = {0.56, 0.8, 0.98, 0.5};
	colorForest[] = {0.6, 0.8, 0.2, 0.5};
	colorRocks[] = {0.5, 0.5, 0.5, 0.5};
	colorCountlines[] = {0.65, 0.45, 0.27, 0.5};
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1};
	colorCountlinesWater[] = {0, 0.53, 1, 0.5};
	colorMainCountlinesWater[] = {0, 0.53, 1, 1};
	colorForestBorder[] = {0.4, 0.8, 0, 1};
	colorRocksBorder[] = {0.5, 0.5, 0.5, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorRailWay[] = {0.8, 0.2, 0.3, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.5};
	colorLevels[] = {0, 0, 0, 1};
	colorOutside[] = {0, 0, 0, 1};
	fontLabel = "TahomaB";
	sizeExLabel = 0.04;
	fontGrid = "TahomaB";
	sizeExGrid = 0.04;
	fontUnits = "TahomaB";
	sizeExUnits = 0.04;
	fontNames = "TahomaB";
	sizeExNames = 0.04;
	fontInfo = "TahomaB";
	sizeExInfo = 0.04;
	fontLevel = "TahomaB";
	sizeExLevel = 0.04;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.2, {"Gamma", 1, 1.5}};
	stickY[] = {0.2, {"Gamma", 1, 1.5}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	showCountourInterval = "true";
	maxSatelliteAlpha = 0;
	alphAFadeStartScale = 0;
	alphAFadeEndScale = 0;
	
		class Task {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
			iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
			iconDone = "#(argb,8,8,3)color(0,0,0,1)";
			iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
			colorCreated[] = {1,1,1,1};
			colorCanceled[] = {1,1,1,1};
			colorDone[] = {1,1,1,1};
			colorFailed[] = {1,1,1,1};
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};	
		class CustomMark {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
						
		class Legend {
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			font = "Zeppelin32";
			sizeEx = 0.0151;
			colorBackground[] = {1, 1, 1, 0.3};
			color[] = {0, 0, 0, 1};
		};
		
		class ActiveMarker {
			color[] = {0.3, 0.1, 0.9, 1};
			size = 50;
		};
				
		class Bunker {
			icon = "\ca\ui\data\map_bunker_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 14;
			importance = 1.5 * 14 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Bush {
			icon = "\ca\ui\data\map_bush_ca.paa";
			color[] = {0, 0.3, 0, 1};
			size = 14;
			importance = 0.2 * 14 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class BusStop {
			icon = "\ca\ui\data\map_busstop_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 10;
			importance = 1 * 10 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Command {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		
		class Cross {
			icon = "\ca\ui\data\map_cross_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 16;
			importance = 0.7 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Fortress {
			icon = "\ca\ui\data\map_bunker_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Fuelstation {
			icon = "\ca\ui\data\map_fuelstation_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.75;
			coefMax = 4;
		};
		
		class Fountain {
			icon = "\ca\ui\data\map_fountain_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 12;
			importance = 1 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Hospital {
			icon = "\ca\ui\data\map_hospital_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Chapel {
			icon = "\ca\ui\data\map_chapel_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 1 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Church {
			icon = "\ca\ui\data\map_church_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Lighthouse {
			icon = "\ca\ui\data\map_lighthouse_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 20;
			importance = 3 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Quay {
			icon = "\ca\ui\data\map_quay_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Rock {
			icon = "\ca\ui\data\map_rock_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 12;
			importance = 0.5 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Ruin {
			icon = "\ca\ui\data\map_ruin_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 1.2 * 16 * 0.05;
			coefMin = 1;
			coefMax = 4;
		};
		
		class SmallTree {
			icon = "\ca\ui\data\map_smalltree_ca.paa";
			color[] = {0.55, 0.64, 0.43, 1};
			size = 12;
			importance = 0.6 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Stack {
			icon = "\ca\ui\data\map_stack_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 20;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Tree {
			icon = "\ca\ui\data\map_tree_ca.paa";
			color[] = {0.55, 0.64, 0.43, 1};
			size = 12;
			importance = 0.9 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Tourism {
			icon = "\ca\ui\data\map_tourism_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 1 * 16 * 0.05;
			coefMin = 0.7;
			coefMax = 4;
		};
		
		class Transmitter {
			icon = "\ca\ui\data\map_transmitter_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 20;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class ViewTower {
			icon = "\ca\ui\data\map_viewtower_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 2.5 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Watertower {
			icon = "\ca\ui\data\map_watertower_ca.paa";
			color[] = {0, 0.35, 0.7, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Waypoint {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;			
		};
		
		class WaypointCompleted {
			icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;			
		};
};
