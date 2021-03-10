
_duration = 0.5;
_unit = _this select 0;
//player sidechat format["Object found: %1",_unit];

_ThermalParticle = compile preprocessFile "\loki_lost_key\loki_scripts\magic\lokivision\ThermalParticle.sqf";
while {(Alive Player) && Thermal && (_unit in Thermal_Units)} do
{
	[_unit,_duration] call _ThermalParticle;
	sleep _duration;
};
//player sidechat format["Object lost: %1",_unit];
