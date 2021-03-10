// here we are again for more fun with particles in OA
//
//                                                                    By: YOURNAMEHERE
///////////////////////////////////////////////
_tower = scalarTower99;

//sleep 18;
_duration = 0.5 + random (0.2);
_brightness = 0.62;
_l1 = "#lightpoint";

_shape = "\ca\data\cl_fire";
//_shape = "\ca\data\blesk1.p3d";

//_shape2 = "\ca\data\blesk1.p3d";
_shape2 = "\ca\data\rainbow";

_AnimationName = "";
_Type = "Billboard";
_Type2 = "spaceObject";
_timer = 0.3;
_life = 1.13;
_life2 = 0.72;
_position = [0, 0, 10];
_position2 = [0, 0, 15];
_weight = 7.88;
_weight2 = 5.01;
_vol = 7.72;
_vol2 = 0.72;
_rub = 0.3;
_rub2 = 0.3;
_size = [15.5];
_size2 = [2.025];


_light = _l1 createVehiclelocal [0,0,0];
_light setLightBrightness _brightness; 
_light setLightColor _colour;
_light lightAttachObject [_tower, [0,0,18]];

_light setLightAmbient [0, 0, 0];
_red = 0;
_green = 0;
_blue = 0;
_speed = 0.5 * random 1;


_PS = "#particlesource" createVehicleLocal getpos _tower;

_PS setParticleCircle [0, [0, 0, 3]];
_PS setParticleRandom [0.02, [0.1, 0.1, 0], [1, 1, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
_PS setDropInterval 0.1;


_PS1 = "#particlesource" createVehicleLocal getpos _tower;
_PS1 setParticleCircle [0, [0, 0, 0]];
_PS1 setDropInterval 0.021;

_redSpeed = 5 + (random 5);
_greenSpeed = 5 + (random 5);
_blueSpeed = 5 + (random 5);

while {alive _tower} do
{
	_red = ((sin (time * _redSpeed)) + 1) / 2;
	_green = ((sin (time * _greenSpeed)) + 1) / 2;
	_blue = ((sin (time * _blueSpeed)) + 1) / 2;
	
	_light setLightColor [_red, _green, _blue];

	_color = [[_red, _green, _blue, 0.5], [_red, _green, _blue, 0.3], [_red, _green, _blue, 0.1]];
	
	
	_PS setParticleParams [[_shape, 8, 2, 0], "", _type, _timer, _life, _position, [0, 0, 0], 1, _weight, _vol, _rub, _size, _color, [1], 0, 0, "", "", _tower];
	_PS1 setParticleParams [[_shape2, 1, 0, 1], "", _Type2, _timer, _life2, _position2, [0, 0, 0], 7, _weight2, _vol2, _rub2, _size2, _color, [1], 0, 0, "", "", _tower];


	sleep 0.01;
};


		_end1 = "Bo_GBU12_LGB" createVehicle ( getPos _tower);
		_end1 setPos [(getpos _tower) select 0 , (getpos _tower) select 1, ((getpos _tower) select 2) +25];


//sleep 4;

_OBJ = _tower;
_PS3 = "#particlesource" createVehicleLocal getpos _OBJ;
playSound "scalarDown";
_PS3 setParticleCircle [0, [0, 0, 0]];
_PS3 setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
/*                     						 [Shape                       ,AN ,     Type     , T, L,                                               Position ,        MveVel  ,           RV, Wt, V, Rub, Size     ,    Color     ,    APhase   ,   RdmDirPrd  ,   RDI ,OT,BD, Object] */
_PS3 setParticleParams [["\ca\data\blesk1.p3d", 1, 0, 1], "", "SpaceObject", 1, 5, [0, 0, 20], [0, 0, -20], 5, 10, 1, 0.2, [0.15, 0.15], [[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 1], 1, 0, "", "", _OBJ];
_PS3 setDropInterval 0.04;


sleep 4;

if (isServer) then
{
	for "_i" from 1 to 6 do
	{
		_end1 = "Bo_GBU12_LGB" createVehicle ( getPos _tower);
		_end1 setPos [(getpos _tower) select 0 , (getpos _tower) select 1, ((getpos _tower) select 2) +25];
	};
};


_marker = createMarker ["sZoneLocal", getPos _tower ];

["Bo_GBU12_LGB","SH_122_HE",15,markerPos sZoneLocal,50,100,20] execVM "\loki_lost_key\loki_scripts\scalar\FuelBomb.sqf";

sleep 3;
deletevehicle _light;
deletevehicle _PS;
deletevehicle _PS1;
deletevehicle _PS3;
deleteMarker "sZoneLocal";


/*
Format: 
[ShapeName, AnimationName, Type, TimerPeriod, LifeTime, Position, MoveVelocity, 
RotationVelocity, Weight, Volume, Rubbing, Size, Color, AnimationPhase, RandomDirectionPeriod, 
RandomDirectionIntensity, OnTimer, BeforeDestroy, Object] 
*/

