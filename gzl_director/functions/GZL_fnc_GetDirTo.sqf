private ["_pos1","_pos2","_ret"];

_pos1 = _this select 0;
_pos2 = _this select 1;

//if objects, not positions, were passed in, then get their positions
if(typename _pos1 == "OBJECT") then {_pos1 = getpos _pos1};
if(typename _pos2 == "OBJECT") then {_pos2 = getpos _pos2};

//get compass heading from _pos1 to _pos2
_ret = ((_pos2 select 0) - (_pos1 select 0)) atan2 ((_pos2 select 1) - (_pos1 select 1));
_ret = _ret % 360; //ensure return is 0-360
_ret