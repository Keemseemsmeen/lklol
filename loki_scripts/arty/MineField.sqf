_width = _this select 0; // In metres.
_length = _this select 1; // In metres.
_shells = _this select 2; // Total shells to expend.
_speed = _this select 3; // In km/h.
_Pos = _this select 4; // Centre of strike.
_dir = _this select 5;

_shellsPerMetre = _shells / _length;
_speedMps = _speed / 3.6;
_timePerShell = 1 / (_shellsPerMetre * _speedMps);

sleep 1;

hint "Here it comes...";



_expectedtime = time;

//sleep 2;

for [{ _i = -(_length / 2) }, {_i < (_length / 2) }, { _i = _i + (1 / _shellsPerMetre) }] do
{
	// Horizontal deviation. This is a more linear spread than
	// (random 80) - (random 80), which has most bombs nearer the centre line.
	_rnd = (random _width) - (_width / 2); 
	
	_round = "MineE" createVehicle [(_Pos select 0) + (_i * sin _dir) + (_rnd * cos _dir), (_Pos select 1) + (_i * cos _dir) + (_rnd * sin _dir), (_Pos select 2)];
	

	_expectedtime = _expectedtime + _timePerShell;
	if (_expectedtime > time) then
	{
		sleep (_expectedtime - time);
	};
};