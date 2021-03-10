#define CA_colordark           {0, 0, 0, 1}
#define CA_buttoff             {1, 1, 1, 0.7}
#define CA_button             {1, 1, 1, 1}
#define CA_textoff             {1, 1, 1, 0.7}
#define CA_texton             {1, 1, 1, 1}
#define CA_Redtextoff         {0.25, 0, 0, 0.7}
#define CA_Redtexton           {0.7, 0, 0, 1}
/*{0.4902,0.6980,0.4941,1.0}
original color definitions
#define CA_UI_element_background           {1, 1, 1, 0.7}
#define CA_UI_background           {0.6, 0.6, 0.6, 0.4}
#define CA_UI_help_background           {0.2, 0.1, 0.1, 0.7}
#define CA_UI_title_background  {0.24, 0.47, 0.07, 1}
#define CA_UI_green          {0.84,1,0.55,1}
*/ 

#define CA_UI_element_background           Color_White
#define CA_UI_background           {0.6, 0.6, 0.6, 0.4}
#define CA_UI_help_background         {0.2, 0.1, 0.1, 0.7}
#define CA_UI_scrollbar_selection   {1, 1, 1, 0.8}
#define CA_UI_title_background  {0.1961,0.1451,0.0941,1.0}
#define CA_UI_title_background_red  {0.47, 0.24, 0.07, 1}
#define CA_UI_title_background_blue  {0.07, 0.24, 0.47, 1}
//#define CA_UI_green            {1, 0.55, 0, 1}
#define CA_UI_green          {0.709,0.972,0.384,1}
#define CA_UI_red          {0.58, 0.1147, 0.1108, 1}

#define CA_UI_grey          {0.4,0.4,0.4,1}
#define CA_UI_transparent          {1,1,1,0}

#define CA_UI_HUD        {0.71,0.85,0.46,1}
#define CA_UI_HUD_transparency        {0.294,0.02,0.706, 0.2}
//#define CA_UI_HUD        {0.39,0.55,0.25,1}

#define CA_UI_EDITOR_background           {0.9, 0.9, 0.9, 1}

// obsolete #define CA_UI_HUD_Green      {0.706,0.980,0.294, 1}
#define CA_UI_HUD_Green   {0.600,0.8392,0.4706,1.0}
#define CA_IGUI_GreenDark      {0.659,0.863,0.549,0.6}

//Too bright, used in earsly stage of Expansion
//#define CA_IGUI_Green      {0.8510,0.9569,0.6980,1.0}
#define CA_IGUI_Green      {0.4000,0.6745,0.2784,1.0}
#define CA_IGUI_Sand      {0.8784,0.8471,0.6510,1.0}

#define CA_IGUI_Green_Transparent {0.6000,0.8392,0.4706,0.75}
#define CA_IGUI_Red        {0.706,0.0745,0.0196,1}
#define CA_IGUI_Orange      {0.863,0.584,0.0,1}
#define CA_IGUI_YellowGreen      {0.8275,0.8196,0.1961,1.0}
#define CA_IGUI_Blue      {0.196,0.592,0.706, 1}
#define CA_IGUI_Grey      {0.606,0.606,0.606,1}
//no igui background
#define CA_IGUI_Background        {0,0,0,0.0}
#define CA_IGUI_DarkGreen        {0.424,0.651,0.247, 1}
#define  CA_IGUI_DarkBackground  {0.1961,0.1451,0.0941,0.85}
#define CA_IGUI_DarkGreen_Transparent        {0.424,0.651,0.247, 0.3}


#define CA_UI_GreenText      {0.5430,0.5742,0.4102,1.0}

#define CA_UI_button_over_sound {"\ca\ui\data\sound\mouse2", 0.09, 1}
#define CA_UI_button_down_sound {"\ca\ui\data\sound\new1", 0.09, 1}
#define CA_UI_button_click_sound {"\ca\ui\data\sound\mouse3", 0.07, 1}
#define CA_UI_button_escape_sound {"\ca\ui\data\sound\mouse1", 0.09, 1}
  
#define Color_WhiteDark       {1, 1, 1, 0.5}
#define Color_White        {0.95, 0.95, 0.95, 1}
//#define Color_Black           {0, 0, 0, 1}
#define Color_Black           {0.023529, 0, 0.0313725, 1}
#define Color_Gray             {1, 1, 1, 0.5}
#define Color_DarkRed         {0.5, 0.1, 0, 0.5}
#define Color_Green           {0.8, 0.9, 0.4, 1}
#define Color_Orange           {1, 0.537, 0, 1}
#define Color_DarkOrange           {1, 0.537, 0, 0.5}
#define Color_Red           {0.9, 0.2, 0.2, 1}
#define Color_Blue           {0.2, 0.2, 0.9, 1}

#define Color_MainBack         {1, 1, 1, 0.9}
#define Color_Back             {0.1, 0.1, 0.1, 0.4}
#define Color_BackList         {0.2, 0.2, 0.2, 0.2}
#define Color_MainBackFull     CA_UI_EDITOR_background

#define ProcTextWhite         "#(argb,8,8,3)color(1,1,1,1)"
#define ProcTextBlack         "#(argb,8,8,3)color(0,0,0,1)"
#define ProcTextGray           "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define ProcTextRed           "#(argb,8,8,3)color(1,0,0,1)"
#define ProcTextGreen         "#(argb,8,8,3)color(0,1,0,1)"
#define ProcTextBlue           "#(argb,8,8,3)color(0,0,1,1)"
#define ProcTextOrange         "#(argb,8,8,3)color(1,0.5,0,1)"
#define ProcTextTransparent      "#(argb,8,8,3)color(0,0,0,0)"
#define TextSize_xsmall       0.014 
#define TextSize_IGUI_normal     0.0234375
#define TextSize_small         0.02674
#define TextSize_normal       0.02674
#define TextSize_medium       0.0286458
#define TextSize_big         0.0325521

#define TextSizeXbox_normal         0.03921
#define TextSizeXbox_title         0.050653594771
//#define TextSizeXbox_GUI         0.03921
#define TextSizeXbox_GUI         0.034

#define SizeMapMarker          32

#define blinkPeriod      1

#define Black                 0,       0,       0
#define Green                 0,       0.6,     0
#define Red                   0.7,     0.1,     0
#define Yellow                 0.8,     0.6,     0
#define White                 0.8,     0.8,     0.8
#define ShineGreen             0.07,   0.7,     0.2
#define ShineRed               1,       0.2,     0.2
#define ShineYellow           1,       1,       0
#define ShineWhite             1,       1,       1
#define Blue                   0.1,     0.1,     0.9

              

#define Gray1                 0,       0,       0
#define Gray2                 0.2,     0.2,     0.2
#define Gray3                 0.5,     0.5,     0.5
#define Gray4                 0.6,     0.6,     0.6
#define Gray5                 0.8,     0.8,     0.8

//dimension of bitmaps to be mapped 1:1 in 720p
#define w16 0.0196078
#define h16 0.0261438

#define w32 0.0392157
#define h32 0.0522876

#define w64 0.0784314
#define h64 0.1045752

#define w128 0.1568627
#define h128 0.2091503

#define w256 0.3137255
#define h256 0.4183007

#define w512 0.6274510
#define h512 0.8366013

#define w1024 1.2549020
#define h1024 1.6732026

#define w2048 2.5098039
#define h2048 3.3464052

#define  flag_west  "ca\ui\data\flag_bluefor_ca.paa"
#define  flag_east  "ca\ui\data\flag_opfor_ca.paa"
#define  flag_guer  "ca\ui\data\flag_indep_ca.paa"
#define  flag_civl  "ca\ui\data\flag_civil_ca.paa"

#define KEY_HINT(name, dik, text) class name {key = dik; hint = "";}

__EXEC( _xSpacing = 0.007353;  _ySpacing = 0.009804;)
__EXEC( _HintsX = [1,34,67,100]; _HintsY = [87,92]; )
__EXEC( _HintsW = 25; _HintsH = 4;) 

#define ALIGN_LEFT 1 
#define ALIGN_RIGHT(X_IN)\
  x = (SafeZoneW + SafeZoneX) - (1 - X_IN);
  
#define ALIGN_TOP 1
#define ALIGN_BOTTOM(Y_IN)\
  y = (1.17647 - 0.08823) - (1 - Y_IN);

#define ALIGN_BOTTOM_GRID(Y_IN)\
  y =  ( (SafeZoneH + SafeZoneY) - (1 - (Y_IN * 0.009804)))

//Use: CA_OK_AND_CANCEL_BUTTONS( $STR_DISP_OK, $STR_CA_CANCEL,1)
#define  CA_OK_AND_CANCEL_BUTTONS(OK_TEXT, CANCEL_TEXT,OK_DEFAULT) \
    class Ok: CA_RscButton\
    {\
      idc = IDC_OK;\
      default = OK_DEFAULT;\
      y = 0.80;\
          text = OK_TEXT;\
    };\
    class Cancel: CA_RscButton\
    {\
      idc = IDC_CANCEL;\
      y = 0.85;\
      text = CANCEL_TEXT;\
    };
    
#define SCROLLBAR \
  class ScrollBar \
  { \
    color[] = {1,1,1,0.6}; \
    colorActive[] = {1,1,1,1}; \
    colorDisabled[] = {1,1,1,0.3}; \
    thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";\
    arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";\
    arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";\
    border = "\ca\ui\data\ui_border_scroll_ca.paa";\
  };  

class RscControlsGroup;
class RscListNBox 
{
  style = LB_TEXTURES;
  shadow = 2;
  color[] = {1, 1, 1, 1};
  colorText[] =  CA_IGUI_Sand; 
  colorScrollbar[] = Color_White;
  colorSelect[] = Color_White; //First color of selected Text
  colorSelect2[] = Color_White;  //Second color of selected Text
  colorSelectBackground[] = {0, 0, 0, 1};
  colorSelectBackground2[] = CA_IGUI_Sand;  //Active // Green //Second color of selected Backgrnd  
  SCROLLBAR
};  
class DefaultTextAttributes
{
  font = Zeppelin32;
  color = "#ffffff";
  size = 1;
  align = "left";
  valign = "middle";
  shadow = "true";
  shadowOffset = 0.07;
  shadowColor = "#000000";
  underline = "false";
};
  
class RscButtonImages
{
  class XBoxA
  {
    id = KEY_XBOX_A;
    image ="\ca\ui\data\ui_xbox_shortcut_a_ca.paa";
    size = 1.3333;
  };
  
  
  class XBoxB 
  {
    id = KEY_XBOX_B;
    image ="\ca\ui\data\ui_xbox_shortcut_b_ca.paa";
    size = 1.3333;  
  };
  class XBoxX
  {
    id = KEY_XBOX_X;
    image ="\ca\ui\data\ui_xbox_shortcut_x_ca.paa";
    size = 1.3333;
  };
  class XBoxY
  {
    id = KEY_XBOX_Y;
    image ="\ca\ui\data\ui_xbox_shortcut_y_ca.paa";
    size = 1.3333;
  };
  class XBoxUp
  {
    id = KEY_XBOX_Up;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;
  };
  class XBoxDown
  {
    id = KEY_XBOX_Down;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;
  };
  class XBoxLeft
  {
    id = KEY_XBOX_Left;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
  class XBoxRight
  {
    id = KEY_XBOX_Right;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
  class XBoxStart
  {
    id = KEY_XBOX_Start;
    image ="\ca\ui\data\ui_xbox_shortcut_start_ca.paa";
    size = 1.3333;  
  };
  class XBoxBack
  {
    id = KEY_XBOX_Back;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGray;
    size = 1.3333;  
  };
  class XBoxBlack
  {
    id = KEY_XBOX_LeftBumper;

    image = ProcTextBlack;
    size = 1.3333;  
  };
  class XBoxWhite
  {
    id = KEY_XBOX_RightBumper;

    image = ProcTextWhite;
    size = 1.3333;  
  };
  class XBoxLeftBumper
  {
    id = KEY_XBOX_LeftBumper;
    image = ProcTextBlue;
    size = 1.3333;  
  };
  class XBoxRightBumper
  {
    id = KEY_XBOX_RightBumper;
    image = ProcTextRed;
    size = 1.3333;  
  };  
  class XBoxLeftTrigger
  {
    id = KEY_XBOX_LeftTrigger;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;
  };
  class XBoxRightTrigger
  {
    id = KEY_XBOX_RightTrigger;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;
  };
  class XBoxLeftThumb
  {
    id = KEY_XBOX_LeftThumb;
    image = "\ca\ui\data\ui_xbox_shortcut_rightthumb_ca.paa";
    size = 1.3333;  
  };
  class XBoxRightThumb
  {
    id = KEY_XBOX_RightThumb;
    image = "";
    size = 1.3333;  
  };
  class XBoxLeftThumbXRight
  {
    id = KEY_XBOX_LeftThumbXRight;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  }; 
  class XBoxLeftThumbYUp
  {
    id = KEY_XBOX_LeftThumbYUp;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
  class XBoxRightThumbXRight
  {
    id = KEY_XBOX_LeftThumbXRight;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
  class XBoxRightThumbYUp
  {
    id = KEY_XBOX_RightThumbYUp;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;
  };

  class XBoxLeftThumbXLeft
  {
    id = KEY_XBOX_LeftThumbXLeft;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
  class XBoxLeftThumbYDown
  {
    id =KEY_XBOX_LeftThumbYDown;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
  class XBoxRightThumbXLeft
  {
    id = KEY_XBOX_RightThumbXLeft;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
  class XBoxRightThumbYDown
  {
    id = KEY_XBOX_RightThumbYDown;
    // image = "\XMisc\a_butt.paa";
    image = ProcTextGreen;
    size = 1.3333;  
  };
};


class RscText
{
	#define _RSCTEXT_DEFINED 1	  
  x = 0;
  y = 0;
  h = 0.037;
  w = 0.3;
  style = ST_LEFT;
  shadow = 2;
  font = Zeppelin32;
  SizeEx = TextSizeXbox_normal;
  colorText[] = CA_IGUI_Sand;
};
class RscLine: RscText
{
	idc = -1;
	style = ST_LINE;
	x = 0.17;
	y = 0.48;
	w = 0.66;
	h = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = CA_IGUI_Sand;
};   
class RscTextMainMenu: RscText
{
  style = ST_CENTER + ST_SHADOW;
};

//Obsolete? Not used anywhere else.
/*class RscTextSmall: RscText
{
  font = Zeppelin32;
  SizeEx = TextSize_small;
};*/

//Obsolete? Not used anywhere else.
/*class RscTextMenu: RscText
{
  font = Zeppelin32;
  colorText[] = {1, 1, 1, 0.2};
};*/

class RscTree
{
  font = Zeppelin32;
  sizeEx = TextSize_small;
};

class RscTitle: RscText 
{
  shadow = 2;
};
class RscPicture
{
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;

	x = 0.1;
	y = 0.1;
	w = 0.4;
	h = 0.2;
	sizeEx = Dlg_TEXTHGT;

	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1,1,1, 1};
	font = Zeppelin32;

	text = "";
};
class RscPictureKeepAspect: RscPicture
{
  style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};
class RscStructuredText
{
  x = 0;
  y = 0;
  h = 0.035;
  w = 0.1;
  text = "";
  size = TextSizeXbox_normal;
  colorText[] = CA_IGUI_Sand;
  shadow = 2;
  class Attributes
  {
    font = Zeppelin32;
    color = "#e0d8a6";
    align = "center";
    shadow = true;
  };
};


class RscObject;

class RscActiveText
{
	#define _RSCACTIVETEXT_DEFINED 1
  idc = -1;
  x = 0;
  y = 0;
  h = 0.035;
  w = 0.035;
  font = Zeppelin32;
  shadow = 2;
  sizeEx = TextSizeXbox_normal;
  color[] = CA_colordark;
  colortext[] = CA_colordark;
  colorActive[] = {0.3, 0.4, 0, 1};
};

class RscButton
{
  style = ST_CENTER; // alignment of text
  x = 0;
  y = 0;
  w = __EVAL(13 * _xSpacing);
  h = __EVAL(4 * _ySpacing);
  shadow = 2;  
  // text properties
  font = Zeppelin32;
  sizeEx = TextSizeXbox_normal;
  colorText[] = CA_IGUI_Sand; // color of text if control is enabled
  colorDisabled[] = CA_UI_grey;//CA_UI_green; // color of text if control is disabled

  // background properties
  colorBackground[] = Color_DarkOrange;
  colorBackgroundActive[] = Color_Orange;
  colorBackgroundDisabled[] = CA_UI_element_background;
  offsetX = 0.003; // distance of backgroud from shadow 
  offsetY = 0.003;
  offsetPressedX = 0.002; // distance of backgroud from shadow when button is pressed
  offsetPressedY = 0.002;


//  offsetPressedX = "1.1/640"; // distance of backgroud from shadow when button is pressed
//  offsetPressedY = "1.1/480";
  colorFocused[] = Color_Orange; // color of the rectangle around background when focused
  colorShadow[] = Color_Black;

  // border properties
  colorBorder[] = Color_Black;
  borderSize = 0.00; // when negative, the border is on the right side of background

  // sounds
  
  soundEnter[] = CA_UI_button_over_sound;
  soundPush[] = CA_UI_button_down_sound;
  soundClick[] = CA_UI_button_click_sound;
  soundEscape[] = CA_UI_button_escape_sound;
};
class RscGearButtonTest: RscButton 
{
  colorText[] = {1, 0, 1, 1}; // color of text if control is enabled
  colorDisabled[] = {0, 1, 1, 1};//CA_UI_green; // color of text if control is 
  colorBackground[] = {1, 1, 0, 1};
  colorBackgroundActive[] = {0, 1, 0, 1};
  colorBackgroundDisabled[] = {1, 0, 0, 1};
  offsetX = 0.0; // distance of backgroud from shadow 
  offsetY = 0.0;
  offsetPressedX = 0.0; // distance of backgroud from shadow when button is pressed
  offsetPressedY = 0.0;
  colorShadow[] = {1, 1, 1, 0};
};

class RscShortcutButton
{
  idc = -1;
  style = 0;
  default = 0;
  shadow = 2;
  w = __EVAL(_HintsW * _xSpacing);
  h = h64;
  color[] = CA_IGUI_Sand;
  color2[] = Color_White;
  colorBackground[] =  {1, 1, 1, 1};
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
      w = w32; // aspect 4 : 3
      h = h32;
    };   
    class TextPos
    {
      left = 0.05;
      top = 0.034;
      right = 0.005;
      bottom = 0.005;
    };   
    // background animated textures    
  
    animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
    animTextureDisabled  = "\ca\ui\data\ui_button_disabled_ca.paa";
    animTextureOver  = "\ca\ui\data\ui_button_over_ca.paa";
    animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
    animTexturePressed  = "\ca\ui\data\ui_button_down_ca.paa";
    animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
  
    period = 0.4;
    font = Zeppelin32;
    size = TextSizeXbox_normal;
    sizeEx = TextSizeXbox_normal;  
    text = "";
    
  
    soundEnter[] = CA_UI_button_over_sound;
    soundPush[] = CA_UI_button_down_sound;
    soundClick[] = CA_UI_button_click_sound;
    soundEscape[] = CA_UI_button_escape_sound;
  
    action = "";
  
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
    };
};


class RscIGUIShortcutButton: RscShortcutButton
{
  w = __EVAL(_HintsW * _xSpacing);
  h = h32;
  style = ST_CENTER;
  color[] = {1, 1, 1, 1};
  color2[] = {1, 1, 1, 0.85};
  colorBackground[] =  {1, 1, 1, 1};
  colorbackground2[] = {1, 1, 1, 0.85};
  colorDisabled[] = {1, 1, 1, 0.4};  
  class HitZone
  {
    left = 0.002;
    top = 0.003;
    right = 0.002;
    bottom = 0.016;
  };   
  class ShortcutPos
  {
    left = -0.006;
    top = -0.007;
    w = 0; // aspect 4 : 3
    h = h32;  
  };   
  class TextPos
  {
    left = 0.00;
    top = 0.000;
    right = 0.000;
    bottom = 0.016;
  };   
  animTextureNormal = "\ca\ui\data\igui_button_normal_ca.paa";
  animTextureDisabled  = "\ca\ui\data\igui_button_disabled_ca.paa";
  animTextureOver  = "\ca\ui\data\igui_button_over_ca.paa";
  animTextureFocused = "\ca\ui\data\igui_button_focus_ca.paa";
  animTexturePressed  = "\ca\ui\data\igui_button_down_ca.paa";
  animTextureDefault = "\ca\ui\data\igui_button_normal_ca.paa";
  class Attributes
  {
    font = "Zeppelin32";
    color = "#E5E5E5";
    align = "center";
    shadow = "true";    
  };
};

class RscGearShortcutButton: RscShortcutButton
{
  w = w32;
  h = h32;
  style = ST_CENTER;
  color[] = {1, 1, 1, 1};
  color2[] = {1, 1, 1, 0.85};
  colorBackground[] =  {1, 1, 1, 1};
  colorbackground2[] = {1, 1, 1, 0.85};
  colorDisabled[] = {1, 1, 1, 0.4};  
  class HitZone
  {
    left = 0.0;
    top = 0.0;
    right = 0.0;
    bottom = 0.0;
  };   
  class ShortcutPos
  {
    left = -0.006;
    top = -0.007;
    w = w32; // aspect 4 : 3
    h = h32;  
  };   
  class TextPos
  {
    left = 0.003;
    top = 0.001;
    right = 0.0;
    bottom = 0.0;
  };   
  sizeEx = 0.1;  
  animTextureNormal = "\ca\ui\data\igui_gear_normal_ca.paa";
  animTextureDisabled  = "\ca\ui\data\igui_gear_disabled_ca.paa";
  animTextureOver  = "\ca\ui\data\igui_gear_over_ca.paa";
  animTextureFocused = "\ca\ui\data\igui_gear_focus_ca.paa";
  animTexturePressed  = "\ca\ui\data\igui_gear_down_ca.paa";
  animTextureDefault = "\ca\ui\data\igui_gear_normal_ca.paa";
  class Attributes
  {
    font = "Zeppelin32";
    color = "#E5E5E5";
    align = "center";
    shadow = "false";    
  };  
};
class RscShortcutButtonMainMenu: RscShortcutButton
{
  w = __EVAL(_HintsW * _xSpacing);
  h = h64;
  
  color[] = CA_IGUI_Sand;
  colorDisabled[] = {1, 1, 1, 0.25};

  class HitZone
  {
    left = 0.004;
    top = 0.029;
    right = 0.004;
    bottom = 0.029;
  };   
  class ShortcutPos
  {
    left = 0.004;
    top = 0.026;
    w = w32; // aspect 4 : 3
    h = h32;
  };   
  class TextPos
  {
    left = 0.043;
    top = 0.034;
    right = 0.005;
    bottom = 0.005;
  };   
  // background animated textures    

  animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
  animTextureDisabled  = "\ca\ui\data\ui_button_disabled_ca.paa";
  animTextureOver  = "\ca\ui\data\ui_button_over_ca.paa";
  animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
  animTexturePressed  = "\ca\ui\data\ui_button_down_ca.paa";
  animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";

  soundEnter[] = CA_UI_button_over_sound;
  soundPush[] = CA_UI_button_down_sound;
  soundClick[] = CA_UI_button_click_sound;
  soundEscape[] = CA_UI_button_escape_sound;

  action = "";

  class Attributes
  {
    font = "Zeppelin32";
  color = "#E5E5E5";
    align = "left";
  shadow = "true";    
  };
  class AttributesImagev
  {
    font = "Zeppelin32";
  color = "#E5E5E5";
    align = "left";
  };
};

class RscShortcutButtonMain: RscShortcutButton
{
  idc = -1;
  style = 0;
  default = 0;
  w = w256;
  h = h64;
  
  color[] = CA_IGUI_Sand;
  colorDisabled[] = {1, 1, 1, 0.25};

  class HitZone
  {
    left = 0.00;
    top = 0.0;
    right = 0.00;
    bottom = 0.0;
  };   
  class ShortcutPos
  {
    left = 0.0204;
    top = 0.026;
    w = w32; // aspect 4 : 3
    h = h32;
  };   
  class TextPos
  {
    left = 0.08;
    top = 0.034;
    right = 0.005;
    bottom = 0.005;
  };   
  // background animated textures    

  animTextureNormal = "\ca\ui\data\ui_button_main_normal_ca.paa";
  animTextureDisabled  = "\ca\ui\data\ui_button_main_disabled_ca.paa";
  animTextureOver  = "\ca\ui\data\ui_button_main_over_ca.paa";
  animTextureFocused = "\ca\ui\data\ui_button_main_focus_ca.paa";
  animTexturePressed  = "\ca\ui\data\ui_button_main_down_ca.paa";
  animTextureDefault =  "\ca\ui\data\ui_button_main_normal_ca.paa";

  period = 0.5;
  font = Zeppelin32;
  size = TextSizeXbox_normal;
  sizeEx = TextSizeXbox_normal;  
  text = "";
  

  soundEnter[] = CA_UI_button_over_sound;
  soundPush[] = CA_UI_button_down_sound;
  soundClick[] = CA_UI_button_click_sound;
  soundEscape[] = CA_UI_button_escape_sound;

  action = "";

  class Attributes
  {
    font = "Zeppelin32";
  color = "#E5E5E5";
    align = "left";
  shadow = "false";    
  };
  class AttributesImage
  {
    font = "Zeppelin32";
  color = "#E5E5E5";
    align = "false";
  };
};
class RscShortcutButtonDiary: RscShortcutButton
{
  idc = -1;
  style = 0;
  default = 0;
  w = w128;
  h = h128;
  color[] = {1, 1, 1, 1};
  color2[] = {1, 1, 1, 0.7};
  colorBackground[] =  {1, 1, 1, 1};
  colorbackground2[] = {1, 1, 1, 0.7};
    
  colorDisabled[] = {1, 1, 1, 0.7};
  periodFocus = 0;
  periodOver = 0.8;
  period = 0.4;
  
  onSetFocus = "private [""_dummy""]; _dummy = [_this,""setfocus""] execVM ""\ca\ui\scripts\focusDiary.sqf"";";    
    class HitZone
    {
      left = 0.00;
      top = 0.0;
      right = 0.04;
      bottom = 0.09;
    };   
    class ShortcutPos
    {
      left = 0.004;
      top = 0.026;
      w = w32; // aspect 4 : 3
      h = h32;
    };   
    class TextPos
    {
      left = 0.003;
      top = 0.004;
      right = 0.005;
      bottom = 0.005;
    };   
    // background animated textures    
    
    animTextureNormal = "\ca\ui\data\diary\ui_button_normal_ca.paa";
    animTextureDisabled  = "\ca\ui\data\diary\ui_button_disabled_ca.paa";
    animTextureOver  = "\ca\ui\data\diary\ui_button_over_ca.paa";
    animTextureFocused = "\ca\ui\data\diary\ui_button_focus_ca.paa";
    animTexturePressed  = "\ca\ui\data\diary\ui_button_pressed_ca.paa";
    animTextureDefault =  "\ca\ui\data\diary\ui_button_default_ca.paa";    
    
    
    font = Zeppelin32;
    size = 0.105;
    sizeEx = 0.09;  
    text = "";
    
    
    soundEnter[] = CA_UI_button_over_sound;
    soundPush[] = CA_UI_button_down_sound;
    soundClick[] = CA_UI_button_click_sound;
    soundEscape[] = CA_UI_button_escape_sound;
    
    action = "";
  
    class Attributes
    {
      font = "Zeppelin32";
    color = "#E5E5E5";
      align = "left";
    shadow = "false";    
    };
    class AttributesImage
    {
      font = "Zeppelin32";
    color = "#E5E5E5";
      align = "left";
      shadow = "true"; 
    };
};

class RscShortcutButtonDiaryMap: RscShortcutButton
{
  idc = -1;
  style = 0;
  default = 0;
  w = w32;
  h = h32;
  
  color[] = CA_IGUI_Sand;
  colorDisabled[] = {1, 1, 1, 0.25};

  class HitZone
  {
    left = 0.00;
    top = 0.0;
    right = 0.076;
    bottom = 0.09;
  };    
  class ShortcutPos
  {
    left = 0.0;
    top = 0.026;
    w = w32; // aspect 4 : 3
    h = h32;
  };   
  class TextPos
  {
    left = -0.1;
    top = -0.1;
    right = 0.005;
    bottom = 0.005;
  };   
  // background animated textures    

  animTextureNormal = "\ca\ui\data\diary\ui_button_normal_ca.paa";
  animTextureDisabled  = "\ca\ui\data\diary\ui_button_disabled_ca.paa";
  animTextureOver  = "\ca\ui\data\diary\ui_button_focus_ca.paa";
  animTextureFocused = "\ca\ui\data\diary\ui_button_down_ca.paa";
  animTexturePressed  = "\ca\ui\data\diary\ui_button_down_ca.paa";
  animTextureDefault =  "\ca\ui\data\diary\ui_button_normal_ca.paa";    

  period = 0.4;
  font = Zeppelin32;
  size = TextSizeXbox_GUI;
  sizeEx = TextSizeXbox_GUI;  
  text = "";  

  soundEnter[] = CA_UI_button_over_sound;
  soundPush[] = CA_UI_button_down_sound;
  soundClick[] = CA_UI_button_click_sound;
  soundEscape[] = CA_UI_button_escape_sound;

  action = "";

  class Attributes
  {
    font = "Zeppelin32";
  color = "#E5E5E5";
    align = "left";
  shadow = "false";    
  };
  class AttributesImage
  {
    font = "Zeppelin32";
  color = "#E5E5E5";
    align = "false";
  };
};


class RscShortcutButtonWizard: RscShortcutButtonMain
{
  class TextPos
  {
    left = 0.08;
    top = 0.024;
    right = 0.005;
    bottom = 0.005;
  };   
  animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
  animTextureDisabled  = "\ca\ui\data\ui_button_normal_ca.paa";
  animTextureOver  = "\ca\ui\data\ui_button_over_ca.paa";
  animTextureFocused = "\ca\ui\data\ui_button_over_ca.paa";
  animTexturePressed  = "\ca\ui\data\ui_button_down_ca.paa";
  animTextureDefault =  "\ca\ui\data\ui_button_normal_ca.paa";
};
class RscXKeyShadow 
{
  style = 0;
    w = w256;
  h = h64;
        
  size = TextSizeXbox_normal;
  class Attributes
  {
    font = Zeppelin32;
    color = "#E5E5E5";
    align = "left";
  };
  class AttributesImage
  {
    color = "#E5E5E5";
  };
};
class RscButton_small: RscButton
{
  w = __EVAL(13 * _xSpacing);
  h = __EVAL(4 * _ySpacing);
  sizeEx = TextSize_small;
};

class RscButtonTextOnly: RscButton
{
      SizeEx = TextSize_normal;
    colorBackground[] = CA_UI_transparent;
    colorBackgroundActive[] = CA_UI_transparent;
    colorBackgroundDisabled[] = CA_UI_transparent;
      colorFocused[] = CA_UI_transparent;
      colorShadow[]  = CA_UI_transparent;
      borderSize = 0.00;   
};
#ifndef _RSCPROGRESS_DEFINED
class RscProgress
{
			#define _RSCPROGRESS_DEFINED 1
      x = 0.344;   
      y = 0.619;
      w = w256;
      h = h16;
      shadow = 2;
      texture =  "\ca\ui\data\loadscreen_progressbar_ca.paa";
      colorFrame[] = {0, 0, 0, 0};
      colorBar[] = {1, 1, 1,1};
};
#endif
class RscProgressBackground: RscPicture
{
  x = 0.0;   
  y = __EVAL(91 * _ySpacing);
  w = 1; 
  h = __EVAL(8 * _ySpacing);
  text ="\ca\ui\data\ui_gradient_title_gs.paa";
  colorText[] = {0, 0, 0, 0.4};
};
//Small text on the loading screens
#ifndef _RSCLOADINGTEXT_DEFINED
class RscLoadingText: RscText
{
	#define _RSCLOADINGTEXT_DEFINED 1
  style = ST_CENTER;
  x = __EVAL(44 * _xSpacing); //93
  y = __EVAL(68 * _ySpacing); // 93
  w = __EVAL(48 * _xSpacing);
  h = __EVAL(4 * _ySpacing);
  sizeEx = TextSizeXbox_normal;
  colorText[] = CA_IGUI_Sand;
};
#endif

class RscProgressNotFreeze {};
 
class RscListBox
{
  style = LB_TEXTURES;
  font = Zeppelin32;
  shadow = 2;
  sizeEx = TextSizeXbox_normal;
  color[] = {1, 1, 1, 1};
  colorText[] =  CA_IGUI_Sand; 
  colorScrollbar[] = Color_White;
  colorSelect[] = Color_White; //First color of selected Text
  colorSelect2[] = Color_White;  //Second color of selected Text
  colorSelectBackground[] = {0, 0, 0, 1};
  //  colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};   // Normal // Grey //First color of selected Backgrnd
  colorSelectBackground2[] = CA_IGUI_Sand;  //Active // Green //Second color of selected Backgrnd
  period = 1.2; //No blinking
  colorBackground[] = {0, 0, 0, 1};
  maxHistoryDelay = 1.0;
  autoScrollSpeed = -1;
  autoScrollDelay = 5;
  autoScrollRewind = false;  
  SCROLLBAR  
}; 

class RscListBoxKeys : RscListBox
{
  collisionColor[] = {1, 0, 0, 1}; //red
  disabledKeyColor[] = Color_Gray;
};

class RscIGUIListBox: RscListBox 
{
  shadow = 2;
  color[] = {1, 1, 1, 1};
  colorText[] =  CA_IGUI_Sand;
  colorScrollbar[] = Color_White;
  colorSelect[] = Color_White; //First color of selected Text
  colorSelect2[] = Color_White;  //Second color of selected Text
  colorSelectBackground[] = CA_IGUI_Sand;  // Normal // Grey //First color of selected Backgrnd
  colorSelectBackground2[] = Color_Black;  //Active // Green //Second color of selected Backgrnd
  period = 0; //No blinking
  colorBackground[] = {0, 0, 0, 1}; 
  
  sizeEx = TextSizeXbox_GUI;
  class ScrollBar 
  { 
    color[] = {1,1,1,0.6}; 
    colorActive[] = {1,1,1,1}; 
    colorDisabled[] = {1,1,1,0.3}; 
    thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
    arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
    arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
    border = "\ca\ui\data\igui_border_scroll_ca.paa";
  };  
};

//RscListNBox
class RscIGUIListNBox: RscListNBox 
{
  style = 0 + LB_TEXTURES;
  shadow = 2;
  color[] = {1, 1, 1, 1};
  colorText[] =  {1, 1, 1, 0.75};
  colorScrollbar[] = Color_White;
  colorSelect[] = Color_White; //First color of selected Text
  colorSelect2[] = Color_White;  //Second color of selected Text
  colorSelectBackground[] = CA_IGUI_Sand;  // Normal // Grey //First color of selected Backgrnd
  colorSelectBackground2[] = CA_IGUI_Sand;  //Active // Green //Second color of selected Backgrnd
  period = 0; //No blinking
  colorBackground[] = {0, 0, 0, 1}; 
  columns[] = {0.1,0.7,0.1,0.1}; 
  class ScrollBar 
  { 
    color[] = {1,1,1,0.6}; 
    colorActive[] = {1,1,1,1}; 
    colorDisabled[] = {1,1,1,0.3}; 
      thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
      arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
      arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
      border = "\ca\ui\data\igui_border_scroll_ca.paa";
  };  
};

class RscEdit
{
  style = ST_LEFT + ST_FRAME;
  font = Zeppelin32;
  shadow = 2;  
  sizeEx = TextSizeXbox_normal;
  colorBackground[] = {0, 0, 0, 1};
  colorText[] = Color_White;
  colorSelection[] = CA_IGUI_Sand;
};

class RscSlider
{
  h = 0.025;
  color[] = {1,1,1,0.8};
  colorActive[] = {1,1,1,1};
};

class RscXSliderH
{
  style = SL_HORZ  + SL_TEXTURES;  
  shadow = 2;  
  x = 0; y = 0;
  h = __EVAL(3 * _ySpacing);
  w = 0.4;
  color[] = {1,1,1,0.4};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.2};
  arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
  arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
  border = "\ca\ui\data\ui_border_frame_ca.paa";
  thumb = "\ca\ui\data\ui_slider_bar_ca.paa";  
}; 
class RscXListBox
{
  style = SL_HORZ + ST_CENTER +  LB_TEXTURES;
  shadow = 2;  
  arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
  arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
  border = "\ca\ui\data\ui_border_frame_ca.paa";
  w = __EVAL(20 * _xSpacing);
  h = __EVAL(4 * _ySpacing);
  colorSelect[] = Color_White;
  colorText[] = CA_IGUI_Sand;
    font = Zeppelin32;
  sizeEx = TextSizeXbox_normal;
    soundSelect[] = CA_UI_button_down_sound;
};
class RscFrame
{
  type = CT_STATIC;
  idc = -1;
  style = ST_FRAME;
  shadow = 2;
  colorBackground[] = {0, 0, 0, 0};
  colorText[] = {1,1,1,1};
  font = Zeppelin32;
  sizeEx = 0.02;
  text = "";
};
class RscBackground: RscText
{
  type = CT_STATIC;
  IDC = -1;
  style = ST_NO_RECT;
  shadow = 0;
  x=0.0;
  y=0.0;
  w=1.0;
  h=1.0;
  text="";
  ColorBackground[]={0.48,0.50,0.35,1};
  ColorText[]={0.1,0.1,0.1,1};
  font="Zeppelin32";
  SizeEx = 1;
};
class RscHTML
{
  colorText[] = CA_IGUI_Sand;
  colorLink[] = CA_IGUI_Sand;
  colorBold[] = CA_IGUI_Sand;
  colorLinkActive[] = Color_Orange;
  sizeEx = TextSizeXbox_normal;
  prevPage = "\ca\ui\data\arrow_left_ca.paa";
  nextPage = "\ca\ui\data\arrow_right_ca.paa";
  shadow = 2;
  class H1
  {
    font = Zeppelin32;
    fontBold = Zeppelin33;
    sizeEx = TextSizeXbox_normal;
    align = "left";    
  };

  class H2
  {
    font = Zeppelin32;
    fontBold = Zeppelin33;
    sizeEx = TextSizeXbox_normal;
    align = "left";
  };

  class H3
  {
    font = Zeppelin32;
    fontBold = Zeppelin33;
    sizeEx = TextSizeXbox_normal;
    align = "left";
  };

  class H4
  {
    font = Zeppelin33Italic;
    fontBold = Zeppelin33;
    sizeEx = TextSizeXbox_normal;
    align = "left";
  };

  class H5
  {
    font = Zeppelin32;
    fontBold = Zeppelin33;
    sizeEx = TextSizeXbox_normal;
    align = "left";
  };

  class H6
  {
    font = Zeppelin32;
    fontBold = Zeppelin33;
    sizeEx = TextSizeXbox_normal;
    align = "left";
  };

  class P
  {
    font = Zeppelin32;
    fontBold = Zeppelin33;
    sizeEx = TextSizeXbox_normal;
    align = "left";
  };
};

class RscMapControl
{
  moveOnEdges = true;
  /*x = SafeZoneX * 1.15; y = SafeZoneY * 1.15;
  w = SafeZoneW * 1.3; h = SafeZoneH * 1.3;*/
  x = SafeZoneXAbs; y = SafeZoneY;
  w = SafeZoneWAbs; h = SafeZoneH;
  shadow = 0;
  // Map drawing quality coefficients:
  //  units - the width of the screen == 800
  //  limits - size of the landscape square on screen when objects are drawn or single square content is drawn
  
  //@{ coefficients which determine rendering density / threshold
  ptsPerSquareSea = 8;   // seas
  ptsPerSquareTxt = 10;   // textures
  ptsPerSquareCLn = 10;   // count-lines
  ptsPerSquareExp = 10;   // exposure
  ptsPerSquareCost = 10;  // cost
  //@}
  
  //@{ coefficients which determine when rendering of given type is done
  ptsPerSquareFor = 6.0f;   // forests
  ptsPerSquareForEdge = 15.0f;   // forest edges
  ptsPerSquareRoad = 3f;  // roads
  ptsPerSquareObj = 15;    // other objects
  //@}

  showCountourInterval = "false";

  // _scale is % of map you can see;  satellite map alpha is
  // if map (_scale < alphaFadeStartScale) -> alpha = 1.0 * maxSatelliteAlpha;
  // else map (_scale > alphaFadeEndScale) -> alpha = 0.0;
  // else -> alpha = ((alphaFadeEndScale - _scale) / (alphaFadeEndScale - alphaFadeStartScale)) * maxSatelliteAlpha;  
  maxSatelliteAlpha = 0.75;
  alphaFadeStartScale = 0.15;
  alphaFadeEndScale = 0.29;

  
  colorLevels[] = {0.65, 0.6, 0.45, 1};
  colorSea[] = {0.46, 0.65, 0.74, 0.5};
  colorForest[] = {0.45, 0.64, 0.33, 0.5};
  colorRocks[] = {0, 0, 0, 0.3};
  colorCountlines[] = {0.85, 0.8, 0.65, 1};
  colorMainCountlines[] = {0.45, 0.4, 0.25, 1};
  colorCountlinesWater[] = {0.25, 0.4, 0.5, 0.3};
  colorMainCountlinesWater[] = {0.25, 0.4, 0.5, 0.9};
  colorPowerLines[] = {0.1, 0.1, 0.1, 1};
  colorRailWay[] = {0.8, 0.2, 0, 1};
  colorForestBorder[] = {0, 0, 0, 0};
  colorRocksBorder[] = {0, 0, 0, 0};
  colorNames[] = {0.1, 0.1, 0.1, 0.9};
  colorInactive[] = {1, 1, 1, 0.5};
  colorOutside[] = {0, 0, 0, 1}; //color outside the gaming world square ion 2D map


  fontLabel = Zeppelin32;
  sizeExLabel = TextSizeXbox_GUI;
  fontGrid = Zeppelin32;
  sizeExGrid = 0.03;//TextSizeXbox_GUI;
  fontUnits = Zeppelin32;
  sizeExUnits = TextSizeXbox_GUI;
  fontNames = Zeppelin32;
  sizeExNames = 0.056; //Double the medium size
  fontInfo = Zeppelin32;
  sizeExInfo = TextSizeXbox_GUI;
  fontLevel = Zeppelin32;
  sizeExLevel = 0.024; //TextSizeXbox_GUI;
  text = "\ca\ui\data\map_background2_co.paa"; //"\ca\ui\data\map_background_co.paa";
  
  class Task
  {
    icon =  "\ca\ui\data\ui_taskstate_current_CA.paa";
    iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
    iconCanceled = ProcTextTransparent;
    iconDone =  "\ca\ui\data\ui_taskstate_done_CA.paa";
    iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
    
        
    color[] = CA_IGUI_Orange;
    colorCreated[] = Color_White;
    colorCanceled[] = CA_IGUI_Grey;
    colorDone[] = CA_IGUI_DarkGreen;
    colorFailed[] = CA_IGUI_Red;
        
    size = 27;
    importance = 1; // not used
    coefMin = 1; // not used
    coefMax = 1; // not used
  }; 
  class CustomMark
  {
    icon = "\ca\ui\data\map_waypoint_ca.paa";
    color[] = {0.6471,0.6706,0.6235,1.0};
    size = 18;
    importance = 1; // not used
    coefMin = 1; // not used
    coefMax = 1; // not used
  };
  
  class Legend
  {
    //x = (SafeZoneW + SafeZoneX) - (1 - 0.616);
    //y = 0.065 + SafeZoneY;
    x = SafeZoneX;
    y = SafeZoneY;
    w = 0.34;
    h = 0.152;
    
    font = Zeppelin32;
    sizeEx = TextSizeXbox_normal;
    
    colorBackground[] = {0.906, 0.901, 0.88, 0};
    color[] = {0, 0, 0, 1};
  };
  class Bunker
  {
    icon = "\ca\ui\data\map_bunker_ca.paa";
    size = 14;
    importance = 1.5 * 14 * 0.05; // limit for map scale
    coefMin = 0.25;
    coefMax = 4;
  };

  class Bush
  {
    icon = "\ca\ui\data\map_bush_ca.paa";
    color[] = {0.45, 0.64, 0.33, 0.4};
    size = 14;
    importance = 0.2 * 14 * 0.05;
    coefMin = 0.25;
    coefMax = 4;
  };

  class BusStop
  {
    icon = "\ca\ui\data\map_busstop_ca.paa";  
    color[] = {0.15, 0.26, 0.87, 1};
//    color[] = {0.78, 0, 0.05, 1};
    size = 12;
    importance = 1 * 10 * 0.05;
    coefMin = 0.25;
    coefMax = 4;
  };
  class Command
  {
    icon = "\ca\ui\data\map_waypoint_ca.paa";
    color[] = {0, 0.9, 0, 1};
    size = 18;
    importance = 1; // not used
    coefMin = 1; // not used
    coefMax = 1; // not used
  };
  class Cross
  {
    icon = "\ca\ui\data\map_cross_ca.paa";
    size = 16;
    color[] = {0, 0.9, 0, 1};    
    importance = 0.7 * 16 * 0.05;
    coefMin = 0.25;
    coefMax = 4;
  };

  class Fortress
  {
    icon = "\ca\ui\data\map_bunker_ca.paa";
    size = 16;
    color[] = {0, 0.9, 0, 1};    
    importance = 2 * 16 * 0.05;
    coefMin = 0.25;
    coefMax = 4;
  };

  class Fuelstation
  {
    icon = "\ca\ui\data\map_fuelstation_ca.paa";
    size = 16;
    color[] = {0, 0.9, 0, 1};    
    importance = 2 * 16 * 0.05;
    coefMin = 0.75;
    coefMax = 4;
  };

  class Fountain
  {
    icon = "\ca\ui\data\map_fountain_ca.paa";
    color[] = {0.2, 0.45, 0.7, 1};
    size = 11;
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
    size = 16;
    importance = 1 * 16 * 0.05;
    coefMin = 0.9;
    coefMax = 4;
  };

  class Church
  {
    icon = "\ca\ui\data\map_church_ca.paa";
    size = 16;
    color[] = {0, 0.9, 0, 1};    
    importance = 2 * 16 * 0.05;
    coefMin = 0.9;
    coefMax = 4;
  };

  class Lighthouse
  {
    icon = "\ca\ui\data\map_lighthouse_ca.paa";
    size = 14;
    color[] = {0, 0.9, 0, 1};    
    importance = 3 * 16 * 0.05;
    coefMin = 0.9;
    coefMax = 4;
  };

  class Quay
  {
    icon = "\ca\ui\data\map_quay_ca.paa";
    size = 16;
    color[] = {0, 0.9, 0, 1};    
    importance = 2 * 16 * 0.05;
    coefMin = 0.5;
    coefMax = 4;
  };

  class Rock
  {
    icon = "\ca\ui\data\map_rock_ca.paa";
    color[] = {0.1, 0.1, 0.1, 0.8};
    size = 12;
    importance = 0.5 * 12 * 0.05;
    coefMin = 0.25;
    coefMax = 4;
  };

   class Ruin
   {
    icon = "\ca\ui\data\map_ruin_ca.paa";
    size=16;
    color[] = {0, 0.9, 0, 1};
    importance = 1.2 * 16 * 0.05;
    coefMin = 1;
    coefMax = 4;
  };

  class SmallTree
  {
    icon = "\ca\ui\data\map_smalltree_ca.paa";
    color[] = {0.45, 0.64, 0.33, 0.4};
    size = 12;
    importance = 0.6 * 12 * 0.05;
    coefMin = 0.25;
    coefMax = 4;
  };

  class Stack
  {
    icon = "\ca\ui\data\map_stack_ca.paa";
    size = 20;
    color[] = {0, 0.9, 0, 1};        
    importance = 2 * 16 * 0.05;
    coefMin = 0.9;
    coefMax = 4;
    };

  class Tree
  {
    icon = "\ca\ui\data\map_tree_ca.paa";
    color[] = {0.45, 0.64, 0.33, 0.4};
    size = 12;
    importance = 0.9 * 16 * 0.05;
    coefMin = 0.25;
    coefMax = 4;
  };

  class Tourism
  {
    icon = "\ca\ui\data\map_tourism_ca.paa";
    //color[] = {0.78, 0, 0.05, 1};
    size = 16;
    importance = 1 * 16 * 0.05;
    coefMin = 0.7;
    coefMax = 4;
  };

  class Transmitter
  {
    icon = "\ca\ui\data\map_transmitter_ca.paa";
    color[] = {0, 0.9, 0, 1};
    size = 20;
    importance = 2 * 16 * 0.05;
    coefMin = 0.9;
    coefMax = 4;
    };

  class ViewTower
  {
    icon = "\ca\ui\data\map_viewtower_ca.paa";
    color[] = {0, 0.9, 0, 1};
    size = 16;
    importance = 2.5 * 16 * 0.05;
    coefMin = 0.5;
    coefMax = 4;
  };

    class Watertower
  {
      icon = "\ca\ui\data\map_watertower_ca.paa";
      color[] = {0.2, 0.45, 0.7, 1};
      size=20;
      importance = 1.2 * 16 * 0.05;
      coefMin = 0.9;
      coefMax = 4;
    };

  class Waypoint
  {
    icon = "\ca\ui\data\map_waypoint_ca.paa";
  };

  class WaypointCompleted
  {
    icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
  };
};


class RscMap
{
  access = ReadAndWrite;

  class controls
  {
    class Map: RscMapControl
    {
      moveOnEdges = false;
      x = SafeZoneXAbs; y = SafeZoneY;
      //w = SafeZoneW - (1 - 0.83); h = SafeZoneH;
      w = SafeZoneWAbs; h = SafeZoneH;
    };
  };
};

class RscCompass: RscObject
{
  model = "\ca\ui\compass.p3d";
  //Unit vector
  direction[] = {0, 0.5, 0.5};
  up[] = {0, 1, 0};
  positionBack[] = {0, -0.02, 0.075};
  scale = 0.44;
};

class RscWatch: RscObject
{
  model = "\ca\ui\watch.p3d";
};

//In-game GPS minimap
class RscMiniMap
{
  class controlsBackground   {
    class CA_MiniMap: RscMapControl 
    {
      IDC = IDC_MINIMAP;
      ShowCountourInterval = false;
      x = (SafeZoneW + SafeZoneX) - (1 - 0.625);
      y = (SafeZoneH + SafeZoneY) - (1 - 0.480);
      w = 0.350;
      h = 0.301;
      
      moveOnEdges = true;
      maxSatelliteAlpha = 0.0;
      
      alphaFadeStartScale = 0.05;
      alphaFadeEndScale = 0.15;
    
    
      colorLevels[] = {0.58, 0.65, 0.45, 0.9};
      colorSea[] = {0.46, 0.65, 0.74, 0.5};
      colorForest[] = {0.59, 0.72, 0.23, 0.5};
      colorRocks[] = {0.5, 0.44, 0.3, 0.5};
      colorCountlines[] = {0.58, 0.65, 0.45, 0.3};
      colorMainCountlines[] = {0.39, 0.45, 0.27, 0.9};
      colorCountlinesWater[] = {0.45, 0.65, 0.7, 0.3};
      colorMainCountlinesWater[] = {0.3, 0.62, 0.74, 0.9};
      colorPowerLines[] = {0.35, 0.46, 0.53, 1};
      colorRailWay[] = {0.8, 0.2, 0, 1};
      colorForestBorder[] = {0, 0, 0, 0};
      colorRocksBorder[] = {0, 0, 0, 0};
      colorNames[] = {0.1, 0.1, 0.1, 0.9};
      colorInactive[] = {1, 1, 1, 0.5};
    
    
    
      fontLabel = Zeppelin32;
      sizeExLabel = TextSizeXbox_GUI;
      fontGrid = Zeppelin32;
      sizeExGrid = 0.03;//TextSizeXbox_GUI;
      fontUnits = Zeppelin32;
      sizeExUnits = TextSizeXbox_GUI;
      fontNames = Zeppelin32;
      sizeExNames = 0.056; //Double the medium size
      fontInfo = Zeppelin32;
      sizeExInfo = TextSizeXbox_GUI;
      fontLevel = Zeppelin32;
      sizeExLevel = 0.024; //TextSizeXbox_GUI;
    
      text = "\ca\ui\data\map_background2_co.paa"; //"\ca\ui\data\map_background_co.paa";
     
      class CustomMark
      {
        icon = "\ca\ui\data\map_waypoint_ca.paa";
        color[] = {0, 0, 1, 1};
        size = 18;
        importance = 1; // not used
        coefMin = 1; // not used
        coefMax = 1; // not used
      };
      
      class Legend
      {
        //x = (SafeZoneW + SafeZoneX) - (1 - 0.616);
        //y = 0.065 + SafeZoneY;
        x = SafeZoneX;
        y = SafeZoneY;
        w = 0.34;
        h = 0.152;
        
        font = Zeppelin32;
        sizeEx = TextSizeXbox_normal;
        
        colorBackground[] = {0.906, 0.901, 0.88, 0};
        color[] = {0, 0, 0, 1};
      };
      class Bunker
      {
        icon = "\ca\ui\data\map_bunker_ca.paa";
        color[] = {0.5, 0.5, 0.5, 1};
        size = 14;
        importance = 1.5 * 14 * 0.05; // limit for map scale
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
        //    color[] = {0.78, 0, 0.05, 1};
        size = 10;
        importance = 1 * 10 * 0.05;
        coefMin = 0.25;
        coefMax = 4;
      };
      class Command
      {
        icon = "\ca\ui\data\map_waypoint_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 18;
        importance = 1; // not used
        coefMin = 1; // not used
        coefMax = 1; // not used
      };
      class Cross
      {
        icon = "\ca\ui\data\map_cross_ca.paa";
        size = 16;
        color[] = {0, 0.9, 0, 1};        
        importance = 0.7 * 16 * 0.05;
        coefMin = 0.25;
        coefMax = 4;
      };
    
      class Fortress
      {
        icon = "\ca\ui\data\map_bunker_ca.paa";
        size = 16;
        color[] = {0, 0.9, 0, 1};
        importance = 2 * 16 * 0.05;
        coefMin = 0.25;
        coefMax = 4;
      };
    
      class Fuelstation
      {
        icon = "\ca\ui\data\map_fuelstation_ca.paa";
        size = 16;
        color[] = {0, 0.9, 0, 1};
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
            color[] = {0, 0.9, 0, 1};
        size = 16;
            importance = 1 * 16 * 0.05;
        coefMin = 0.9;
            coefMax = 4;
      };
    
      class Church
      {
        icon = "\ca\ui\data\map_church_ca.paa";
        size = 16;
            color[] = {0, 0.9, 0, 1};        
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
        size = 16;
            color[] = {0, 0.9, 0, 1};        
            importance = 2 * 16 * 0.05;
            coefMin = 0.5;
            coefMax = 4;
      };
    
      class Rock
      {
        icon = "\ca\ui\data\map_rock_ca.paa";
        size = 12;
            color[] = {0, 0.9, 0, 1};        
            importance = 0.5 * 12 * 0.05;
            coefMin = 0.25;
            coefMax = 4;
      };
    
        class Ruin
       {
        icon = "\ca\ui\data\map_ruin_ca.paa";
        color[] = {0.78, 0, 0.05, 1};
        size=16;
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
        color[] = {0, 0.9, 0, 1};
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
        color[] = {0.5, 0.5, 0.5, 1};
            size = 20;
            importance = 2 * 16 * 0.05;
            coefMin = 0.9;
            coefMax = 4;
        };
    
      class ViewTower
      {
        icon = "\ca\ui\data\map_viewtower_ca.paa";
        size = 16;
        color[] = {0.5, 0.5, 0.5, 1};        
            importance = 2.5 * 16 * 0.05;
            coefMin = 0.5;
            coefMax = 4;
      };
    
        class Watertower
      {
        icon = "\ca\ui\data\map_watertower_ca.paa";
        color[] = {0, 0.35, 0.7, 1};
        size=32;
            importance = 1.2 * 16 * 0.05;
            coefMin = 0.9;
            coefMax = 4;
        };
    
      class Waypoint
      {
          icon = "\ca\ui\data\map_waypoint_ca.paa";
          size = 16;
          color[] = {0.5, 0.5, 0.5, 1};        
          importance = 2.5 * 16 * 0.05;
          coefMin = 0.5;
          coefMax = 4;        
      };
    
      class WaypointCompleted
      {
        icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
        size = 16;
        color[] = {0.5, 0.5, 0.5, 1};        
        importance = 2.5 * 16 * 0.05;
        coefMin = 0.5;
        coefMax = 4;        
      };      
    };
  };
  class controls 
  {
   delete MiniMap;
    class CA_MinimapFrame: RscPicture
    {
      x = (SafeZoneW + SafeZoneX) - (1 - 0.705/1.25); 
      y = (SafeZoneH + SafeZoneY) - (1 - 0.451/1.25);
      w = w256*1.5;
      h = h256*1.5;
      text = "\ca\ui\data\ui_gps_ca.paa";      
    }; 
  };
};

//In-game GPS minimap small
class RscMiniMapSmall: RscMiniMap 
{
  class controlsBackground   
  {
        class CA_MiniMap: RscMapControl 
        {
          IDC = IDC_MINIMAP;
          ShowCountourInterval = false;
          x = (SafeZoneW + SafeZoneX) - (1 - 0.757);
          y = (SafeZoneH + SafeZoneY) - (1 - 0.466);
          w = 0.35;
          h = 0.338;
        };
  };

  class controls 
  {
    class CA_MinimapFrame: RscPicture
    {
      x = (SafeZoneW + SafeZoneX) - (1 - 0.705); 
      y = (SafeZoneH + SafeZoneY) - (1 - 0.451);
      w = w256;
      h = h256;
      text = "\ca\ui\data\ui_gps_ca.paa";
    }; 
  };
};

class RscObjectives
{
  done = "\ca\ui\data\ui_task_done_ca.paa";
  failed = "\ca\ui\data\ui_task_failed_ca.paa";
  active = "\ca\ui\data\ui_task_assigned_ca.paa";
  cancled = "\ca\ui\data\ui_task_cancelled_ca.paa";
};
class IGUIBack
{
  type = CT_STATIC;
  idc = IDC_IGUI_BG;
  style = ST_HUD_BACKGROUND;
  text = "";
  colorText[] = {0, 0, 0, 0};
  font = Zeppelin32;
  sizeEx = 0.0;  
  shadow = 0;      
  x = 0.1;
  y = 0.1;
  w = 0.1;
  h = 0.1;
  colorbackground[] = CA_IGUI_Background;
};  
    
class CA_Mainback: RscPicture
{
  x = 0.35; y = 0.8;
  w = 0.3; h = 0.2;
  //test
  text ="\ca\ui\data\ui_gradient_start_gs.paa";
  colorText[]= CA_IGUI_DarkGreen;
};

class CA_Mainback_2: CA_Mainback
{
  x = 0.35; y = 0.8;
  w = 0.3; h = 0.2;
  colorText[]= Color_Black;
  text = "\ca\ui\data\ui_gradient_middle_gs.paa";
};
class CA_Mainback_3: CA_Mainback
{
  x = 0.35; y = 0.8;
  w = 0.3; h = 0.2;
  colorText[]= Color_Black;  
  text = "\ca\ui\data\ui_gradient_end_gs.paa";
};
class CA_Back: CA_Mainback
{
  x = 0.29; y = 0.38;
  w = 0.56; h = 0.57;
  // colorText[]= Color_Black;
  colorText[]= CA_IGUI_DarkGreen;
  text ="\ca\ui\data\ui_gradient_reverse_gs.paa";
};
class CA_Title_Back: CA_Mainback
{
  x = __EVAL(2 * _xSpacing);
  y = __EVAL(0 * _ySpacing);
  w = __EVAL(129.3 * _xSpacing);
  h = __EVAL(6 * _ySpacing);
  text = ProcTextTransparent;
  colorText[] =  Color_White;
};
class CA_Back1: CA_Back
{
  x = 0.30; y = 0.43;
  w = 0.26; h = 0.22;
  colorText[] = Color_Back;
  //colorbackground[] = Color_Back;
};

class CA_Back2: CA_Back
{
  x = 0.565; y = 0.43;
  w = 0.27; h = 0.50;
  colorText[] = Color_BackList;
  //colorbackground[] = {0, 0, 0, 0.5};
};

class CA_Back3: CA_Back
{
  x = 0.57; y = 0.43;
  w = 0.27; h = 0.50;
  colorText[] = Color_BackList;
};
class CA_Black_Back: CA_Mainback  
{
  x = SafeZoneX - SafeZoneW; y = SafeZoneY - SafeZoneH;
  w = SafeZoneW * 4; h = SafeZoneH * 4;
  text = ProcTextBlack; 
  colorText[] = Color_Black;
  color[] = Color_Black;
  colorBackground[] = Color_Black;
};
class CA_Title: RscText
{
  x = __EVAL(2 * _xSpacing);
  y = 0.182; 
  w = __EVAL(129.3 * _xSpacing);
  h = __EVAL(6 * _ySpacing);
  style = ST_LEFT + ST_SHADOW;
  font = Zeppelin32;
  sizeEx = TextSizeXbox_title;
  colorText[] = Color_White;
};
class RscTextWIP: RscText
{ 
  x = SafeZoneX;
  y = 0.099 + SafeZoneY;
  w = w128;
  h = h128; 
  shadow = 2;
  SizeEx = TextSizeXbox_GUI;
  colorText[] = CA_IGUI_Sand;
  //text = "PREVIEW VERSION - WORK IN PROGRESS";
  text = "";
};
class CA_IGUI_Title : CA_Title
{
  sizeEx = TextSizeXbox_normal;
  style = ST_LEFT;  
};

// Original logo definition
class CA_Logo: RscPictureKeepAspect
{
  idc = 1220;
  x = 0.638; y = 0.333;
  w = 0.25; h = 0.08;
  text = "\ca\ui\data\logo_white_all_ca.paa";
};


class CA_Logo_Small: CA_Logo
{
  w = 0.2; h = 0.0666;
};

class CA_GameSpy_logo: RscPictureKeepAspect
{
  x = 0.55; y = 0.333;
  w = 0.15; h = 0.05;
  text = "\ca\ui\data\gamespy_logo.paa";
};
class ArmA2_HintBackgroundTop: CA_Mainback  
{
  x = -0.5; 
  y = __EVAL(-27 * _ySpacing));
  w = __EVAL(200 * _ySpacing);
  h = __EVAL(33.3 * _ySpacing);
  colorText[] = Color_Black;      
};      
class ArmA2_HintBackgroundBottom: CA_Mainback  
{
  x = -0.5; 
  y = __EVAL(((_HintsY select 0)-1) * _ySpacing));
  w = __EVAL(200 * _ySpacing);
  h = __EVAL(33.3 * _ySpacing);
  colorText[] = Color_Black;
};  
class RscStandardDisplay
{
  movingEnable = true;
  enableSimulation = true;
  enableDisplay = true;
};

class RscLineBreak {};
 
class CA_RscButton: RscButton
{
  idc = -1;
  default = false;
  x = __EVAL(86 * _ySpacing); 
  y = 0.8;
  w = __EVAL(15 * _ySpacing); 
  h =  __EVAL(4 * _ySpacing);
  borderSize =  __EVAL(1 * _ySpacing);
  color[] = {0, 0, 0, 0};
  colorActive[] = {0, 0, 0, 0};
};

class CA_RscButton_dialog: CA_RscButton
{
  x = __EVAL(84 * _ySpacing);
  y = 0.85;
  w = __EVAL(27 * _xSpacing);
  borderSize =  0; // when negative, the border is on the right side of background
};

class CA_Ok: RscActiveText
{
  idc = -1;
  style = ST_PICTURE;
  default = false;
  x = 0.85; y = 0.8;
  w = 0.15; h = 0.035;
  text = "#(argb,8,8,3)color(0,0,0,0)";
  color[] = {0, 0, 0, 0};
  colorActive[] = {0, 0, 0, 0};
};


class CA_Ok_image: RscText
{
  idc = -1;
  x = 0.86; y = 0.8;
  w = 0.14; h = 0.04;
  text = "#(argb,8,8,3)color(1,1,1,0.9)";
  style = ST_PICTURE;
  colortext[] = {1, 1, 1, 0.8};
};

class CA_Ok_image2: RscText
{
  idc = -1;
  x = 0.85; y = 0.8;
  w = 0.010; h = 0.04;
  text = "#(argb,8,8,3)color(1,1,1,0.9)";
  style = ST_PICTURE;
  colortext[] = {0, 0, 0, 0.8};
};

class CA_Ok_text: RscText
{
  sizeEx = TextSize_normal;
  idc = -1;
  x = 0.86; y = 0.8;
  w = 0.14; h = 0.04;
  style = ST_LEFT;
  colortext[] = {0, 0, 0, 0.8};
};

class RscCombo
{
  x = 0;
  y = 0;
  w = 0.12;
  h = 0.035;
  shadow = 0;      
  colorSelect[] = Color_Black;
  colorText[] = Color_Black;
  colorBackground[] = Color_White;
  colorSelectBackground[] = CA_IGUI_Sand; 
  colorScrollbar[] = Color_Black;  
  arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
  arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
  wholeHeight = 0.45;
  color[] = {0,0,0,0.6}; 
  colorActive[] = {0,0,0,1}; 
  colorDisabled[] = {0,0,0,0.3}; 
  
  font = Zeppelin32;
  sizeEx = TextSizeXbox_normal;
  SCROLLBAR
};


class CA_Table_back: RscPicture
{
  x = 0.20; y = 0.25;
  w = 0.4; h = 0.68;
  text = "\ca\ui\textures\g_black2grey.paa";
  colortext[] = {1, 1, 1, 0.8};
};

class CA_UpTitle: RscTitle
{
  x = 0.01; y = 0.105;
  w = 0.5; h = 0.05;
  style = "ST_LEFT";
  colortext[] = {1, 1, 1, 1};
};

class CA_BoxLeft: RscPicture
{
  x = 0.00; y = 0.1;
  w = 1; h = 0.08;
  text = "\ca\ui\textures\white_basic.paa";
};

// cerny ramecek s bilou vyplni

class BB_left: Rsctext
{
  x = 0.05; y = 0.255;
  w = 0.005; h = 0.5;
  colorbackground[] = {0, 0, 0, 0.5};
};

class BB_right: BB_left
{
  x = 0.944;
};

class BB_down: BB_left
{
  y = 0.755;
  w = 0.9; h = 0.005;
};

class BB_up: BB_down
{
  y = 0.2495;
  w = 0.90;
};

class BB_Back: RscPicture
{
  x = 0.055; y = 0.255;
  w = 0.89; h = 0.5;
  colortext[] = {1, 1, 1, 0.5};
  text = "\ca\ui\textures\white_basic.paa";
};

class Back_UserTitle: RscPicture
{
  x = 0.05; y = 0.2;
  w = 0.27; h = 0.065;
  colortext[] = {1, 1, 1, 0.8};
  text = "\ca\ui\textures\title_up.paa";
};

class Table_back_black: RscPicture
{
  x = 0.20; y = 0.25;
  w = 0.4; h = 0.68;
  text = "\ca\ui\textures\g_black2grey.paa";
  colortext[] = {1, 1, 1, 0.8};
};

class Table_back_white: CA_Ok_image
{
  x = 0.21; y = 0.26;
  w = 0.38; h = 0.66;
  colortext[] = {1, 1, 1, 0.9};
};

class RscBackgroundStripeTop: RscText
{
	access = ReadAndWrite;
	x = safezoneX;
	y = safezoneY;
	w = safezoneW;
	h = 0.125*safezoneH;
	text = ;
	colorBackground[] = {0.1, 0.1, 0.1, 1};
};
class RscBackgroundStripeBottom: RscText
{
	x = safezoneX;
	y = safezoneY + safezoneH - 0.125*safezoneH;
	w = safezoneW;
	h = 0.125*safezoneH;
	text = ;
	colorBackground[] = {0.1, 0.1, 0.1, 1};
};

class RscDisplayBackgroundStripes
{
	class Background1: RscBackgroundStripeTop {};
	class Background2: RscBackgroundStripeBottom {};
};

class RscCinemaBorder: RscDisplayBackgroundStripes
{
	idd = -1;
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground
	{
		class Background1: RscBackgroundStripeTop
		{
		  	colorBackground[] = {0, 0, 0, 1};
		};

		class Background2: RscBackgroundStripeBottom
		{
		  	colorBackground[] = {0, 0, 0, 1};
		};
	};
};
class RscToolbox
{
  colorText[] = Color_White;
  color[] = Color_White;
  colorTextSelect[] = Color_White;
  colorSelect[] = Color_White;
  colorTextDisable[] = CA_UI_grey;
  colorDisable[] = CA_UI_grey;             
  colorSelectedBg[] = {0,0,0,1};
  font = Zeppelin32;
  sizeEx = TextSize_small;
};
