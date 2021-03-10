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


// Small explosion, to ignite.
_burstA = "G_40mm_HE" createVehicle [_pos select 0, _pos select 1, 30];
_burstAd = "weaponHolder" createVehicle [_pos select 0, _pos select 1, 30];
// Force the created grenade and the weaponholder to collide.
_burstAd setPos [_pos select 0, _pos select 1, 30];

//-------------------------------------------------------------------------------------------------------------
// Explosion Effects 

_pos = getpos _burstA; // Position of the explosion

_drop1 = "\Ca\Data\ParticleEffects\RocketSmoke\RocketSmoke";
_drop2 = "\ca\data\cl_exp";  // <- Explosion like particle class
_maxspd = 20;
_mass  = 1.275;
_vol   = 1.0;
_rubb  = 1;
_size1  = [6,15,22,30,45,60];
_size2  = [10];

_numdrops = 30;

for [{_i = 0},{_i < _numdrops},{_i = _i + 1}] do
{
   _angh = random 359;
   _angv = (random 180) - 90;
   _rad  = 20 + random _maxspd;


   _radv = abs(_rad * sin(_angv));
   _radh = abs(_rad * cos(_angv));
   _vel = [sin(_angh)*_radh, cos(_angh)*_radh, sin(_angv)*_radv];
   drop [_drop1, "", "Billboard", 1, 15, _pos, _vel, 0.5, _mass, _vol, _rubb/2, _size1, [[1,1,1,0.6],[1,1,1,0.5],[1,1,1,0.4],[1,1,1,0.3],[1,1,1,0.2],[1,1,1,0.1],[1,1,1,0]], [0,1,0], 5, 0.05, "", "", ""];
   _vel = [sin(_angh)*_radh, cos(_angh)*_radh, sin(_angv)*_radv];
   drop [_drop2, "", "Billboard", 1, 3.0, _pos, _vel, 0.5, _mass, _vol, _rubb/1.5, _size2, [[1,0.5,0,0.6],[1,1,1,0.5],[1,1,1,0.4],[1,1,1,0.3],[1,1,1,0.2],[1,1,1,0.1],[1,1,1,0]], [0,1,0], 5, 0.05, "", "", ""];
};

//--------------------------------------------------------------------------------------------------------------


_expectedtime = time;

//sleep 2;

for [{ _i = -(_length / 2) }, {_i < (_length / 2) }, { _i = _i + (1 / _shellsPerMetre) }] do
{
	// Horizontal deviation. This is a more linear spread than
	// (random 80) - (random 80), which has most bombs nearer the centre line.
	_rnd = (random _width) - (_width / 2); 
	
	_round = "G_40mm_HE" createVehicle [(_Pos select 0) + (_i * sin _dir) + (_rnd * cos _dir), (_Pos select 1) + (_i * cos _dir) + (_rnd * sin _dir), (_Pos select 2) + 200];
	
	_round setVelocity [0, 0, -300];
	
	_expectedtime = _expectedtime + _timePerShell;
	if (_expectedtime > time) then
	{
		sleep (_expectedtime - time);
	};
deleteVehicle _burstAd;	
};