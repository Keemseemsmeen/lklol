
// ["Bo_GBU12_LGB","SH_122_HE",15,markerPos sZoneLocal,50,100,20] execVM "FuelBomb.sqf";

_innerBomb = _this select 0;
_outerBomb = _this select 1;
_radius = _this select 2;
_pos = _this select 3;
_blast = _this select 4;
_height = _this select 5;
_size2  = _this select 6;


hint "impact in 5 seconds...";



// Falling bomb.
_round = "Barrel4" createVehicle [0, 0, 0];
_round setPos [_pos select 0, _pos select 1, (_pos select 2) + 100];
_round2 = "Barrel1" createVehicle [0, 0, 0];
_round3 = "Barrel4" createVehicle [0, 0, 0];

waitUntil
{
	// Force bomb in straight descent.
	if (not (isNull _round)) then
	{
		_pos set [2, (getPos _round) select 2];
		_round setPos _pos;
	};
	
	(isNull _round) or ((_pos select 2) < _height);
};

deleteVehicle _round;

// Small explosion, to ignite.
_burstA = "G_40mm_HE" createVehicle [_pos select 0, _pos select 1, _height];
_burstAd = "weaponHolder" createVehicle [_pos select 0, _pos select 1, _height];
// Force the created grenade and the weaponholder to collide.
_burstAd setPos [_pos select 0, _pos select 1, _height];

//-------------------------------------------------------------------------------------------------------------
// Explosion Effects 

_pos = getpos _burstA; // Position of the explosion

_drop1 = "\Ca\Data\MissileSmoke";
_drop2 = "\ca\data\cl_exp";  // <- Explosion like particle class
_maxspd = 20;
_mass  = 1.275;
_vol   = 1.0;
_rubb  = 1;
_size1  = [6,15,22,30,45,60,70,90,120,150];
//_size2  = [120];

_numdrops = 60;

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

sleep 0.8;
deleteVehicle _burstAd;

// Centre shell.
_round = _innerBomb createVehicle [_pos select 0, _pos select 1, 1000];
_round setPos [_pos select 0, _pos select 1, -0.05];

// Ring of 8 shells.
for "_i" from 0 to 7 do
{			
	_angle = _i * 45;
	
	// Create bomb high up.
	_pos = [(_pos select 0) + (_radius * sin _angle), (_pos select 1) + (_radius * cos _angle), 1000];
	_round = _outerBomb createVehicle _pos;
	
	// Move it right to the ground, instantly.
	_pos set [2, -0.05];
	_round setPos _pos;
};

// Destroy any objects that are local to the client machine.	
sleep 0.5;
_obj = nearestObjects [_pos,["AllVehicles","Static","Thing"],_blast];	

{ { _x setDammage 1 } forEach crew _x; _x setdammage 1} forEach _obj;	


