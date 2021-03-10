#include "defs.hpp"
#define GET_DISPLAY (uiNameSpace getVariable "loki_debug_hint")
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
private ["_cam","_lastpos","_dir","_vel","_bullet"];
_veh = _this select 0;
_ammo = _this select 4;
if ((count _this)==7) then {
	_bullet = _this select 6;
}else{
	_bullet = nearestObject [_veh, _ammo];
};
if (loki_get(TRACKING)or(isNull _bullet)) exitWith {};
loki_set(TRACKING,true);
_interrupt = (findDisplay 46) displayAddEventHandler ["KeyDown", "loki_logic setVariable [""TRACKING"",false];_this set [0,nil];true"];
sleep .01;
_lastpos = getPos _bullet;
showCinemaBorder false;
_cam = "camera" camCreate getPosASL _veh;
_cam cameraeffect ["internal", "back"];
_cam camSetTarget _bullet;
_cam camcommit 0.1;
_startpos = getPos _bullet;
sleep .01;
while {!(isNull _bullet)&&(loki_get(TRACKING))} do {
	_dir = getDir _bullet;
	_vel = velocity _bullet;
	_cam camsetpos _lastpos;
	_cam camcommit 0.1;
	cutRsc ["loki_debug_hint","PLAIN"];
	GET_CTRL(loki_hint_text_IDC) ctrlSetText format ["%1",_ammo];
	GET_CTRL(loki_hint_text2_IDC) ctrlSetText format ["Speed: %1",round(_vel distance [0,0,0])];
	_lastpos = getPos _bullet;
	sleep 0.01;
};

if (((_startpos distance _lastpos)>700)&&(loki_get(TRACKING))) then {
	_cam camsetpos [(_lastpos select 0) - 200*sin(_dir), (_lastpos select 1)-200*cos(_dir), (_lastpos select 2) + sin(45)*200]; 
	_cam camcommit 5;
	_cam camSetTarget _lastpos;
	_endTime = time + 5;
	while {loki_get(TRACKING)&&(time<_endtime)} do {sleep .1};
};

_cam cameraeffect ["terminate", "back"]; 
camdestroy _cam;
loki_set(TRACKING,false);
(findDisplay 46) displayRemoveEventHandler ["KeyDown",_interrupt];