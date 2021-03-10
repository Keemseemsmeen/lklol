_type = _this select 0;
_Pos = _this select 1;
sDir = _this select 2;



switch (_type) do
{
	case "CamelAttack":
	{
		_exec = true;
		
	hint "Pchela1T attack on the way...";
	
		_vaclavGroup = createGroup resistance;
		_plane = "Pchela1T" createVehicle [0,0,100];
		_vaclav = _vaclavGroup createUnit ["Pilot_EP1", [0,0,210], [], 0, ""];
		[_vaclav] join _vaclavGroup;
		_vaclav moveInDriver _plane;
		_vaclav setSpeedMode "FULL";
		_vaclav setBehaviour "careless";
		_vaclav setCombatMode "blue";
		_vaclav action ["ENGINEON", _plane];		
		_rnd = round (random 3);
		_velCase = 0;

		switch (_rnd) do
		{
			case 0: {_plane setPos [(_Pos select 0) + 1000, _Pos select 1, (_Pos select 2) + 300]; _plane setDir 270; _velCase = 0};
			case 1: {_plane setPos [(_Pos select 0) - 1000, _Pos select 1, (_Pos select 2) + 300]; _plane setDir 90; _velCase = 1};
			case 2: {_plane setPos [_Pos select 0, (_Pos select 1) + 1000, (_Pos select 2) + 300]; _plane setDir 180; _velCase = 2};
			case 3: {_plane setPos [_Pos select 0, (_Pos select 1) - 1000, (_Pos select 2) + 300]; _plane setDir 0; _velCase = 3};
		};


		_plane setVelocity [0,0,0];

		for [{_i = 500},{_i != 0}, {_i = _i - 1}] do
		{
			switch (_velCase) do
			{
				case 0: {_plane setVelocity [(velocity _plane select 0) - 0.2, 0, 0]};
				case 1: {_plane setVelocity [(velocity _plane select 0) + 0.2, 0, 0]};
				case 2: {_plane setVelocity [0, (velocity _plane select 1) - 0.2, 0]};
				case 3: {_plane setVelocity [0, (velocity _plane select 1) + 0.2, 0]};
			};
			sleep 0.01;
		};		
		
		_vaclav doMove _Pos;
		_h = 300;

		for [{_i = 25},{_i != 0},{_i = _i - 1}] do
		{
			_plane flyInHeight _h;
			_h = _h - 10.8;
			sleep 1;
		}; 

		sleep 5;

		PV_newObj = _plane;

		_shells = 15;
		_time = 192;
		_runOver = false;		

		while {_exec} do
		{
			if (_plane distance _Pos < 80 && !(_runOver)) then 
				{
					_runOver = true;
					_vaclav doMove [(_Pos select 0) + (400 * (sin (getDir _plane))),(_Pos select 1) + (400 * (cos (getDir _plane))),30];
				};
			if (_plane distance _Pos > 300 && (_runOver)) then {_runOver = false; _vaclav doMove _Pos};			
			if (_plane distance _Pos < 180 && _plane distance _Pos > 80 && !(_runOver)) then 
				{
					_round = "G_40mm_HE" createVehicle [(getpos _plane select 0) + (random 5 - random 5), (getpos _plane select 1) + (random 5 - random 5), (getpos _plane select 2) - 2]; 
					_round setVelocity (velocity _plane); 
					_shells = _shells - 1;					
				};
			_time = _time - 1;
			sleep 0.6;
			if ((_shells == 0) || (_time == 0) || !(alive _vaclav) || !(alive _plane)) then {_exec = false;};
		};		
		
		if ((alive _vaclav) && (canMove _plane)) then {_vaclav doMove (getMarkerPos "spawnLoc")};

		_exit =
		{
			_vaclav = _this select 0;
			_plane = _this select 1;
			sleep 60;

			deleteVehicle _vaclav;
			deleteVehicle _plane;
		};

		[_vaclav,_plane] spawn _exit;			
	};
};

