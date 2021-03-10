//--- 03/18/2008 --- Karel Moricky (Gaia)
//--- 03/09/2010 --- Ported to EP1
//titletext ["","black in",999999];
_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["internal","back"];
bis_camera = _camera;
private["_targetUAV"];

call fncYNH_ANN;

//createdialog "rscdisplaymain";
2900 cutrsc ["RscUnitInfoUAV_gunner","plain"];

//SetCam Thermal Imaging On
//true SetCamUseTi 0;
call fncYNH_SetCamTi;

BIS_RocketFlying = false;
_targetArray = [BIS_UAVTarget1,BIS_UAVTarget2,BIS_UAVTarget3];
BIS_xLoop = (count _targetArray) - 1;						//number of iterations
while {BIS_xLoop > -1} do {
	
	bis_fov = 0.226 + random 0.2;
	bis_fov_changed = false;
	
	
	_targetUAV = _targetArray select BIS_xLoop;
	_targetUAV SetVehicleTiPars [1,0.5,0];
	//DEBUGLOG format["start Targetting: %1", _targetUAV];
	
	_movetime = 8 + random 10;
	_starttime = time;

	_tpos = position _targetUAV;
	_alt = 150 + random 20;
	_dif = 30 + random 30;
	if (random 100 > 50) then {_dif = -_dif};
	_tpos1 = [(_tpos select 0)+_dif,(_tpos select 1)-(30 + random 30),_alt];
	_tpos2 = [(_tpos select 0),(_tpos select 1)-(30 + random 30),_alt];
	_dis = _tpos1 distance _targetUAV;
	_coef = 0.00001 * _dis;

	_camera camPrepareTarget _targetUAV;
	_camera camPreparePos _tpos1;
	_camera camPrepareFOV bis_fov;
	//_camera camPrepareFocus [0,_dis / 2];
	_camera camCommitPrepared 0;
	waituntil {camCommitted _camera};
		_camera camPrepareTarget _targetUAV;
		_camera camPreparePos _tpos2;
		_camera camCommitPrepared _movetime;

	[_targetUAV,_movetime] spawn {
		private["_targetUAV"];
		BIS_RocketFlying = false;
		sleep ((_this select 1) * 4/7);
		
		
		_pos = getposasl (_this select 0);
		_x = (_pos select 0) - 0;
		_y = (_pos select 1) + 10;
		_z = (_pos select 2) + 20;
		_bomb = "Bo_GBU12_LGB" createvehicle [_x,_y,_z];
		_bomb setposasl [_x,_y,_z];
		_bomb setdir 180;
		_bomb setvectorup [0,1,-1];
		_bomb setvelocity [0,-0,-200];
		_bomb SetVehicleTiPars [1,1,1];
		BIS_RocketFlying = true;
		if (random 10 < 9) exitwith {};
		waituntil {_bomb distance (_this select 0) < 10};
		//setacctime 0.04;
		bis_camera camPrepareFov (0.15);
		bis_camera camCommitPrepared 0.02;
		waituntil {isnull _bomb};

	};
	//DEBUGLOG format["bis_fov Targetting: %1", _targetUAV];
	bis_fov spawn {
		_delay = 4;
		sleep _delay;
		
		bis_camera camPrepareFov (0.226 - random 0.1);
		bis_camera camCommitPrepared 0.3;
		_delay = 0.5 + random 0.1;
		sleep 0.5;
		bis_camera camPrepareFov (0.226);
		bis_camera camCommitPrepared 0.2;
		
	};

	//titletext ["","black in"];
	_nic = [objNull, objNull, rTITLECUT, "", "BLACK IN", 1] call RE;
	_movetime spawn{sleep (_this - 1.1); _nic = [objNull, objNull, rTITLECUT, "", "BLACK OUT", 1] call RE;};
	//DEBUGLOG format["TargettingA: %1", _targetUAV];
	while {!camCommitted _camera} do {
		_delay = 0.05 + random 0.1;
		_ranX = _dis*_coef - random (_dis*_coef*2);
		_ranY = _dis*_coef - random (_dis*_coef*2);
		_ranZ = _dis*_coef - random (_dis*_coef*2);
		
		if(alive _targetUAV) then
		{
			//DEBUGLOG format["TargettingB: %1", _targetUAV];
			_tpos = position _targetUAV;
			_alt = 150 + random 20;
			_dif = 30 + random 30;
			if (random 100 > 50) then {_dif = -_dif};
			_tpos1 = [(_tpos select 0)+_dif,(_tpos select 1)-(30 + random 30),_alt];
			_tpos2 = [(_tpos select 0),(_tpos select 1)-(30 + random 30),_alt];
			_dis = _tpos1 distance _targetUAV;
			_coef = 0.00001 * _dis;
		};
		_camera campreparetarget [(_tpos select 0)+_ranX,(_tpos select 1)+_ranY,(_tpos select 2)+_ranZ];
		_camera camcommitprepared _delay;
		sleep _delay;
	};
	BIS_xLoop = BIS_xLoop -1;
	


};
//titletext ["","black in",1];

//SetCam Thermal Imaging Off
//false SetCamUseTi 0;
call fncSetCamUseTiKilla;


2900 cutrsc ["RscUnitInfoUAV_gunner","black in",1];
closeDialog 0;



waitUntil {camCommitted _camera};
_camera cameraEffect ["terminate","back"];
camDestroy _camera;





