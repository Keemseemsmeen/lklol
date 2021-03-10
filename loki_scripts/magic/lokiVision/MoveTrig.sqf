//MoveTrig.sqf
//Called from ThermalVision_ON.sqf
//This script will moved the indicated trigger to the position of the player
//It executes as long as Thermal is true and the player is alive
//Written by Strango


_Trig = _this select 0;

while {Thermal && (Alive Player)} do
{
	_Trig setpos (getpos vehicle Player);
	sleep 0.1;
};

exit;