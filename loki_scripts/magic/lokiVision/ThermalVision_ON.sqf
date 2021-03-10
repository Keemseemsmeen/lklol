private ["Thermal","Thermal_Trg","Thermal_Units"];

Thermal = true;
_TriggerSize =8000;
_WhileLoopTime = 0.05;
(vehicle player) addaction["Normal Vision","\loki_lost_key\loki_scripts\magic\lokiVision\ThermalVision_OFF.sqs"];
//Set Black & White
setaperture 0.49;	

//Set Time of day to night

_now = date;

_DawnTime = 4;
_DuskTime = 20;
_SkippedTime = 0;

if ((daytime > _DawnTime) && (daytime < _DuskTime)) then
{
	_SkippedTime = (24-daytime);
	skiptime _SkippedTime;
	setDate [1999,12,22,1,59];

};

//Create Trigger to detect units around player
Thermal_Trg = createTrigger ["EmptyDetector", getpos vehicle player];
Thermal_Trg setTriggerActivation ["ANY", "PRESENT", true];
Thermal_Trg setTriggerArea [_TriggerSize, _TriggerSize, 0, false];
Thermal_Trg setTriggerStatements ["this", "", ""];
sleep 0.05;

[Thermal_Trg] execVM "\loki_lost_key\loki_scripts\magic\lokiVision\MoveTrig.sqf";

Thermal_Units = [];
while {(Alive Player) && Thermal} do
{
	_TrgUnits = 	[];
	_NewUnits = 	[];
	_MissingUnits = 	[];
	_TrgUnits = _TrgUnits + list Thermal_Trg;
	_TrgUnits = _TrgUnits - [vehicle Player];
	_NewUnits = _TrgUnits - Thermal_Units;
	_MissingUnits = Thermal_Units - _TrgUnits;

	for[{_i=0},{_i < count _NewUnits},{_i=_i+1}] do
	{
		_TempUnit = _NewUnits select _i;
		if (not((TypeOf _TempUnit) iskindof "LaserTarget")) then
		{
			Thermal_Units = Thermal_Units + [_TempUnit];
			[_TempUnit] execVM "\loki_lost_key\loki_scripts\magic\lokiVision\Thermal_Unit.sqf";			
			[_TempUnit] execVM "\loki_lost_key\loki_scripts\magic\lokiVision\Thermal_Unit_Light.sqf";
		};
	};

		for[{_i=0},{_i < count _MissingUnits},{_i=_i+1}] do
	{
		_TempUnit = _MissingUnits select _i;
		Thermal_Units = Thermal_Units - [_TempUnit];
	};
	
	sleep _WhileLoopTime;
//	hint format["Thermal Unit Count: %1",count Thermal_Units];
};

deletevehicle Thermal_Trg;

if (_SkippedTime != 0) then
{
	setdate _now;

	
};
setaperture -1;
exit;

