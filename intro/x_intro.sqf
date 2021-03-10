
disableSerialization;


enableRadio false;
showCinemaBorder true;


"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 15;

_camera = "camera" camCreate [(position player select 0) - 1250, (position player select 1) - 3200, 300];
_camera camSetTarget [(position player select 0), (position player select 1) , 1.5];
_camera camSetFov 0.7;
_camera cameraEffect ["INTERNAL", "Back"];
_camera camCommit 7;
waitUntil {camCommitted _camera};



//call fncSetCamUseTiKilla;


_camera camSetTarget player;
_camera camSetPos [(position player select 0), (position player select 1) , 10];
_camera camCommit 67;

call fnc_loki_music_picker;

call fnc_loki_intro_picker;


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


waitUntil {camCommitted _camera};
player cameraEffect ["terminate","back"];
camDestroy _camera;


closeDialog 0;

enableRadio true;
"dynamicBlur" ppEffectEnable false;







