waitUntil {player == player};
playSound "Mission_Intro_Extended"; 

disableSerialization;

enableRadio false;
showCinemaBorder true;


"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 15;

_camera = "camera" camCreate [(position player select 0) - 1400, (position player select 1) - 4200, 33];
_camera camSetTarget [(position player select 0), (position player select 1) , 1.5];
_camera camSetFov 0.7;
_camera cameraEffect ["INTERNAL", "Back"];
_camera camCommit 0;
waitUntil {camCommitted _camera};


_camera camSetTarget player;
_camera camSetPos [(position player select 0), (position player select 1) , 33];
_camera camCommit 169;


[]spawn //BOMBS
{
	Sleep 3;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb1);
	_bomb setVelocity [2, 4, -500];
	Sleep 5 + random 7;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb2);
	_bomb setVelocity [10, 15, -500];
	Sleep 9 + random 9;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb3);
	_bomb setVelocity [random 20, random 5, -500];
	Sleep 9 + random 11;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb4);
	_bomb setVelocity [0, 0, -500];
	Sleep 11 + random 9;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb5);
	_bomb setVelocity [2, 4, -500];
	Sleep 1 + random 7;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb6);
	_bomb setVelocity [10, 15, -500];
	Sleep 3 + random 5;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb7);
	_bomb setVelocity [random 20, random 5, -500];
	Sleep 8 + random 1;
	_bomb = "Bo_GBU12_LGB" createVehicle (getPosASL Ext_Intro_Bomb8);
	_bomb setVelocity [0, 0, -500];
	
};


call fncYNH_intro_picker;

if (daytime > 18.00 || daytime < 4.25) then {

sleep 32;
titlersc ["intro1","plain"];

sleep 7;
titlersc ["intro2","plain"];


} else {

sleep 32;
titlersc ["intro1a","plain"];

sleep 7;
titlersc ["intro2a","plain"];

};

deleteVehicle happyTrigger1;
deleteVehicle happyTrigger1_1;

waitUntil {camCommitted _camera};
player cameraEffect ["terminate","back"];
camDestroy _camera;

closeDialog 0;

enableRadio true;
"dynamicBlur" ppEffectEnable false;







