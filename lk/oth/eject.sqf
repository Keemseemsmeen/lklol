if (isServer) then {
_group =  _this select 0;
_vehicle = _this select 1;

sleep 2;

{
	unassignvehicle _x;
	_x action ["EJECT", _vehicle];
	sleep 0.2;
} foreach units _group;
};