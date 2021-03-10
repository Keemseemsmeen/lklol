////////////////////////////////////////////////////////////////////
//Produced from mikero's Dos Tools using dll 2.84
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class gzl_director : config.bin{
class CfgPatches
{
 class GZL_Director
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 1.0;
  requiredAddons[] = {};
 };
};
showHUD = "false";

class GZLRscLabel
{
 idc = -1;
 type = 0;
 style = 2;
 sizeEx = 0.029;
 font = "TahomaB";
 colorBackground[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 x = 0;
 y = 0;
 w = 0;
 h = 0;
 text = "";
};
class GZLRscSlider
{
 idc = -1;
 type = 3;
 style = 1024;
 x = 0;
 y = 0;
 w = 0;
 h = 0;
 color[] = {1,1,1,0.5};
 coloractive[] = {1,1,1,1};
};
class GZLRscEdit
{
 idc = -1;
 style = 0;
 type = 2;
 access = 1;
 font = "TahomaB";
 sizeEx = 0.027;
 color[] = {0.5,0.5,0.5,1};
 colorBackground[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorSelection[] = {0.5,0.5,0.5,1};
 autocomplete = "";
 text = "";
 size = 0;
 x = 0;
 y = 0;
 w = 0;
 h = 0;
};
class GZLRscButton
{
 idc = -1;
 type = 1;
 style = 2;
 x = 0;
 y = 0;
 w = 0;
 h = 0;
 sizeEx = 0.03;
 font = "TahomaB";
 colorText[] = {1,1,1,1};
 colorFocused[] = {1,1,1,0.2};
 colorDisabled[] = {0.5,0.5,0.5,0.7};
 colorBackground[] = {0,0,0,0};
 colorBackgroundDisabled[] = {0.5,0.5,0.5,0.2};
 colorBackgroundActive[] = {0.1,0.1,0.1,0.7};
 offsetX = 0.003;
 offsetY = 0.003;
 offsetPressedX = 0.002;
 offsetPressedY = 0.002;
 colorShadow[] = {0,0,0,0};
 colorBorder[] = {0,0,0,0};
 borderSize = 0;
 soundEnter[] = {"",0,1};
 soundPush[] = {"",0,1};
 soundClick[] = {"",0,1};
 soundEscape[] = {"",0,1};
 action = "";
 text = "";
};
class GZLRscListBox
{
 idc = -1;
 type = 5;
 style = 32;
 x = 0;
 y = 0;
 w = 0;
 h = 0;
 font = "TahomaB";
 sizeEx = 0.025;
 rowHeight = 0.025;
 wholeHeight = 0.025;
 color[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorBackground[] = {0,0,0,0};
 colorSelect[] = {0,0,0,0};
 colorSelectBackground[] = {0,0,0,0};
 soundSelect[] = {"",0.0,1};
 soundExpand[] = {"",0.0,1};
 soundCollapse[] = {"",0.0,1};
 maxHistoryDelay = 10;
 autoScrollSpeed = -1;
 autoScrollDelay = 5;
 autoScrollRewind = 0;
 class ScrollBar
 {
  color[] = {0,0,0,1};
  colorActive[] = {1,0,0,1};
  colorDisabled[] = {0.35,0.35,0.35,1};
  thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
  arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
  arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
  border = "\ca\ui\data\ui_border_scroll_ca.paa";
 };
};
class GZL_DIALOG_DIRECTOR
{
 idd = 888230;
 movingEnable = 1;
 controlsBackground[] = {"GZLRscShadow","GZLRscBackground","GZLGrab"};
 objects[] = {};
 controls[] = {"lblTitle","lblVer","lblSubjectMan","lblSubjectVeh","lblAccTime","lblSceneLength","lblPreloadTitle","lineTopH","lineBottomH","lineH1","lineH2","lineH3","lineV1","lineV3","lineV4","btnAction","btnCut","btnClose","btnFadeOutIn","sldPreload","txtSceneLength","lstScenes","sldAccTime","txtAccTime","btnMore","btnMan","btnAir","btnLand","btnSea","btnEast","btnWest","btnGuer","btnCiv","sldSubjectBias","lstVehicles"};
 onUnload = "[GZL_IDD_DLG_DIRECTOR, _this] call GZL_fnc_InputDirector;";
 class GZLRscBackground
 {
  idc = -1;
  moving = 0;
  type = 0;
  style = 48;
  text = "\loki_lost_key\GZL_Director\images\clapboard.paa";
  font = "TahomaB";
  sizeEx = 0.023;
  colorBackground[] = {};
  colorText[] = {};
  x = 0.2;
  y = 0.1;
  w = 0.55;
  h = 0.7;
 };
 class GZLGrab: GZLRscBackground
 {
  idc = 888251;
  moving = 1;
  style = 2;
  colorBackground[] = {0,0,0,0};
  text = "";
  x = 0.2;
  y = 0.1;
  w = 0.55;
  h = 0.18;
 };
 class GZLRscShadow
 {
  idc = -1;
  type = 0;
  style = 256;
  text = "";
  font = "TahomaB";
  sizeEx = 0.023;
  colorBackground[] = {0.3,0.3,0.3,0.68};
  colorText[] = {};
  x = 0.22;
  y = 0.12;
  w = 0.53;
  h = 0.67;
 };
 class lblTitle: GZLRscLabel
 {
  idc = 888231;
  style = "0x02 + 				0x100";
  sizeEx = 0.05;
  x = 0.215;
  y = 0.24;
  w = 0.52;
  h = 0.04;
  text = "Title";
 };
 class lblVer: GZLRscLabel
 {
  idc = 888237;
  style = "0x00 + 				0x100";
  sizeEx = 0.023;
  x = 0.214;
  y = 0.748;
  w = 0.3;
  h = 0.04;
  text = "";
  colorText[] = {0.7,0.7,0.7,1};
 };
 class lblSubjectMan: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.023;
  colorText[] = {0.8,0.8,0.8,1};
  x = 0.39;
  y = 0.625;
  w = 0.08;
  h = 0.04;
  text = "Man";
 };
 class lblSubjectVeh: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.023;
  colorText[] = {0.8,0.8,0.8,1};
  x = 0.52;
  y = 0.625;
  w = 0.08;
  h = 0.04;
  text = "Veh";
 };
 class lblAccTime: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.0205;
  colorText[] = {1,1,1,0.7};
  x = 0.404;
  y = 0.365;
  w = 0.2;
  h = 0.0205;
  text = "Time Acceleration";
 };
 class lblSceneLength: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.028;
  colorText[] = {1,1,1,0.7};
  x = 0.52;
  y = 0.3;
  w = 0.22;
  h = 0.04;
  text = "Scene Length:       secs";
 };
 class lblPreloadTitle: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.0205;
  colorText[] = {0.7,0.7,0.7,1};
  x = 0.405;
  y = 0.3;
  w = 0.1;
  h = 0.0205;
  text = "Preload";
 };
 class sldSubjectBias: GZLRscSlider
 {
  idc = 888235;
  style = 1024;
  x = 0.403;
  y = 0.615;
  w = 0.145;
  h = 0.02;
  onSliderPosChanged = "[GZL_IDC_SLD_SUBJECT_BIAS, _this] call GZL_fnc_InputDirector;";
 };
 class sldAccTime: GZLRscSlider
 {
  idc = 888243;
  style = 1024;
  x = 0.399;
  y = 0.3875;
  w = 0.145;
  h = 0.02;
  onSliderPosChanged = "[GZL_IDC_SLD_ACCTIME, _this] call GZL_fnc_InputDirector;";
 };
 class sldPreload: GZLRscSlider
 {
  idc = 888253;
  style = 1024;
  x = 0.381;
  y = 0.32;
  w = 0.11;
  h = 0.02;
  onSliderPosChanged = "[GZL_IDC_SLD_PRELOAD, _this] call GZL_fnc_InputDirector;";
 };
 class txtAccTime: GZLRscEdit
 {
  idc = 888244;
  colorText[] = {0.95,0.95,0.95,1};
  text = "1";
  size = 0.2;
  x = 0.554;
  y = 0.382;
  w = 0.045;
  h = 0.03;
  onKeyUp = "[GZL_IDC_TXT_ACCTIME, _this] call GZL_fnc_InputDirector;";
 };
 class txtSceneLength: GZLRscEdit
 {
  idc = 888250;
  colorText[] = {0.95,0.95,0.95,1};
  size = 0.2;
  x = 0.649;
  y = 0.305;
  w = 0.045;
  h = 0.03;
  onKeyUp = "[GZL_IDC_TXT_SCENE_LENGTH, _this] call GZL_fnc_InputDirector;";
 };
 class lstScenes: GZLRscListBox
 {
  idc = 888238;
  x = 0.215;
  y = 0.36;
  w = 0.1695;
  h = 0.3;
  font = "TahomaB";
  sizeEx = 0.029;
  rowHeight = 0.029;
  wholeHeight = "10 * 0.029";
  colorText[] = {0.5,0.5,0.5,1};
  colorSelect[] = {1,1,1,1};
  onLBSelChanged = "[GZL_IDC_LST_SCENES, _this, 'change'] call GZL_fnc_InputDirector;";
 };
 class lstVehicles: GZLRscListBox
 {
  idc = 888254;
  style = 48;
  x = 0.56;
  y = 0.435;
  w = 0.18;
  h = 0.225;
  sizeEx = 0.028;
  rowHeight = 0.028;
  wholeHeight = "6 * 0.028";
  colorText[] = {0.5,0.5,0.5,1};
  colorBackground[] = {0.1,0.1,0.1,1};
  colorSelect[] = {1,1,1,1};
  onLBSelChanged = "[GZL_IDC_LST_VEHICLES, _this] call GZL_fnc_InputDirector;";
 };
 class btnClose: GZLRscButton
 {
  idc = 888234;
  sizeEx = 0.04;
  x = 0.58;
  y = 0.681;
  w = 0.14;
  h = 0.055;
  colorBackground[] = {1,1,1,0.2};
  action = "[GZL_IDC_BTN_CLOSE, _this] call GZL_fnc_InputDirector;";
  text = "Close";
 };
 class btnAction: GZLRscButton
 {
  idc = 888232;
  sizeEx = 0.04;
  x = 0.23;
  y = 0.681;
  w = 0.14;
  h = 0.055;
  colorBackground[] = {1,1,1,0.2};
  action = "[GZL_IDC_BTN_ACTION, _this] call GZL_fnc_InputDirector;";
  text = "Action!";
 };
 class btnCut: GZLRscButton
 {
  idc = 888233;
  sizeEx = 0.04;
  x = 0.405;
  y = 0.681;
  w = 0.14;
  h = 0.055;
  colorBackground[] = {1,1,1,0.2};
  action = "[GZL_IDC_BTN_CUT, _this] call GZL_fnc_InputDirector;";
  text = "Cut!";
 };
 class btnFadeOutIn: GZLRscButton
 {
  idc = 888236;
  sizeEx = 0.029;
  x = 0.22;
  y = 0.305;
  w = 0.145;
  h = 0.031;
  colorBackgroundActive[] = {1,1,1,0.2};
  action = "[GZL_IDC_BTN_FADE , _this] call GZL_fnc_InputDirector;";
  text = "Fade Scene";
 };
 class btnMan: GZLRscButton
 {
  idc = 888239;
  style = 0;
  sizeEx = 0.028;
  x = 0.4;
  y = 0.429;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_MAN, _this] call GZL_fnc_InputDirector;";
  text = "Man";
 };
 class btnAir: GZLRscButton
 {
  idc = 888240;
  style = 0;
  sizeEx = 0.028;
  x = 0.4;
  y = 0.459;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_AIR, _this] call GZL_fnc_InputDirector;";
  text = "Air";
 };
 class btnLand: GZLRscButton
 {
  idc = 888241;
  style = 0;
  sizeEx = 0.028;
  x = 0.4;
  y = 0.489;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_LAND, _this] call GZL_fnc_InputDirector;";
  text = "Land";
 };
 class btnSea: GZLRscButton
 {
  idc = 888242;
  style = 0;
  sizeEx = 0.028;
  x = 0.4;
  y = 0.519;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_SEA, _this] call GZL_fnc_InputDirector;";
  text = "Sea";
 };
 class btnEast: GZLRscButton
 {
  idc = 888246;
  style = 0;
  sizeEx = 0.028;
  x = 0.48;
  y = 0.429;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_EAST, _this] call GZL_fnc_InputDirector;";
  text = "East";
 };
 class btnWest: GZLRscButton
 {
  idc = 888247;
  style = 0;
  sizeEx = 0.028;
  x = 0.48;
  y = 0.459;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_WEST, _this] call GZL_fnc_InputDirector;";
  text = "West";
 };
 class btnGuer: GZLRscButton
 {
  idc = 888248;
  style = 0;
  sizeEx = 0.028;
  x = 0.48;
  y = 0.489;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_GUER, _this] call GZL_fnc_InputDirector;";
  text = "Guer";
 };
 class btnCiv: GZLRscButton
 {
  idc = 888249;
  style = 0;
  sizeEx = 0.028;
  x = 0.48;
  y = 0.519;
  w = 0.06;
  h = 0.029;
  colorFocused[] = {1,1,1,0};
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {0,0,0,0};
  action = "[GZL_IDC_BTN_CIV, _this] call GZL_fnc_InputDirector;";
  text = "Civ";
 };
 class btnMore: GZLRscButton
 {
  idc = 888256;
  sizeEx = 0.029;
  x = 0.65;
  y = 0.37;
  w = 0.068;
  h = 0.035;
  colorText[] = {1,1,1,0.5};
  colorBackgroundActive[] = {1,1,1,0.2};
  action = "[GZL_IDC_BTN_MORE, _this] call GZL_fnc_InputDirector;";
  text = "More...";
 };
 class GZLRscLineVert
 {
  idc = -1;
  type = 0;
  style = 2;
  sizeEx = 0.05;
  font = "TahomaB";
  colorBackground[] = {0.85,0.85,0.85,1};
  colorText[] = {0,0,0,0};
  x = 0;
  y = 0;
  w = 0.007;
  h = 0.52;
  text = "";
 };
 class lineV1: GZLRscLineVert
 {
  x = 0.51;
  y = 0.29;
  h = 0.061;
 };
 class lineV2: GZLRscLineVert
 {
  x = 0.43;
  y = 0.351;
  h = 0.075;
 };
 class lineV3: GZLRscLineVert
 {
  x = 0.386;
  y = 0.348;
  h = 0.397;
 };
 class lineV4: GZLRscLineVert
 {
  x = 0.559;
  y = 0.42;
  h = 0.33;
 };
 class lineV5: GZLRscLineVert
 {
  x = 0.51;
  y = 0.42;
  h = 0.247;
 };
 class GZLRscLineHoriz
 {
  idc = -1;
  type = 0;
  style = 2;
  sizeEx = 0.05;
  font = "TahomaB";
  colorBackground[] = {0.85,0.85,0.85,1};
  colorText[] = {0,0,0,0};
  x = 0;
  y = 0;
  w = 0.52;
  h = 0.0075;
  text = "";
 };
 class lineBottomH: GZLRscLineHoriz
 {
  x = 0.215;
  y = 0.745;
 };
 class lineTopH: GZLRscLineHoriz
 {
  x = 0.215;
  y = 0.29;
 };
 class lineH1: GZLRscLineHoriz
 {
  x = 0.215;
  y = 0.348;
 };
 class lineH2: GZLRscLineHoriz
 {
  x = 0.386;
  y = 0.42;
  w = 0.349;
 };
 class lineH3: GZLRscLineHoriz
 {
  x = 0.215;
  y = 0.665;
 };
};
class GZL_DIALOG_CREATE
{
 idd = 823640;
 movingEnable = 0;
 controlsBackground[] = {"GZLRscCreatorBkg","bkgMovie","bkgCut"};
 objects[] = {};
 controls[] = {"lblDist","lblHeight","lblFOV","lblRange","lblAngle","lblDir","lblMovie","lblDuration","btnMain","btnMovies","txtRange","sldDist","txtDist","sldAngle","txtAngle","sldHeight","txtHeight","sldDir","txtDir","sldFOV","txtFOV","txtDuration","txtScript","btnLockSubject","btnSmooth","lstScenes","btnSaveScene","txtMovie","btnMovieNew","lstMovies","btnMovieDelete","btnMovieCopy","btnMovieSave","btnMovieClose","btnHide","btnSceneCut","lstCuts","txtCutText","lblCutDuration","txtCutDuration"};
 onUnload = "[GZL_IDD_DLG_CREATE, _this] call GZL_fnc_InputCreate;";
 class GZLRscCreatorBkg
 {
  idc = 823641;
  moving = 0;
  type = 0;
  style = 80;
  text = "";
  font = "TahomaB";
  sizeEx = 0.023;
  colorBackground[] = {0,0,0,0.5};
  colorText[] = {1,1,1,1};
  x = "SafeZoneX";
  y = "(SafeZoneY + SafeZoneH) - 0.245";
  w = "SafeZoneW";
  h = 0.25;
 };
 class bkgMovie: GZLRscCreatorBkg
 {
  idc = 823700;
  x = "SafeZoneX";
  y = "(SafeZoneY + SafeZoneH) - (0.245 * 2.02)";
  w = 0.357;
  h = 0.25;
 };
 class bkgCut: GZLRscCreatorBkg
 {
  idc = 823600;
  x = "SafeZoneX + 0.358";
  y = "(SafeZoneY + SafeZoneH) - (0.245 * 2.02)";
  w = 0.23;
  h = 0.25;
 };
 class lblRange: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.028;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.175";
  y = "(SafeZoneY + SafeZoneH) - 0.19";
  w = 0.14;
  h = 0.03;
  text = "Slider Range:";
 };
 class lblDist: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.025;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.01";
  y = "(SafeZoneY + SafeZoneH) - 0.155";
  w = 0.032;
  h = 0.02;
  text = "D/X";
 };
 class lblAngle: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.025;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.01";
  y = "(SafeZoneY + SafeZoneH) - 0.12";
  w = 0.032;
  h = 0.02;
  text = "A/Y";
 };
 class lblHeight: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.025;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.01";
  y = "(SafeZoneY + SafeZoneH) - 0.085";
  w = 0.032;
  h = 0.02;
  text = "H/Z";
 };
 class lblDir: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.025;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.01";
  y = "(SafeZoneY + SafeZoneH) - 0.049";
  w = 0.032;
  h = 0.02;
  text = "Dir";
 };
 class lblDuration: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.03;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.36";
  y = "(SafeZoneY + SafeZoneH) - 0.23";
  w = 0.13;
  h = 0.03;
  text = "Duration Secs:";
 };
 class lblFOV: GZLRscLabel
 {
  style = 0;
  sizeEx = 0.03;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.36";
  y = "(SafeZoneY + SafeZoneH) - 0.05";
  w = 0.021;
  h = 0.02;
  text = "F";
 };
 class lblCutDuration: GZLRscLabel
 {
  idc = 823603;
  style = 0;
  sizeEx = 0.03;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.364";
  y = "(SafeZoneY + SafeZoneH) - 0.447";
  w = 0.13;
  h = 0.03;
  text = "Duration Secs:";
 };
 class sldDist: GZLRscSlider
 {
  idc = 823642;
  x = "SafeZoneX + 0.05";
  y = "(SafeZoneY + SafeZoneH) - 0.152";
  w = 0.24;
  h = 0.02;
  color[] = {1,1,1,0.5};
  coloractive[] = {1,1,1,1};
  onSliderPosChanged = "[GZL_IDC_CREATE_SLD_DIST, _this] call GZL_fnc_InputCreate;";
 };
 class sldAngle: GZLRscSlider
 {
  idc = 823652;
  x = "SafeZoneX + 0.05";
  y = "(SafeZoneY + SafeZoneH) - 0.115";
  w = 0.24;
  h = 0.02;
  color[] = {1,1,1,0.5};
  coloractive[] = {1,1,1,1};
  onSliderPosChanged = "[GZL_IDC_CREATE_SLD_ANGLE, _this] call GZL_fnc_InputCreate;";
 };
 class sldHeight: GZLRscSlider
 {
  idc = 823644;
  x = "SafeZoneX + 0.05";
  y = "(SafeZoneY + SafeZoneH) - 0.083";
  w = 0.24;
  h = 0.02;
  color[] = {1,1,1,0.5};
  coloractive[] = {1,1,1,1};
  onSliderPosChanged = "[GZL_IDC_CREATE_SLD_HEIGHT, _this] call GZL_fnc_InputCreate;";
 };
 class sldDir: GZLRscSlider
 {
  idc = 823653;
  x = "SafeZoneX + 0.05";
  y = "(SafeZoneY + SafeZoneH) - 0.045";
  w = 0.24;
  h = 0.02;
  color[] = {1,1,1,0.5};
  coloractive[] = {1,1,1,1};
  onSliderPosChanged = "[GZL_IDC_CREATE_SLD_DIR, _this] call GZL_fnc_InputCreate;";
 };
 class sldFOV: GZLRscSlider
 {
  idc = 823648;
  style = 1024;
  x = "SafeZoneX + 0.385";
  y = "(SafeZoneY + SafeZoneH) - 0.045";
  w = 0.125;
  h = 0.02;
  color[] = {1,1,1,0.5};
  coloractive[] = {1,1,1,1};
  onSliderPosChanged = "[GZL_IDC_CREATE_SLD_FOV, _this] call GZL_fnc_InputCreate;";
 };
 class txtRange: GZLRscEdit
 {
  idc = 823650;
  colorText[] = {0.95,0.95,0.95,1};
  text = "0";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.3";
  y = "(SafeZoneY + SafeZoneH) - 0.19";
  w = 0.058;
  h = 0.025;
  onKeyUp = "[GZL_IDC_CREATE_TXT_RANGE, _this] call GZL_fnc_InputCreate;";
 };
 class txtDist: GZLRscEdit
 {
  idc = 823643;
  colorText[] = {0.95,0.95,0.95,1};
  text = "0";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.3";
  y = "(SafeZoneY + SafeZoneH) - 0.155";
  w = 0.058;
  h = 0.025;
  onKeyUp = "[GZL_IDC_CREATE_TXT_DIST, _this] call GZL_fnc_InputCreate;";
 };
 class txtAngle: GZLRscEdit
 {
  idc = 823655;
  colorText[] = {0.95,0.95,0.95,1};
  text = "0";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.3";
  y = "(SafeZoneY + SafeZoneH) - 0.12";
  w = 0.058;
  h = 0.025;
  onKeyUp = "[GZL_IDC_CREATE_TXT_ANGLE, _this] call GZL_fnc_InputCreate;";
 };
 class txtHeight: GZLRscEdit
 {
  idc = 823645;
  colorText[] = {0.95,0.95,0.95,1};
  text = "0";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.3";
  y = "(SafeZoneY + SafeZoneH) - 0.085";
  w = 0.058;
  h = 0.025;
  onKeyUp = "[GZL_IDC_CREATE_TXT_HEIGHT, _this] call GZL_fnc_InputCreate;";
 };
 class txtDir: GZLRscEdit
 {
  idc = 823656;
  colorText[] = {0.95,0.95,0.95,1};
  text = "0";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.3";
  y = "(SafeZoneY + SafeZoneH) - 0.05";
  w = 0.058;
  h = 0.025;
  onKeyUp = "[GZL_IDC_CREATE_TXT_DIR, _this] call GZL_fnc_InputCreate;";
 };
 class txtFOV: GZLRscEdit
 {
  idc = 823649;
  colorText[] = {0.95,0.95,0.95,1};
  text = "0";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.5245";
  y = "(SafeZoneY + SafeZoneH) - 0.05";
  w = 0.048;
  h = 0.025;
  onKeyUp = "[GZL_IDC_CREATE_TXT_FOV, _this] call GZL_fnc_InputCreate;";
 };
 class txtDuration: GZLRscEdit
 {
  idc = 823658;
  colorText[] = {0.95,0.95,0.95,1};
  style = 2;
  text = "5";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.5245";
  y = "(SafeZoneY + SafeZoneH) - 0.229";
  w = 0.048;
  h = 0.03;
  onKeyUp = "[GZL_IDC_CREATE_TXT_DUR, _this] call GZL_fnc_InputCreate;";
 };
 class txtScript: GZLRscEdit
 {
  idc = 823665;
  colorText[] = {0.75,0.75,0.75,1};
  style = 0;
  text = "Script to execute";
  sizeEx = 0.03;
  size = 0.21;
  x = "SafeZoneX + 0.37";
  y = "(SafeZoneY + SafeZoneH) - 0.19";
  w = 0.206;
  h = 0.031;
  onKeyUp = "[GZL_IDC_CREATE_TXT_SCRIPT, _this] call GZL_fnc_InputCreate;";
 };
 class txtCutDuration: GZLRscEdit
 {
  idc = 823604;
  colorText[] = {0.95,0.95,0.95,1};
  style = 2;
  text = "0";
  sizeEx = 0.025;
  size = 0.21;
  x = "SafeZoneX + 0.5235";
  y = "(SafeZoneY + SafeZoneH) - 0.446";
  w = 0.0455;
  h = 0.027;
  onKillFocus = "[GZL_IDC_CUT_TXT_DUR, _this] call GZL_fnc_InputCreate;";
 };
 class btnLockSubject: GZLRscButton
 {
  idc = 823657;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.37";
  y = "(SafeZoneY + SafeZoneH) - 0.1";
  w = 0.206;
  h = 0.035;
  colorText[] = {1,1,1,0.7};
  colorBackground[] = {1,1,1,0.15};
  colorBackgroundActive[] = {1,1,1,0.5};
  action = "[GZL_IDC_CREATE_BTN_LOCK, _this] call GZL_fnc_InputCreate;";
  text = "Lock Subject";
 };
 class btnSmooth: GZLRscButton
 {
  idc = 823664;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.37";
  y = "(SafeZoneY + SafeZoneH) - 0.140";
  w = 0.1;
  h = 0.035;
  colorText[] = {1,1,1,0.7};
  colorBackground[] = {1,1,1,0.15};
  colorBackgroundActive[] = {1,1,1,0.5};
  action = "[GZL_IDC_CREATE_BTN_SMOOTH, _this] call GZL_fnc_InputCreate;";
  text = "Smooth";
 };
 class btnSaveScene: GZLRscButton
 {
  idc = 823659;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.6";
  y = "(SafeZoneY + SafeZoneH) - 0.227";
  w = 0.15;
  h = 0.036;
  colorText[] = {1,1,1,1};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.25};
  action = "[GZL_IDC_CREATE_BTN_SAVE, _this] call GZL_fnc_InputCreate;";
  text = "Save Scene";
 };
 class btnHide: GZLRscButton
 {
  idc = 823661;
  sizeEx = 0.03;
  x = "(SafeZoneX + SafeZoneW) - 0.036";
  y = "(SafeZoneY + SafeZoneH) - 0.232";
  w = 0.025;
  h = 0.035;
  colorText[] = {1,1,1,1};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.25};
  action = "[GZL_IDC_CREATE_BTN_HIDE, _this] call GZL_fnc_InputCreate;";
  text = "X";
 };
 class btnSceneCut: GZLRscButton
 {
  idc = 823666;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.475";
  y = "(SafeZoneY + SafeZoneH) - 0.140";
  w = 0.1;
  h = 0.035;
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.15};
  action = "[GZL_IDC_CREATE_BTN_CUTS, _this] call GZL_fnc_InputCreate;";
  text = "Cuts";
 };
 class btnMain: GZLRscButton
 {
  idc = 823662;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.01";
  y = "(SafeZoneY + SafeZoneH) - 0.229";
  w = 0.13;
  h = 0.035;
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.15};
  action = "[GZL_IDC_CREATE_BTN_MAIN, _this] call GZL_fnc_InputCreate;";
  text = "Main Dialog";
 };
 class btnMovies: GZLRscButton
 {
  idc = 823663;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.15";
  y = "(SafeZoneY + SafeZoneH) - 0.229";
  w = 0.13;
  h = 0.035;
  colorText[] = {1,1,1,0.7};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.15};
  action = "[GZL_IDC_CREATE_BTN_MOVIES, _this] call GZL_fnc_InputCreate;";
  text = "Movies";
 };
 class lblMovie: GZLRscLabel
 {
  idc = 823702;
  style = 0;
  sizeEx = 0.03;
  colorText[] = {1,1,1,0.7};
  x = "SafeZoneX + 0.008";
  y = "(SafeZoneY + SafeZoneH) - 0.48";
  w = 0.065;
  h = 0.03;
  text = "Movie:";
 };
 class txtMovie: GZLRscEdit
 {
  idc = 823701;
  colorText[] = {0.95,0.95,0.95,1};
  style = 0;
  text = "";
  sizeEx = 0.03;
  size = 0.21;
  x = "SafeZoneX + 0.08";
  y = "(SafeZoneY + SafeZoneH) - 0.479";
  w = 0.19;
  h = 0.031;
 };
 class txtCutText: GZLRscEdit
 {
  idc = 823602;
  colorText[] = {0.95,0.95,0.95,1};
  style = 0;
  text = "Enter Cut Text";
  sizeEx = 0.03;
  size = 0.21;
  x = "SafeZoneX + 0.364";
  y = "(SafeZoneY + SafeZoneH) - 0.479";
  w = 0.205;
  h = 0.031;
  onKillFocus = "[GZL_IDC_CUT_TXT_TEXT, _this] call GZL_fnc_InputMovie;";
 };
 class btnMovieNew: GZLRscButton
 {
  idc = 823707;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.28";
  y = "(SafeZoneY + SafeZoneH) - 0.477";
  w = 0.063;
  h = 0.035;
  colorText[] = {1,1,1,1};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.25};
  action = "[GZL_IDC_MOVIE_BTN_NEW, _this] call GZL_fnc_InputMovie;";
  text = "New";
 };
 class btnMovieDelete: GZLRscButton
 {
  idc = 823706;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.28";
  y = "(SafeZoneY + SafeZoneH) - 0.426";
  w = 0.063;
  h = 0.035;
  colorText[] = {1,1,1,1};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.25};
  action = "[GZL_IDC_MOVIE_BTN_DEL, _this] call GZL_fnc_InputMovie;";
  text = "Del";
 };
 class btnMovieCopy: GZLRscButton
 {
  idc = 823708;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.28";
  y = "(SafeZoneY + SafeZoneH) - 0.384";
  w = 0.063;
  h = 0.035;
  colorText[] = {1,1,1,1};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.25};
  action = "[GZL_IDC_MOVIE_BTN_COPY, _this] call GZL_fnc_InputMovie;";
  text = "Copy";
 };
 class btnMovieSave: GZLRscButton
 {
  idc = 823704;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.28";
  y = "(SafeZoneY + SafeZoneH) - 0.342";
  w = 0.063;
  h = 0.035;
  colorText[] = {1,1,1,1};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.25};
  action = "[GZL_IDC_MOVIE_BTN_SAVE, _this] call GZL_fnc_InputMovie;";
  text = "Save";
 };
 class btnMovieClose: GZLRscButton
 {
  idc = 823705;
  sizeEx = 0.03;
  x = "SafeZoneX + 0.28";
  y = "(SafeZoneY + SafeZoneH) - 0.3";
  w = 0.063;
  h = 0.035;
  colorText[] = {1,1,1,1};
  colorBackgroundActive[] = {1,1,1,0.5};
  colorBackground[] = {1,1,1,0.25};
  action = "[GZL_IDC_MOVIE_BTN_CLOSE, _this] call GZL_fnc_InputMovie;";
  text = "Close";
 };
 class lstScenes: GZLRscListBox
 {
  idc = 823660;
  x = "SafeZoneX + 0.6";
  y = "(SafeZoneY + SafeZoneH) - 0.188";
  w = 0.15;
  h = 0.17;
  sizeEx = 0.029;
  rowHeight = 0.029;
  wholeHeight = "6 * 0.029";
  color[] = {1,1,1,0.7};
  colorText[] = {0.5,0.5,0.5,1};
  colorBackground[] = {1,1,1,0.2};
  colorSelect[] = {1,1,1,1};
  onLBSelChanged = "[GZL_IDC_CREATE_LST_SCENES, _this] call GZL_fnc_InputCreate;";
 };
 class lstMovies: GZLRscListBox
 {
  idc = 823703;
  x = "SafeZoneX + 0.02";
  y = "(SafeZoneY + SafeZoneH) - 0.44";
  w = 0.25;
  h = 0.1725;
  sizeEx = 0.029;
  rowHeight = 0.029;
  wholeHeight = "6 * 0.029";
  color[] = {1,1,1,0.7};
  colorText[] = {0.5,0.5,0.5,1};
  colorBackground[] = {1,1,1,0.2};
  colorSelect[] = {1,1,1,1};
  onLBSelChanged = "[GZL_IDC_MOVIE_LST_MOVIES, _this] call GZL_fnc_InputMovie;";
 };
 class lstCuts: GZLRscListBox
 {
  idc = 823601;
  x = "SafeZoneX + 0.364";
  y = "(SafeZoneY + SafeZoneH) - 0.415";
  w = 0.205;
  h = 0.15;
  sizeEx = 0.029;
  rowHeight = 0.029;
  wholeHeight = "6 * 0.029";
  color[] = {1,1,1,0.7};
  colorText[] = {0.5,0.5,0.5,1};
  colorBackground[] = {1,1,1,0.2};
  colorSelect[] = {1,1,1,1};
  onLBSelChanged = "[GZL_IDC_CUT_LST_CUTS, _this] call GZL_fnc_InputCreate;";
 };
};
class GZL_DIALOG_MOUSE
{
 idd = 823800;
 movingEnable = 0;
 controlsBackground[] = {"mouseHandler"};
 objects[] = {};
 controls[] = {};
 onUnload = "[GZL_IDC_DLG_MOUSE, _this] call GZL_fnc_InputCreate;";
 class RscControlsGroup
 {
  type = 15;
  idc = -1;
  style = 0;
  x = 0;
  y = 0;
  w = 1;
  h = 1;
  class ScrollBar
  {
   color[] = {0,0,0,1};
   colorActive[] = {1,0,0,1};
   colorDisabled[] = {0.35,0.35,0.35,1};
   thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
   arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
   arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
   border = "\ca\ui\data\ui_border_scroll_ca.paa";
  };
  class VScrollbar
  {
   color[] = {1,1,1,1};
   width = 0.021;
   autoScrollRewind = 0;
   autoScrollDelay = 0;
   autoScrollSpeed = 0;
  };
  class HScrollbar
  {
   color[] = {1,1,1,1};
   height = 0.028;
   autoScrollRewind = 0;
   autoScrollDelay = 0;
   autoScrollSpeed = 0;
  };
  class Controls{};
 };
 class mouseHandler: RscControlsGroup
 {
  onMouseHolding = "[0,_this] call GZL_fnc_InputCreate;";
  onMouseButtonDown = "[1,_this] call GZL_fnc_InputCreate;";
  onMouseButtonUp = "[2,_this] call GZL_fnc_InputCreate;";
  onMouseZChanged = "[3,_this] call GZL_fnc_InputCreate;";
  onMouseEnter = "[4,_this] call GZL_fnc_InputCreate;";
  idc = 823801;
  x = 0.0;
  y = 0.0;
  w = 1.0;
  h = 1.0;
  colorBackground[] = {0.2,0.0,0.0,0.0};
 };
};
class GZL_DIALOG_MUSIC
{
 idd = "GZL_IDD_DLG_MUSIC";
 movingEnable = 1;
 controlsBackground[] = {};
 objects[] = {"bkgMusicList"};
 controls[] = {};
 onUnload = "[GZL_IDC_DLG_MUSIC, _this] call GZL_fnc_InputCreate;";
 class bkgMusicList
 {
  idc = -1;
  moving = 1;
  type = 0;
  style = 80;
  text = "";
  font = "TahomaB";
  sizeEx = 0.023;
  colorBackground[] = {0,0,0,0.4};
  colorText[] = {1,1,1,1};
  x = 0.3;
  y = 0.3;
  w = 0.4;
  h = 0.4;
 };
};
//};
