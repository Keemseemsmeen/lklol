//shroom

_base = _this select 0;

_crate1 = "#particlesource" createVehicleLocal position _base;
_crate2 = "#particlesource" createVehicleLocal position _base;
_crate3 = "#particlesource" createVehicleLocal position _base;
_crate3b = "#particlesource" createVehicleLocal position _base;
_crate3c = "#particlesource" createVehicleLocal position _base;

		
		_pos = position _base;
		NukePos setPos _pos;
		_nuke = "Barrel4" createVehicleLocal _pos;
		_nuke setpos [_pos select 0,_pos select 1,(_pos select 2)+500];

		
		//missile
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\blesk1.p3d", 8, 1, 8], "", "spaceObject", 1, 1, [0, 0, 0], [0, 0, -20], 0, 11, 6.9, 0.075, [0.15, 1, 0.15], [[0.2, 0.2, 1, 1], [0.0, 0.0, 1, 0.5]], [0.08], 1, 0, "", "", _nuke];
		_crate3b setDropInterval 0.002;
		sleep 5;
		playSound "r_incoming";
		sleep 5;
		_end1 = "Bo_GBU12_LGB" createVehicle ( getPos scalarTower98b);
		_end1 setPos [(getpos scalarTower98b) select 0 , (getpos scalarTower98b) select 1, ((getpos scalarTower98b) select 2) +5];
		
		
// Destroy any objects that are local to the client machine.	
_blast = 350;

sleep 0.5;
_obj = nearestObjects [_pos,["AllVehicles","Static","Thing"],_blast];	

{ { _x setDammage 1 } forEach crew _x; _x setdammage 1} forEach _obj;	
		
		
		
		
		// edit by psycho ///////////////////////////////////////////////////////
		if(player distance _nuke < 1500) then
		{
		"BIS_NuclearExplosion" execVM "\loki_lost_key\loki_scripts\scalar\bis_ew_nuke.sqf";
		"BIS_Earthquake" execVM "\loki_lost_key\loki_scripts\scalar\bis_ew_eq.sqf";
		};
		////////////////////////////////////////////////////////////////////////
		
		//First dome
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [70.25, 70.25, 0], [10.175, 10.175, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 4, 8], "", "Billboard", 1, 2.5, [0, 0, 0], [0, 0, -20], 0, 88, 24.9, 0.075, [100], [[1, 1, 1, 1], [1, 1, 1, 0.7], [1, 1, 1, 0], [1, 1, 1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		_crate3b setDropInterval 0.003;	
		//sleep 2.0;
		
		
		_i = -20;		
		while {_i <= 200} do
		{
			if(_i == 0) then 
			{		
				if(player distance _nuke < 1500) then
				{
					//0 fadeSound 0;
					//0 fadeRadio 0;
					titleCut ["","WHITE OUT", 0];
					deletevehicle scalarTower98;
					deletevehicle scalarTower98a;
					deletevehicle scalarTower98b;
					sleep 2.0;
					titleCut ["","WHITE IN", 0];
					//5 fadeSound 0.5;
					playSound "explo_large";
					//5 fadeRadio 0.5;
				};
			};
			//_crate3b setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, _i], [0, 0, 4], 0, 88, 24.9, 0.075, [400], [[1, 1, 1, 1], [1, 1, 1, 0.7], [0, 0, 1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
			//sleep 0.001;
			_i = _i +1;
			
			if(_i == 100) then 
			{
				//Light stalk
				//_crate2 setParticleCircle [10, [0, 0, 0]];
				//_crate2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				//_crate2 setParticleParams [["\Ca\Data\ParrticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[1, 1 , 1, 1], [1, 1, 1, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
				//_crate2 setDropInterval 0.01;				
			};
			
			
	};
		
		
		// rings
		//_crate3 setParticleCircle [0, [0, 0, 0]];
		//_crate3 setParticleRandom [0, [0.25, 0.25, 0], [80.175, 80.175, 0], 0, 0.25, [0.3, 0.3, 0, 0.9], 0, 0];
		//_crate3 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, 110], [0, 0, 0], 0, 8.8, 6.9, 0.075, [10, 5, 1], [[1, 1, 1, 0], [1, 1, 1, 0], [1, 1, 1, 0], [0, 0, 1, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		//_crate3 setDropInterval 0.001;	
		//sleep 1;
		//stalk to orange
		//_crate2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 10.1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0.3, 0.1, 0, 1], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		//sleep 5;
		//rings to orange
		//_crate3 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, 110], [0, 0, 0], 0, 8.8, 6.9, 0.075, [10, 5, 1], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0.3, 0.1, 0, 1], [0, 0, 0, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		//top to orange
		//_crate3b setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 6.5, [0, 0, 200], [0, 0, 4], 0, 38, 24.9, 0.075, [400], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		//Dark stalk
		_crate3c setParticleCircle [10, [0, 0, 0]];
		_crate3c setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3c setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 10.1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[1, 1, 1, 1], [0, 0, 0, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate3c setDropInterval 0.02;
		//sleep 8;
		//Topplum
		//_crate1 setParticleCircle [0, [0, 0, 0]];
                //_crate1 setParticleRandom [0, [10.25, 10.25, 0], [60.0, 60.0, -3], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		//_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 300], [0, 0, 0], 0, 8.7, 2.1, 0.075, [5, 10, 5], [[0.1, 0.1, 0.1, 0.4], [0.5, 0.5, 0.5, 0.2], [0.9, 0.9, 0.9, 0]], [0.01, 0.01, 0.01], 1, 0, "", "", XXXOBJECTXXX];
		//_crate1 setDropInterval 0.003;	
		//top big
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 200], [0, 0, 4], 0, 38, 24.9, 0.075, [50], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 0.5], [0.3, 0.3, 0.1, 0.2], [1, 1, 0.1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		sleep 120.0;

deletevehicle _crate1;
deletevehicle _crate2;
deletevehicle _crate3;
deletevehicle _crate3c;
sleep 10;
deletevehicle _crate3b;
deletevehicle _base;
