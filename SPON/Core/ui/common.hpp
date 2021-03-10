// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
// SPON\Core\ui\common.hpp
//
// Description:
//   Common dialog component definitions for SPON Core (debug log) and other
//   SPON components.
//
// IMPORTANT NOTE:
//   Much of the contents of this file are copied from BIS files or online
//   documentation (BIKI/OFPEC), so the license applies only to the changes I
//   have made.
//
// -----------------------------------------------------------------------------

#ifndef SPON_CORE_COMMON_HPP
#define SPON_CORE_COMMON_HPP

#include "schema.hpp"

// Control types
#ifndef CT_STATIC

#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW 10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_XKEYDESC 40
#define CT_XBUTTON 41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_USER 99
#define CT_MAP 100 // Plain map.
#define CT_MAP_MAIN 101 // Map with markers shown.

#endif // #ifndef CT_STATIC

// Static styles
#ifndef ST_POS
#define ST_POS 0x0F
#define ST_HPOS 0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_DOWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0c
#define ST_TYPE 0xF0
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_MULTIPLESELECTION 0x20
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_BACKGROUND 80
#define ST_GROUP_BOX 96
#define ST_GROUP_BOX2 112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE 176

#endif // #ifndef ST_POS

// -----------------------------------------------------------------------------

#define SPON_FONT_SIZE_SMALL 0.022
#define SPON_FONT_SIZE 0.027
#define SPON_FONT_SIZE_HEADING (SPON_FONT_SIZE * 1.25)
#define SPON_FONT_SIZE_LARGE 0.04

#define SPON_HEADING_HEIGHT (SPON_FONT_SIZE_HEADING * 1.25)
#define SPON_LABEL_HEIGHT (SPON_FONT_SIZE * 1.25)
#define SPON_EDIT_HEIGHT (SPON_FONT_SIZE * 1.25)
#define SPON_BUTTON_HEIGHT (SPON_FONT_SIZE * 1.25)
#define SPON_LISTBOX_ROW_HEIGHT (SPON_FONT_SIZE * 1.25)
#define SPON_COMBO_HEIGHT (SPON_FONT_SIZE * 1.25)

#define SPON_BUTTON_WIDTH 0.12

#define SPON_VERTICAL_SPACING (SPON_FONT_SIZE * 0.5)
#define SPON_HORIZONTAL_SPACING (SPON_FONT_SIZE * 0.5)

// -----------------------------------------------------------------------------

// Requires:
//   x, y, w, h, text
//
class SPON_rscText // Abstract.
{
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	
	// Font.
	font = SPON_FONT;
	sizeEx = SPON_FONT_SIZE;

	// Colours.
	colorText[] = SPON_TEXT_COLOUR;
	colorBackground[] = SPON_TRANSPARENT_COLOUR;
};

// -----------------------------------------------------------------------------

// Background for a window.
// Requires:
//   x, y, w, h
//
class SPON_rscBackground : SPON_rscText
{
	text = "";
	
	colorBackground[] = SPON_BACKGROUND_COLOUR;
};

// -----------------------------------------------------------------------------
// Icon.
// Requires:
//   x, y, w, h, text (jpg/paa/pac image path).
//
class SPON_rscPicture : SPON_rscText
{
	style = ST_PICTURE;
	colorText[] = SPON_PICTURE_COLOUR;
};

// -----------------------------------------------------------------------------

// Requires:
//   x, y, w, text
//
class SPON_rscLabel : SPON_rscText
{
	h = SPON_LABEL_HEIGHT;
};

// -----------------------------------------------------------------------------
// Requires:
//   x, y, w, text
//
class SPON_rscHeadingLabel : SPON_rscText
{
	style = ST_CENTER;
	
	font = SPON_FONT_BOLD;
	
	sizeEx = SPON_FONT_SIZE_HEADING;
	h = SPON_HEADING_HEIGHT;
	
	colorBackground[] = SPON_HEADING_BACKGROUND_COLOUR;
};

// -----------------------------------------------------------------------------

// Requires:
//   x, y, w, h
//
class SPON_rscTextArea : SPON_rscText
{
	type = CT_STATIC;
	style = ST_MULTI;
	
	lineSpacing = 1;
	
	text = "";
};

// -----------------------------------------------------------------------------

// Requires:
//   x, y, w, text, action
class SPON_rscActiveText
{
	type = CT_ACTIVETEXT;
	idc = -1;
	style = ST_LEFT;
	
	// Font.
	font = SPON_FONT;
	sizeEx = SPON_FONT_SIZE;
	h = SPON_LABEL_HEIGHT;
	
	// Colours.
	color[] = SPON_HYPERLINK_COLOUR;
	colorActive[] = SPON_HYPERLINK_HOVER_COLOUR;
	
	// Type-specific.
	default = 0;
	
	soundPush[] = {"", 0, 1};
	soundClick[] = {"", 0, 1};
	soundEscape[] = {"", 0, 1};
	soundEnter[] = {"", 0, 1};
};

// -----------------------------------------------------------------------------

// Requires:
//   x, y, w, text, action
class SPON_rscButton
{
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;
	
	h = SPON_BUTTON_HEIGHT;
	w = SPON_BUTTON_WIDTH;
	
	font = SPON_FONT;
	sizeEx = SPON_FONT_SIZE;

	colorText[] = SPON_TEXT_COLOUR;
	colorBackground[] = SPON_BUTTON_BACKGROUND_COLOUR;

	colorBackgroundActive[] = SPON_SELECTION_BACKGROUND_COLOUR;
	
	colorDisabled[] = SPON_BUTTON_DISABLED_COLOUR;
	colorBackgroundDisabled[] = SPON_BUTTON_DISABLED_BACKGROUND_COLOUR;
	
	colorFocused[] = SPON_BUTTON_FOCUSED_COLOUR;
	colorShadow[] = SPON_BUTTON_SHADOW_COLOUR;
	
	colorBorder[] = SPON_TRANSPARENT_COLOUR;
	borderSize = 0;
	
	offsetX = 0.004;
	offsetY = 0.004;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	
	soundEnter[] = {"",0,1 };
	soundPush[] = {"",0,1 };
	soundClick[] = {"",0,1 };
	soundEscape[] = {"",0,1 };
};



// -----------------------------------------------------------------------------

// Text editing area (autowraps and scrollable by moving the cursor,
// but cannot display newlines ("\n") or accept "enter" key).
//
// Requires:
//   x, y, w, h
//
class SPON_rscEditArea
{
	type = CT_EDIT;
	idc = -1;
	style = ST_MULTI;
	
	colorBackground[] = SPON_TRANSPARENT_COLOUR; // Hardcoded as transparent anyway.
	colorText[] = SPON_TEXT_COLOUR;
	colorSelection[] = SPON_SELECTION_BACKGROUND_COLOUR;
	font = SPON_FONT;
	sizeEx = SPON_FONT_SIZE;
	autocomplete = 0;
	text = "";
	size = 0.2;
};

// -----------------------------------------------------------------------------

// Text editing line.
//
// Requires:
//   x, y, w
//
class SPON_rscEdit : SPON_rscEditArea
{
	style = ST_LEFT;

	h = SPON_EDIT_HEIGHT;
};

// -----------------------------------------------------------------------------
//
// Requires:
//   x, y, w, h
class SPON_rscListBox
{
	idc = -1;
	type = CT_LISTBOX;
	style = ST_SINGLE;

	font = SPON_FONT;
	sizeEx = SPON_FONT_SIZE;
	rowHeight = SPON_LISTBOX_ROW_HEIGHT;
	colorText[] = SPON_TEXT_COLOUR;
	colorBackground[] = SPON_TRANSPARENT_COLOUR; // Hardcoded as transparent anyway.
	
	colorScrollbar[] = SPON_TEXT_COLOUR;
	
	colorSelect[] = {0,0,0,1 };
	colorSelect2[] = {0,0,0,1 };
	
	colorSelectBackground[] = SPON_SELECTION_BACKGROUND_COLOUR;
	colorSelectBackground4[] = SPON_SELECTION_BACKGROUND_COLOUR;
	
	soundSelect[] = {"",0.1,1 };
	period = 0;
};

// -----------------------------------------------------------------------------
// Multiple selection listbox.
class SPON_rscListBoxMulti : SPON_rscListBox
{
	style = ST_MULTIPLE_SELECTION;
};

// -----------------------------------------------------------------------------

class SPON_rscCombo : SPON_rscListBox
{
	type = CT_COMBO;

	h = SPON_COMBO_HEIGHT;
	wholeHeight = 0.25; // Vertical size of list when expanded.
	
	colorBackground[] = SPON_COMBO_BOX_BACKGROUND_COLOUR;
	soundExpand[] = {"", 0, 0};
	soundCollapse[] = {"", 0, 0};
};

// -----------------------------------------------------------------------------

class SPON_rscFrame : SPON_rscLabel
{
	style = ST_FRAME;
	sizeEx = SPON_FONT_SIZE_HEADING;
};

// -----------------------------------------------------------------------------
// Requires _x, _y, _w, _h, and a control class.
//
// Captures events, but does nothing else.
class SPON_rscEventArea  {
	type = CT_CONTROLS_GROUP;
	idc = -1;
	style = ST_SINGLE;

	class VScrollbar  {
		color[] = SPON_TEXT_COLOUR;
		width = 0.021;
	};

	class HScrollbar  {
		color[] = SPON_TEXT_COLOUR;
		height = 0.028;
	};
};

// -----------------------------------------------------------------------------

class SPON_rscMap : SPON_rscText
{
	type = CT_MAP_MAIN;
	style = ST_PICTURE;
	
	access = 0;
	
	colorBackground[] = { 1, 1, 1, 1 };
	colorText[] = { 0, 0, 0, 1 };
	
	colorSea[] = { 0.56, 0.8, 0.98, 0.5 };
	
	colorForest[] = { 0.6, 0.8, 0.2, 0.5 };
	colorForestBorder[] = { 0.4, 0.8, 0, 1 };
	
	colorRocks[] = { 0.6, 0.45, 0.27, 0.4 };
	colorRocksBorder[] = { 0.6, 0.45, 0.27, 0.4 };

	colorCountlines[] = { 0.7, 0.55, 0.3, 0.6 };
	colorMainCountlines[] = { 0.7, 0.55, 0.3, 1 };
	
	colorCountlinesWater[] = { 0, 0.53, 1, 0.5 };
	colorMainCountlinesWater[] = { 0, 0.53, 1, 1 };
	
	colorPowerLines[] = { 0, 0, 0, 1 };	
	colorNames[] = { 0, 0, 0, 1 };
	colorInactive[] = { 1, 1, 1, 0.5 };
	colorLevels[] = { 0, 0, 0, 1 };
	
	fontLabel = SPON_FONT;
	sizeExLabel = SPON_FONT_SIZE;
	
	fontGrid = SPON_FONT;
	sizeExGrid = SPON_FONT_SIZE;
	
	fontUnits = SPON_FONT;
	sizeExUnits = SPON_FONT_SIZE;
	
	fontNames = SPON_FONT;
	sizeExNames = 0.056;
	
	fontInfo = SPON_FONT;
	sizeExInfo = SPON_FONT_SIZE;
	
	fontLevel = SPON_FONT;
	sizeExLevel = SPON_FONT_SIZE;
	
	text = "\ca\ui\data\map_background2_co.paa";
	stickX[] = {0.2,{"Gamma",1,1.5 } };
	stickY[] = {0.2,{"Gamma",1,1.5 } };
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

	class Legend
	{
		x = 0.7;
		y = 0.85;
		w = 0.25;
		h = 0.1;
		font = SPON_FONT;
		sizeEx = SPON_FONT_SIZE_SMALL;
		colorBackground[] = SPON_BACKGROUND_COLOUR;
		color[] = SPON_TEXT_COLOUR;
	};

	class ActiveMarker
	{
		color[] = {0.3,0.1,0.9,1 };
		size = 50;
	};

	class Bunker
	{
    	color[] = {0, 0.35, 0.7, 1};
		icon = "\ca\ui\data\map_bunker_ca.paa";
		size = 14;
		importance = 1.5 * 14 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Bush
	{
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 14;
		importance = 0.2 * 14 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class BusStop
	{
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 10;
		importance = 1 * 10 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Command
	{
		icon = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {0, 0.9, 0, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Cross
	{
		color[] = {0, 0.35, 0.7, 1};
		icon = "\ca\ui\data\map_cross_ca.paa";
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Fortress
	{
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Fuelstation
	{
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		color[] = {1.0, 0.35, 0.35, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.75;
		coefMax = 4;
	};

	class Fountain
	{
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 12;
		importance = 1 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Hospital
	{
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};

	class Chapel
	{
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 1 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};

	class Church
	{
		icon = "\ca\ui\data\map_church_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};

	class Lighthouse
	{
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 20;
		importance = 3 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};

	class Quay
	{
		icon = "\ca\ui\data\map_quay_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};

	class Rock
	{
		color[] = {0.35, 0.35, 0.35, 1};
		icon = "\ca\ui\data\map_rock_ca.paa";
		size = 12;
		importance = 0.5 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Ruin
	{
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1.2 * 16 * 0.05;
		coefMin = 1;
		coefMax = 4;
	};

	class SmallTree
	{
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = 0.6 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Stack
	{
		icon = "\ca\ui\data\map_stack_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 20;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};

	class Tree
	{
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = 0.9 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};

	class Tourism
	{
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1 * 16 * 0.05;
		coefMin = 0.7;
		coefMax = 4;
	};

	class Transmitter
	{
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 20;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};

	class ViewTower
	{
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2.5 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};

	class Watertower
	{
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 32;
		importance = 1.2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};

	class Waypoint
	{
		icon = "\ca\ui\data\map_waypoint_ca.paa";
	  	color[] = {0, 0.35, 0.7, 1};
	  	size = 32;
	  	coefMin = 1.00;
	  	coefMax = 1.00;
	  	importance = 1.00;
	};

	class WaypointCompleted
	{
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
	  	color[] = {0,0,0, 1};
	  	size = 24;
	  	importance = 1.00;
	  	coefMin = 1.00;
	  	coefMax = 1.00;
	};
};

// -----------------------------------------------------------------------------
// Requires h.
class SPON_rscStructuredText : SPON_rscText
{
	access = 0;
	type = CT_STRUCTURED_TEXT;
	idc = -1;
	style = ST_MULTI;

	text = "";
	size = SPON_FONT_SIZE_SMALL;
	colorText[] = SPON_TEXT_COLOUR;

	class Attributes
	{
		font = SPON_FONT;
		color = SPON_STRUCTURED_TEXT_HEX_COLOUR;
		align = "left";
		shadow = 0;
	};
};

#endif
