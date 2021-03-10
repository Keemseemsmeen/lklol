_sPos = _this select 0;

onMapSingleClick "";

HINT format ["impact in 5 seconds..."];

_exec = true;

_round = "bo_gbu12_lgb" createVehicle [0,0];


_burstA = "G_40mm_HE" createVehicle [_sPos select 0, _sPos select 1, 3000];
_burstAd = "weaponHolder" createvehicle [_sPos select 0, _sPos select 1, 3010];


waitUntil {!(isNull _round)};
_round setPos [_sPos select 0,_sPos select 1,1000];
_round setVelocity [0,0,0];

	while {_exec} do
	{
		_round setPos [_sPos select 0, _sPos select 1, getPos _round select 2];
		_round setVelocity [0,0,-300];
		sleep 0.1;
		if (!(alive _round)) then {_exec = false;};
		if ((getPos _round select 2) < 40) then 
		{
			_exec = false;
			deleteVehicle _round;				
			{_x setPos [_sPos select 0, _sPos select 1, 20]} forEach [_burstA, _burstAd];
			sleep 0.8;
			deleteVehicle _burstAd;
			
			_c = "bo_gbu12_lgb" createVehicle [_sPos select 0, _sPos select 1, 1000];				
			_n = "SH_122_he" createVehicle [(_sPos select 0) + 15, _sPos select 1, 1000];
			_s = "SH_122_he" createVehicle [(_sPos select 0) - 15, _sPos select 1, 1000];
			_e = "SH_122_he" createVehicle [_sPos select 0, (_sPos select 1) + 15, 1000];
			_w = "SH_122_he" createVehicle [_sPos select 0, (_sPos select 1) - 15, 1000];
			_ne = "SH_122_he" createVehicle [(_sPos select 0) + 10, (_sPos select 1) + 10, 1000];
			_nw = "SH_122_he" createVehicle [(_sPos select 0) - 10, (_sPos select 1) + 10, 1000];
			_se = "SH_122_he" createVehicle [(_sPos select 0) + 10, (_sPos select 1) - 10, 1000];
			_sw = "SH_122_he" createVehicle [(_sPos select 0) - 10, (_sPos select 1) - 10, 1000];
			_c setPos [_sPos select 0, _sPos select 1, -0.05];
			_n setPos [(_sPos select 0) + 15, _sPos select 1, -0.05];
			_s setPos [(_sPos select 0) - 15, _sPos select 1, -0.05];
			_e setPos [_sPos select 0, (_sPos select 1) + 15, -0.05];
			_w setPos [_sPos select 0, (_sPos select 1) - 15, -0.05];
			_ne setPos [(_sPos select 0) + 10, (_sPos select 1) + 10, -0.05];
			_nw setPos [(_sPos select 0) - 10, (_sPos select 1) + 10, -0.05];
			_se setPos [(_sPos select 0) + 10, (_sPos select 1) - 10, -0.05];
			_sw setPos [(_sPos select 0) - 10, (_sPos select 1) - 10, -0.05];

			compile (format ["{ _x setDammage 1 } forEach (nearestObjects [%1,[],70])", _sPos]);		
		};
	};
		
		
		
hint "fab finished.....";