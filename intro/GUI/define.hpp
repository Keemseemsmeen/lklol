#define CT_STATIC			0
#define CT_BUTTON			1
#define CT_EDIT				2
#define CT_SLIDER			3
#define CT_COMBO			4
#define CT_LISTBOX			5
#define CT_TOOLBOX			6
#define CT_CHECKBOXES		7
#define CT_PROGRESS			8
#define CT_HTML				9
#define CT_STATIC_SKEW		10
#define CT_ACTIVETEXT		11
#define CT_TREE				12
#define CT_STRUCTURED_TEXT	13 
#define CT_3DSTATIC			20
#define CT_3DACTIVETEXT		21
#define CT_3DLISTBOX		22
#define CT_3DHTML			23
#define CT_3DSLIDER			24
#define CT_3DEDIT			25
#define CT_OBJECT			80
#define CT_OBJECT_ZOOM		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_USER				99

// Static styles
#define ST_HPOS				0x0F
#define ST_LEFT				0
#define ST_RIGHT			1
#define ST_CENTER			2
#define ST_UP				3
#define ST_DOWN				4
#define ST_VCENTER			5

#define ST_TYPE				0xF0
#define ST_SINGLE			0
#define ST_MULTI			16
#define ST_TITLE_BAR		32
#define ST_PICTURE			48
#define ST_FRAME			64
#define ST_BACKGROUND		80
#define ST_GROUP_BOX		96
#define ST_GROUP_BOX2		112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE		144
#define ST_WITH_RECT		160
#define ST_LINE				176

#define ST_SHADOW			256
#define ST_NO_RECT			512

#define ST_TITLE			ST_TITLE_BAR + ST_CENTER

#define FontHTML			"Zeppelin32"
#define FontM				"Zeppelin32"

#define Dlg_ROWS			36
#define Dlg_COLS			90

#define Dlg_CONTROLHGT		((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH		((100/Dlg_COLS)/100)

#define Dlg_TEXTHGT_MOD		0.9
#define Dlg_ROWSPACING_MOD	1.3

#define Dlg_ROWHGT			(Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT			(Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)

class SXRscText
{
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = FontM;
	sizeEx = 0.015;
};

class RscBG: SXRscText
{
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	colorBackground[] = {0.02, 0.11, 0.27, 0.7};
	colorText[] = {1, 1, 1, 0};
	font = FontM;
	sizeEx = 0.015;
	text="";
};



class RscNavButton:RscButton
{
	w=0.1;
	h=0.04;
	x=0.90;
};

class SXRscListBox
{
	type = CT_LISTBOX;
	style = ST_LEFT;
	idc = -1;
	colorSelect[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.2, 0.4, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.02, 0.11, 0.27, 0.4};
	font = FontM;
	sizeEx = 0.02;
	rowHeight = 0.02;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {0.02, 0.11, 0.27, 0.4};
	colorShadow[] = {0.2, 0.2, 0.2, 0.8};
	colorBorder[] = {0.4, 0.4, 0.4, 1};
	borderSize = 0.03;
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.15, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.15, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.15, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.15, 1};
};


