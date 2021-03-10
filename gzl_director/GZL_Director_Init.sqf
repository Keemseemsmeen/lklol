//============================================================================================================================================
// ToDo:
// director - Add extra missile classes
// director - create shaky cam
// director - provide for use of blur and color effects
//
// create - Add move with subject to create scene
// create - Add option for 'bulldozer' controls ?
//
//
//============================================================================================================================================

if ( !isNil "GZL_DIRECTOR_INIT" )
then { [] spawn GZL_Dialog_Director; }
else {	
//============================================================================================================================================
// Dialog IDC's
//============================================================================================================================================
// DIRECTOR	
	GZL_IDD_DLG_DIRECTOR = 		888230;
	GZL_IDC_LBL_TITLE = 		888231;
	GZL_IDC_BTN_ACTION = 		888232;
	GZL_IDC_BTN_CUT = 			888233;
	GZL_IDC_BTN_CLOSE = 		888234;
	GZL_IDC_SLD_SUBJECT_BIAS = 	888235;
	GZL_IDC_BTN_FADE = 			888236;
	GZL_IDC_LBL_VERSION = 		888237;
	GZL_IDC_LST_SCENES = 		888238;
	GZL_IDC_BTN_MAN	=			888239;
	GZL_IDC_BTN_AIR = 			888240;
	GZL_IDC_BTN_LAND = 			888241;
	GZL_IDC_BTN_SEA = 			888242;
	GZL_IDC_SLD_ACCTIME =		888243;
	GZL_IDC_TXT_ACCTIME =		888244;
	GZL_IDC_BTN_EAST =			888246;
	GZL_IDC_BTN_WEST =			888247;
	GZL_IDC_BTN_GUER =			888248;
	GZL_IDC_BTN_CIV	=			888249;
	GZL_IDC_TXT_SCENE_LENGTH = 	888250;
	GZL_IDC_BACKGROUND =		888251;	

	GZL_IDC_SLD_PRELOAD =		888253;
	GZL_IDC_LST_VEHICLES =		888254;
	GZL_IDC_BKG_MUSIC =			888255;
	GZL_IDC_BTN_MORE	=		888256;
	
// MOUSE	
	GZL_IDD_DLG_MOUSE =			823640;
	GZL_IDC_MOUSE_HANDLER =		823641;
	
// CREATE
	GZL_IDD_DLG_CREATE	=			823640;
	GZL_IDC_CREATE_BKG	=			823641;
	GZL_IDC_CREATE_SLD_DIST = 		823642;
	GZL_IDC_CREATE_TXT_DIST =		823643;
	GZL_IDC_CREATE_SLD_HEIGHT =		823644;
	GZL_IDC_CREATE_TXT_HEIGHT =		823645;
	GZL_IDC_CREATE_SLD_POSZ =		823646;
	GZL_IDC_CREATE_TXT_POSZ =		823647;
	GZL_IDC_CREATE_SLD_FOV =		823648;
	GZL_IDC_CREATE_TXT_FOV =		823649;
	GZL_IDC_CREATE_TXT_RANGE =		823650;
	GZL_IDC_CREATE_SLD_DIR = 		823651;
	GZL_IDC_CREATE_SLD_ANGLE =		823652;
	GZL_IDC_CREATE_SLD_DIR =		823653;
	GZL_IDC_CREATE_TXT_DIR =		823654;
	GZL_IDC_CREATE_TXT_ANGLE =		823655;
	GZL_IDC_CREATE_TXT_DIR =		823656;
	GZL_IDC_CREATE_BTN_LOCK =		823657;
	GZL_IDC_CREATE_TXT_DUR =		823658;
	GZL_IDC_CREATE_BTN_SAVE =		823659;
	GZL_IDC_CREATE_LST_SCENES =		823660;
	GZL_IDC_CREATE_BTN_HIDE =		823661;
	GZL_IDC_CREATE_BTN_MAIN =		823662;
	GZL_IDC_CREATE_BTN_MOVIES =		823663;
	GZL_IDC_CREATE_BTN_SMOOTH = 	823664;
	GZL_IDC_CREATE_TXT_SCRIPT =		823665;
	GZL_IDC_CREATE_BTN_CUTS =		823666;

	GZL_IDC_MOVIE_BKG =			823700;
	GZL_IDC_MOVIE_TXT_TITLE =	823701;
	GZL_IDC_MOVIE_LBL_TITLE =	823702;
	GZL_IDC_MOVIE_LST_MOVIES =	823703;
	GZL_IDC_MOVIE_BTN_SAVE =	823704;
	GZL_IDC_MOVIE_BTN_CLOSE =	823705;
	GZL_IDC_MOVIE_BTN_DEL = 	823706;
	GZL_IDC_MOVIE_BTN_NEW =		823707;
	GZL_IDC_MOVIE_BTN_COPY =	823708;

	GZL_IDC_CUT_BKG =		823600;
	GZL_IDC_CUT_LST_CUTS =	823601;
	GZL_IDC_CUT_TXT_TEXT =	823602;
	GZL_IDC_CUT_LBL_DUR = 	823603;
	GZL_IDC_CUT_TXT_DUR = 	823604;
//============================================================================================================================================
// Global Vars
//============================================================================================================================================
	GZL_DIRECTOR_INIT = false;
	GZL_DIRECTOR_VERSION = "0.2 (BETA)";
	GZL_DIRECTOR_ACTIVE = false;
	GZL_DIRECTOR_EXIT = false;
	
	GZL_CREATE_ACTIVE = false;
	GZL_MISSILE_ACTIVE = false;
	
	GZL_CAM_SWITCH = false;
	GZL_CAM_PRELOAD = 2;

	GZL_SCENES = ["[Create]","Stationary Pan","Orbit Subject","Follow Subject","Fly By","First Person"];
	GZL_SCENE_MASK = [false,true,true,true,true,true];
	GZL_SCENE_ACTIVE = false;
	GZL_SCENE_SKIP = false;
	GZL_SCENE_EXTEND = false;
	GZL_SCENE_STOP = false;
	GZL_SCENE_FADE = true;
	GZL_SCENE_LENGTH = 10;
	GZL_SLIDER_RANGE = 50;
	
	GZL_SCENE_DEFAULT = ["Scene1",GZL_SCENE_LENGTH,objNull,true,1,0,1,0,0.7,"",true,"[NONE]","",0];
	GZL_SCENE_DATA = + GZL_SCENE_DEFAULT;
	GZL_SCENE_CUT_TYPE = ["[NONE]","PLAIN", "PLAIN DOWN", "BLACK", "BLACK FADED", "BLACK OUT", "BLACK IN", "WHITE OUT","WHITE IN"];
	GZL_MOVIE_DATA = []; //[[gzl_scene_data]]
	GZL_MOVIES = []; //[name,[gzl_movie_data]]
	
	GZL_VEHICLE_MASK = ["Air","LandVehicle","Ship","Man"];
	GZL_SIDE_MASK = ["EAST","WEST","GUER","CIV"];
	GZL_SUBJECT_USER = objNull;
	GZL_SUBJECT_HOLD = false;
	GZL_SUBJECT_BIAS = 0.5;
	GZL_SUBJECTS = [];
	GZL_SUBJECT = [objNull,0];

	GZL_THROTTLE_FACTOR = 20000;
	GZL_THROTTLE = GZL_THROTTLE_FACTOR;	
	GZL_ACCTIME = 1.0;
	GZL_SLEEP = 0.001;
	GZL_CAM_STEP = 0.22;
	GZL_PLAYER = player; //need this since we lose the 'real' player when switching cams to units
	
// load user settings and assign to global vars	
	#include "\userconfig\GZL\GZL_Director_config.hpp"
	GZL_KEY_SCENE_SKIP = GZL_KEY_SKIP_SCENE;
	GZL_KEY_SCENE_HOLD = GZL_KEY_HOLD_SCENE;
	GZL_KEY_SUBJECT_HOLD = GZL_KEY_HOLD_SUBJECT;
	GZL_KEY_VIEW_TOGGLE = GZL_KEY_TOGGLE_VIEW;
	GZL_KEY_DIALOG = GZL_KEY_DIALOG_SHOW;
	GZL_DEBUG_SCENE_NAME = GZL_DEBUG_SCENE_SHOW;
//============================================================================================================================================
// Scripts and functions
//============================================================================================================================================
// Dialogs
	GZL_Dialog_Director = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Director_Dialog.sqf";
	GZL_Dialog_Create = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_Dialog.sqf";
//Functions	
	GZL_fnc_GetRandomSubject = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_GetRandomSubject.sqf";
	GZL_fnc_GetDirTo = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_GetDirTo.sqf";
	GZL_fnc_InputKey = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_InputKey.sqf";
	GZL_fnc_InputDirector = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_InputDirector.sqf";
	GZL_fnc_InputCreate = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_InputCreate.sqf";
	GZL_fnc_InputMovie = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_InputMovie.sqf";
	GZL_fnc_SetScenes = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_SetScenes.sqf";
	GZL_fnc_TrimDecimal = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_TrimDecimal.sqf";
	GZL_fnc_FillListBox = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_FillListboxWithSubjects.sqf";
	GZL_fnc_SetSlider = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_SetSlider.sqf";
	GZL_fnc_GetSubject = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_GetSubject.sqf";
	GZL_fnc_SetSubject = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_SetSubjectSelection.sqf";
	GZL_fnc_ControlsHideShow = compile preprocessfile "\loki_lost_key\GZL_Director\functions\GZL_fnc_ControlsHideShow.sqf";
//Scripts	
	GZL_Director = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Director.sqf";
	GZL_Scene_Pan = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Scene_Pan.sqf";
	GZL_Scene_Orbit = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Scene_Orbit.sqf";
	GZL_Scene_Follow = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Scene_Follow.sqf";
	GZL_Scene_Fly = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Scene_Fly.sqf";
	GZL_Scene_First = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Scene_First.sqf";	
	GZL_Scene_Missile = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Scene_Missile.sqf";	
	GZL_Create_Scene = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_Scene.sqf";
	GZL_Create_Play = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_Play.sqf";
	GZL_Create_Save = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_SaveScene.sqf";
	GZL_Create_SetScene = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_SetScene.sqf";
	GZL_Create_SetMode = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_SetMode.sqf";
	GZL_Create_SetCut = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_SetCut.sqf";
	GZL_Create_UpdateUI = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Create_UpdateUI.sqf";
	GZL_Movie_Save = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Movie_Save.sqf";
	GZL_Movie_GetMovie = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Movie_GetMovie.sqf";	
	GZL_Movie_New = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Movie_New.sqf";
	GZL_Movie_Copy = compile preprocessfile "\loki_lost_key\GZL_Director\scripts\GZL_Movie_Clipboard.sqf";
	
// Keyboard Events	
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call GZL_fnc_InputKey"];
// Init Done
	GZL_DIRECTOR_INIT = true;	
// Spawn the Director dialog
	[] spawn GZL_Dialog_Director;
};

// GZL_SCENE_DATA
// scenename	0
// duration 	1
// vehicle		2
// setTarget	3
// dist 		4
// angle		5
// height		6
// dir		7
// fov		8
// scriptName	9
// smoothMove 10
// cutType	11
// cutText	12
// cutDur		13

