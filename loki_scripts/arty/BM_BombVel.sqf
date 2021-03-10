if (!isServer) exitwith{};

_round = _this select 0;

while {alive _round} do
{
	_round setVelocity [0,0,-300];
	sleep 0.1;
};