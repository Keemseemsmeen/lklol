TitleCut["", "BLACK FADED",999];

//startLoadingScreen [ localize "STR_EP1_initIntro.sqf1", "RscLoadScreenCustom"];

call fncYNH_ANN;

deletevehicle zIntro_Extended; 
deletevehicle zIntro_Extended1; 
deleteVehicle happyTrigger1;  
deleteVehicle happyTrigger1_1;

sleep 5;

DEBUGLOG "INITINTRO.SQF STARTED --- zozo";

BIS_UAVCamDone = false;
showcinemaborder false;

//_nic = [objNull, objNull, rTITLECUT, "", "BLACK FADED", 999] call RE;


//"dynamicBlur" ppEffectEnable true;
//"dynamicBlur" ppEffectAdjust [6];
//"dynamicBlur" ppEffectCommit 0;

//BIS_camera = "camera" camcreate [2634.05,3922.79,1.60];
//BIS_camera cameraeffect ["internal","back"];




//

/*
_camera camPrepareTarget [57888.25,-79633.06,-4889.60]
_camera camPreparePos [3997.48,4469.77,0.52]
_camera camPrepareFOV 0.391
_camera camCommitPrepared 0
@camCommitted _camera


BIS_camera camPrepareTarget [32089.51,98868.19,11327.06];
BIS_camera camPreparePos [3982.59,3586.04,47.59];
BIS_camera camPrepareFOV 0.800;
BIS_camera camCommitPrepared 0;
BIS_camera camCommand "Manual on";
*/
//BIS_camera = "camera" camCreate [(markerPos "mkrAAN_Start" select 0) + 300 + random 200, (markerPos "mkrAAN_Start" select 1) + 300 + random 200, 50 + random 30];
BIS_camera = "camera" camCreate [(markerPos "mkrAAN_Start" select 0), (markerPos "mkrAAN_Start" select 1), 80];
BIS_camera camPrepareTarget BIS_CAM_Target1;
BIS_camera camsettarget BIS_CAM_Target1;
BIS_camera camPrepareFOV 0.25;
BIS_camera camPreload 15;
BIS_camera camCommitPrepared 0;
BIS_camera camCommand "Manual off";
BIS_camera cameraeffect ["internal","back"];

setviewdistance 3600;

//"filmGrain" ppEffectAdjust [0.1, 1, 1, 0.1, 1, false];     
//"filmGrain" ppEffectCommit 0;     
//"filmGrain" ppEffectEnable true;

//"colorCorrections" ppEffectAdjust [1, 1.15, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 0.8, 1, 0.5],  [0.199, 0.587, 0.114, 0.0]];
//"colorCorrections" ppEffectCommit 0; 
//"colorCorrections" ppEffectEnable true;

endLoadingScreen;

/*
DEBUGLOG format ["%1: Preloading camera", "AAN"];
waituntil {preloadcamera [3997.48,4469.77,0.52]};
DEBUGLOG format ["%1: PRELOADED", "AAN"];
*/
//_xHandle = call BIS_CAMFocusMoving;

BIS_wallLight1 = "#lightpoint" createVehicle getpos BIS_light01;  
BIS_wallLight1 setLightAmbient [0,0,0];    
BIS_wallLight1 setLightColor [255/255, 64/255, 0/255];  
BIS_wallLight1 setLightBrightness 0.1; 
BIS_wallLight1 attachTo [BIS_light01,[0,-0.2,0]];

BIS_wallLight2 = "#lightpoint" createVehicle getpos BIS_light02;  
BIS_wallLight2 setLightAmbient [0,0,0];    
BIS_wallLight2 setLightColor [255/255, 255/255, 255/255];  
BIS_wallLight2 setLightBrightness 0.0; 
BIS_wallLight2 attachTo [BIS_light02,[0,-0.2,0]];


playsound ["ce0_tv_intro_N_0", true]; //andithink
sqf = ["<t size='0.7'>" + localize "STR_EP1_ce0_tv_intro_N_0" + "</t>",-1,-(safezoneH-1)/2,10,-1,0,3010] spawn bis_fnc_dynamicText;

_xHandle = [] execVM "\loki_lost_key\intro\briefing\aanTV.sqf";
CamUseNVG false;

BIS_ShowUI = "AANRibbon";

[]spawn //LIGHTS
{
	while{true} do
	{
		xx = [BIS_wallLight1, [255, 255, 255],random 6,0.2,true, 0.1] spawn BIS_TurnLightOn;
		Sleep ((random 3)+ 3);
		xx = [BIS_wallLight2, [255, 255, 255],random 3,random 0.5,true, 0.1] spawn BIS_TurnLightOn;
		Sleep ((random 3)+ 3);
	};	
};

[]spawn //BOMBS
{
	Sleep 2;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb4);
	_bomb setVelocity [2, 4, -500];
	Sleep 5 + random 18;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb2);
	_bomb setVelocity [10, 15, -500];
	Sleep 9 + random 18;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb3);
	_bomb setVelocity [random 20, random 5, -500];
	Sleep 3 + random 18;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb1);
	_bomb setVelocity [0, 0, -500];
	Sleep 6;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb4);
	_bomb setVelocity [2, 4, -500];
	Sleep 5 + random 18;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb2);
	_bomb setVelocity [10, 15, -500];
	Sleep 9 + random 18;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb3);
	_bomb setVelocity [random 20, random 5, -500];
	Sleep 3 + random 18;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL BIS_Bomb1);
	_bomb setVelocity [0, 0, -500];
	
};
//Sleep 90000;
BIS_AANEnded = false;

_t = time + 5;
WaitUntil{time > _t};

[]spawn 
{
	_nic = [objNull, objNull, rTITLECUT, "", "BLACK IN", 1] call RE;
	
	Sleep 1.5;
	[]spawn
	{
		/*"filmGrain" ppEffectAdjust [0.23, 1, 1, 0.1, 1, true];     
		"filmGrain" ppEffectCommit 0;     
		"filmGrain" ppEffectEnable true;
		Sleep 2;
		"dynamicBlur" ppEffectEnable true;  
		"dynamicBlur" ppEffectAdjust [2];  
		"dynamicBlur" ppEffectCommit 0.3; 
		Sleep 0.5;
		"dynamicBlur" ppEffectAdjust [0.5];  
		"dynamicBlur" ppEffectCommit 0.2;
		Sleep 1;
		"dynamicBlur" ppEffectAdjust [0];  
		"dynamicBlur" ppEffectCommit 1;*/
	};

	
	
	
	Sleep 16.5;
	//camUseNVG true; setAperture 4;
	/*
	DEBUGLOG format ["%1: Preloading camera", "2nd"];
	waituntil {preloadcamera [3982.59,3586.04,47.59]};
	DEBUGLOG format ["%1: Preloaded", "2nd"];
	Sleep 7.5;
	_nic = [objNull, objNull, rTITLECUT, "", "BLACK OUT", 1] call RE;
	Sleep 1.5;
	BIS_camera camPrepareTarget [32089.51,98868.19,11327.06];
	BIS_camera camPreparePos [3982.59,3586.04,47.59];
	BIS_camera camPrepareFOV 0.800;
	BIS_camera camCommitPrepared 0;
	Sleep 2.5;
	_nic = [objNull, objNull, rTITLECUT, "", "BLACK IN", 1] call RE;
	*/	

	sleep 1.5;


	BIS_camera camPrepareTarget BIS_CAM_Target2;
//	BIS_camera camPreparePos BIS_CAM_Target2;
	BIS_camera camsettarget BIS_CAM_Target2;	
	BIS_camera camPrepareFOV 0.039;
	BIS_camera camPreload 15;
	Sleep 9;
/*  
	DEBUGLOG format ["%1: Preloading camera", "Zargabad no optic"];
	waituntil {preloadcamera [4173.75,3761.03,8.71]};
	DEBUGLOG format ["%1: Preloaded", "Zargabad no optic"];
*/
	Sleep 6;
	_nic = [objNull, objNull, rTITLECUT, "", "BLACK OUT", 1] call RE;
	Sleep 1;
	
	if (daytime > 19.75 || daytime < 4.25) then { CamUseNVG true; } else {};	
	
	//setAperture 3;
	
	
	//false SetCamUseTi 1; // Camera FLIR On
	
	
	
	/*_ppColor = ppEffectCreate ["ColorCorrections", 1999];
	_ppColor ppEffectEnable true;
	_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.25], [0.2, 0.2, 0.2, 0]];
	_ppColor ppEffectCommit 0;  
	"colorCorrections" ppEffectCommit 0;  
	"colorCorrections" ppEffectEnable TRUE;  
	
	"filmGrain" ppEffectAdjust [0.3, 1, 1, 0.1, 1, true];     
	"filmGrain" ppEffectCommit 0;     
	"filmGrain" ppEffectEnable true;*/

	BIS_camera camCommitPrepared 0;
//	BIS_camera camCommand "Manual on";
	Sleep 0.5;
	[]spawn
	{
		//"filmGrain" ppEffectEnable false;
		Sleep 2;
	/*	"dynamicBlur" ppEffectEnable true;  
		"dynamicBlur" ppEffectAdjust [2];  
		"dynamicBlur" ppEffectCommit 0.3; 
		Sleep 0.5;
		"dynamicBlur" ppEffectAdjust [0.5];  
		"dynamicBlur" ppEffectCommit 0.2;
		Sleep 1;
		"dynamicBlur" ppEffectAdjust [0];  
		"dynamicBlur" ppEffectCommit 1;
		Sleep 3;
		"dynamicBlur" ppEffectEnable true;  
		"dynamicBlur" ppEffectAdjust [2];  
		"dynamicBlur" ppEffectCommit 0.3; 
		Sleep 0.5;
		"dynamicBlur" ppEffectAdjust [0.5];  
		"dynamicBlur" ppEffectCommit 0.2;
		Sleep 1;
		"dynamicBlur" ppEffectAdjust [0];  
		"dynamicBlur" ppEffectCommit 1;*/
	};
	_nic = [objNull, objNull, rTITLECUT, "", "BLACK IN", 1] call RE;
	
	Sleep 10;
//	_nic = [objNull, objNull, rTITLECUT, "", "BLACK OUT", 1] call RE;
//	_nic = [objNull, objNull, rFADEMUSIC, 1.3, 0.0, objNull] call RE;
	Sleep 1.3;
	_xHandle = execVM "\loki_lost_key\intro\briefing\UAVCamera.sqf";
	//_nic = [objNull, objNull, rFADESOUND, 5, 0.5, objNull] call RE;	
	WaitUntil{BIS_UAVCamDone};
	
	
};
[]spawn
{
	BIS_ShowUI = "HarrisUp";
	Sleep 1.5;
	playsound ["ce0_tv_intro_H_0", true]; //yesgoodmorning
	_sqf = ["<t size='0.5'>" + localize "STR_EP1_ce0_tv_intro_H_0" + "</t>",-1,-(safezoneH-1.05)/2,50,-1,0,3010] spawn bis_fnc_dynamicText;
	Sleep 23;
	playsound ["ce0_tv_intro_H_1", true]; //Takistany demanded
	_sqf = ["<t size='0.5'>" + localize "STR_EP1_ce0_tv_intro_H_1" + "</t>",-1,-(safezoneH-1.05)/2,50,-1,0,3010] spawn bis_fnc_dynamicText;
	
	Sleep 10;
	playsound ["ce0_tv_intro_H_2", true]; //justenetrerd
	_sqf = ["<t size='0.5'>" + localize "STR_EP1_ce0_tv_intro_H_2" + "</t>",-1,-(safezoneH-1.03)/2,50,-1,0,3010] spawn bis_fnc_dynamicText;

	Sleep 22;
	playsound ["ce0_tv_intro_H_3", true]; //Col MuhhamadRazim 
	_sqf = ["<t size='0.5'>" + localize "STR_EP1_ce0_tv_intro_H_3" + "</t>",-1,-(safezoneH-1.05)/2,50,-1,0,3010] spawn bis_fnc_dynamicText;

	Sleep 15;
	playsound ["ce0_tv_intro_H_4", true]; //latestreports
	_sqf = ["<t size='0.7'>" + localize "STR_EP1_ce0_tv_intro_H_4" + "</t>",-1,-(safezoneH-1.05)/2,50,-1,0,3010] spawn bis_fnc_dynamicText;
	
	Sleep 12;
	_sqf = ["<t size='0.7'>" + localize "" + "</t>",-1,-(safezoneH-1.05)/2,50,-1,0,3010] spawn bis_fnc_dynamicText;	

};

titleCut ["", "BLACK IN",5];
//"dynamicBlur" ppEffectAdjust [0.0];
//"dynamicBlur" ppEffectCommit 5;

if (isMultiplayer) then {
setViewDistance lk_ViewDistance;
};

WaitUntil{BIS_AANEnded};
sleep 1;

waitUntil {camCommitted BIS_camera};
player cameraEffect ["terminate","back"];
camDestroy BIS_camera;
//_nic = [objNull, objNull, rTITLECUT, "", "BLACK IN", 1] call RE;
titleCut ["","Black in",1];

sleep 10;

/*
deleteVehicle BIS_light01;
deleteVehicle BIS_light02;
*/
deleteVehicle BIS_UAVTarget1;
deleteVehicle BIS_UAVTarget2;
deleteVehicle BIS_UAVTarget3;
deleteVehicle BIS_CAM_Target1;
deleteVehicle BIS_CAM_Target2;







