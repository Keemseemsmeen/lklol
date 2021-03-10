

_unit = _this select 0;
_duration = 0.5 + random (0.2);




//_p1 = getPos _unit;
_p1 = getPos player;

_colour = [1, 0, 0];	
_colour2 = [1, 0, 0];

_brightness = 0.005;
_brightness2 = 0.030;

_l1 = "#lightpoint";



if (_unit isKindOf "CAManBase") then

{
	
_light = _l1 createVehiclelocal [(_p1 select 0),(_p1 select 1),(_p1 select 2)+1];
_light setLightBrightness _brightness; 
_light setLightAmbient [1,0,0];
_light setLightColor _colour;
_light lightAttachObject [_unit, [0,0,1]];


}

else

{

_light = _l1 createVehiclelocal [(_p1 select 0),(_p1 select 1),(_p1 select 2)+1];
_light setLightBrightness _brightness2; 
_light setLightAmbient [1,0,0];
_light setLightColor [0.2,0,0];
_light lightAttachObject [_unit, [0,1,1]];



};



while {(Alive Player) && Thermal && (_unit in Thermal_Units)} do
{
	sleep _duration;
//	_light setLightBrightness (_brightness*sqrt(Player distance _unit));
};


if (!Alive _unit) then
{
	for[{_i=0},{_i<5000},{_i=_i+1}] do
	{
		_brightness = _brightness * 0.59;
		_light setLightBrightness _brightness;
		_brightness2 = _brightness2 * 0.59;
		_light setLightBrightness _brightness2;
		sleep 1.0; 		
	
	};
};

deleteVehicle _light;
