private ["_laction1","_laction2","_ttl","_timeout"];

VFladderactive = 0;
_timeout = 300;
_ttl = _timeout;
_laction1 = _this addaction ["Create Small Ladder","\loki_lost_key\VFladder\createladder.sqf",[_this,0],0,false];
_laction2 = _this addaction ["Create Big Ladder","\loki_lost_key\VFladder\createladder.sqf",[_this,1],0,false];

// After timeout period, remove ladder actions from player menu again
WHILE {_ttl > 0} DO
{
	sleep 1;
	IF (VFladderactive == 1) THEN {_ttl = _timeout; VFladderactive = 0};
	IF (VFladderactive == 0) THEN {_ttl = _ttl - 1};
};
_this removeAction _laction1;
_this removeAction _laction2;
