	class loki_debug_text
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

	class loki_debug_edit
	{
		type = CT_EDIT;
		style = ST_LEFT+ST_MULTI;
		idc = -1;
		font = "Zeppelin32";
		sizeEx = 0.026;
		htmlControl = true;
		lineSpacing = 0.004;
		x = 0.0; w = 0.3;
		y = 0.0; h = 0.06;
		colorText[] = {0.85, 0.85, 0.85, 1};
		colorSelection[] = {1, 1, 1, 1};
		autocomplete = "scripting";
		//text = "";
	};

	class loki_debug_image
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE+ST_KEEP_ASPECT_RATIO;
		x = 0.25; w = 0.1;
		y = 0.1; h = 0.1;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};

	class loki_debug_btn
	{
		idc = -1;
		type = 16;
		style = 0;
		
		text = "btn";
		action = "";
		
		x = 0;
		y = 0;
		
		w = 0.23;
		h = 0.11;
		
		size = 0.03921;
		sizeEx = 0.03921;
		
		color[] = {0.543, 0.5742, 0.4102, 1.0};
		color2[] = {0.95, 0.95, 0.95, 1};
		colorBackground[] = {1, 1, 1, 1};
		colorbackground2[] = {1, 1, 1, 0.4};
		colorDisabled[] = {1, 1, 1, 0.25};
		periodFocus = 1.2;
		periodOver = 0.8;
		
		class HitZone 
		{
			left = 0.004;
			top = 0.029;
			right = 0.004;
			bottom = 0.029;
		};
		
		class ShortcutPos 
		{
			left = 0.0145;
			top = 0.026;
			w = 0.0392157;
			h = 0.0522876;
		};
		
		class TextPos 
		{
			left = 0.05;
			top = 0.034;
			right = 0.005;
			bottom = 0.005;
		};
		
		textureNoShortcut = "";
		animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
		animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
		animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
		animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
		animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
		animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
		period = 0.4;
		font = "Zeppelin32";
		
		soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
		soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
		soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
		soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
		
		class Attributes 
		{
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "left";
			shadow = "true";
		};
		
		class AttributesImage 
		{
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "left";
			shadow = "true";
		};
	};

	class loki_debug_list
	{
		type = CT_LISTBOX;
		style = 16;
		idc = -1;
		text = "";
		w = 0.275;
		h = 0.04;
		colorSelect[] = {1, 1, 1, 1};
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0.8,0.8,0.8,1};
		colorSelectBackground[] = {0.40, 0.43, 0.28, 0.5};
		colorScrollbar[] = {0.2, 0.2, 0.2, 1};
		arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
		wholeHeight = 0.45;
		rowHeight = 0.04;
		color[] = {0.7, 0.7, 0.7, 1};
		colorActive[] = {0,0,0,1};
		colorDisabled[] = {0,0,0,0.3};
		font = "Zeppelin32";
		sizeEx = 0.023;
		soundSelect[] = {"",0.1,1};
		soundExpand[] = {"",0.1,1};
		soundCollapse[] = {"",0.1,1};
		maxHistoryDelay = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;

		class ScrollBar
		{
			color[] = {1, 1, 1, 1};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 1};
			thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
			arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
			arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
			border = "\ca\ui\data\ui_border_scroll_ca.paa";
		};
	};

	class loki_debug_pict
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = 0.25; w = 0.5;
		y = 0.1; h = 0.8;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_gameoptions_background_ca.paa";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};
