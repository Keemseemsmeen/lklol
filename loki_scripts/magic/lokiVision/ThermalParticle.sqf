/*
Format: [ShapeName, AnimationName, Type, TimerPeriod, LifeTime, Position, MoveVelocity, RotationVelocity, Weight, Volume, Rubbing, Size, Color, AnimationPhase, RandomDirectionPeriod, RandomDirectionIntensity, OnTimer, BeforeDestroy, Object]
*/


_OBJ = _this select 0;;
_PS = "#particlesource" createVehicleLocal getpos _OBJ;

//_shape = "\ca\data\ParticleEffects\FireAndSmokeAnim\FireAnim";
//_shape = "\Ca\Data\Cl_fired";

_shape = "\ca\data\ParticleEffects\FireAndSmokeAnim\FireAnim";
_AnimationName = "";
_Type = "Billboard";
_timer = 0.3;
_life = 0.33;
_position = [0, 0, 0];
_weight = 0.22;
_vol = 0.72;
_rub = 0.3;
_size = [1];
//_color = [[1, 0.7, 0.7, 0.5]];
_color = [ [1, 0, 0, 0.1], [1, 1, 0, 0.1], [0, 1, 1, 0.1]];



_PS setParticleCircle [0, [0, 0, 3]];
_PS setParticleRandom [0.02, [0.1, 0.1, 0], [1, 1, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
_PS setParticleParams [[_shape, 8, 2, 0], "", _type, _timer, _life, _position, [0, 0, 0.5], 1, _weight, _vol, _rub, _size, _color, [1], 0, 0, "", "", _obj];
_PS setDropInterval 0.44;