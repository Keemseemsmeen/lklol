// Create and position ladder
// Build 008
private ["_who","_params","_ladparam","_ladtype","_lad","_laction1","_laction2","_laction3","_zvector","_dist"];

VFladderplaced = 0;
VFladderactive = 1;
_params = _this select 3;
_who = player;
_ladparam = _params select 1;
_dist = 2;

IF (_ladparam == 0) THEN {_ladtype = "Land_ladder_half"};
IF (_ladparam == 1) THEN {_ladtype = "Land_ladder"};

_lad = _ladtype createVehicle [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist)];
_laction1 = _who addAction ["Drop Ladder","\loki_lost_key\VFladder\lad_placed.sqf"];
WHILE {VFladderplaced == 0} DO
{
	_zvector = ((_who weaponDirection (currentWeapon _who)) select 2) * 3 - 1;
	_lad setposATL [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist), (getposATL _who select 2) + _zvector];
	_lad setDir (getDir _who);
	sleep 0.05;
};
_who removeAction _laction1;

_laction2 = _lad addAction ["Flip ladder","\loki_lost_key\VFladder\lad_flip.sqf",_lad,0,false];
_laction3 = _lad addAction ["Remove ladder","\loki_lost_key\VFladder\lad_remove.sqf",_lad,0,false];
_lad addAction ["Raise ladder","\loki_lost_key\VFladder\lad_higher.sqf"];
_lad addAction ["Lower ladder","\loki_lost_key\VFladder\lad_lower.sqf"];
sleep 60;
// After 60 sec, remove flip and removal, just keep raise and lower
_lad removeAction _laction2;
_lad removeAction _laction3;
