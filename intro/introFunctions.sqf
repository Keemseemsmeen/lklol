

// BIS add Topics Function
BIS_addTopics = 
{
	private["_speakers", "_topic"];
	_speakers = _this select 0;
	_topic = _this select 1;
	
	{
		call compile format	["
						_nic = 	[		
								objNull,
								%1, ""per"", rKBADDTOPIC, ""%2"",
								"""", """"
							] call RE
					 ",
							parseText _x, _topic
					];
	}forEach _speakers;

};

// BIS Shake the Camera Function
BIS_ShakeTheCamera = 
{
	private["_tx","_ty","_tz", "_camera"];
	_tx = (_this select 0) select 0;
	_ty = (_this select 0) select 1;
	_tz = (_this select 0) select 2;
	_steps = _this select 1;
	_camera = _this select 2;
	
	//DEBUGLOG format["_tx:%1 _ty:%2 _tz:%3 _steps:%4 ",_tx, _ty, _tz, _steps];
	
	//_steps = 42;
	for "_i" from 1 to _steps do {
		_d = 0.24 / _i;
		_camera camPrepareTarget [
			_tx+(1 - _d + random (2 * _d))*_tx,
			_ty+(1 - _d + random (2 * _d))*_ty,
			_tz+(1 - _d + random (2 * _d))*_tz
		];
		_camera camCommitPrepared 0.01;
		sleep 0.01;
	};

};

// BIS CAM Focus Moving Function
BIS_CAMFocusMoving = 
{
	BIS_CAMShakingEnabled = true;
	[]spawn
	{
		while{!isNil "BIS_camera"} do
		{
			if(BIS_CAMShakingEnabled) then
			{
				_xPos = (getpos BIS_cameraTarget select 0) + (random 90)/100;
				_zPos = (getpos BIS_cameraTarget select 1) + (random 90)/100;
				_yPos = (getpos BIS_cameraTarget select 2) + 0.8 + (random 150)/100;
				
				BIS_camera camPrepareTarget [_xPos, _zPos, _yPos];
				BIS_camera camCommitPrepared 0.8 + ((random 10)/10);
				waitUntil{camCommitted BIS_camera};
			};
		};
	};
};	

// BIS Turn Lights On Function
BIS_TurnLightOn = 
{
	//DEBUGLOG format ["BIS_TurnLightOn: Start", time];
	private["_light", "_rm", "_gm", "_bm", "_brightm", "_i", "_r", "_g", "_b", "_dt", "_time", "_greatestNr", "_mTime", "_time", "_currentBrightness"];
	private["_off", "_offTime"];
	_mTime = time;
	_light = _this select 0;		//OBJECT
	_rm = (_this select 1) select 0;	//R
	_gm = (_this select 1) select 1;	//G
	_bm = (_this select 1) select 2;	//B
	_brightm = _this select 2;		//BRIGHTNESS
	_time = _this select 3;			//time of turning on
	if((count _this) > 4) then
	{
		_off = _this select 4;
		_offTime = _this select 5;
	};
	  
		
	if(isNil "BIS_turningOnInProgress") then {BIS_turningOnInProgress = player};
	
	if(BIS_turningOnInProgress != _light) then
	{
		
		BIS_turningOnInProgress = _light;
		_r = 0; _g = 0; _b = 0;
		
		_greatestNr = [_rm,_gm,_bm] call BIS_fnc_greatestNum;
		_dt = _time/_greatestNr;
		//DEBUGLOG format ["_dt: %1", _time/_greatestNr];
		_dtime = time;
		//DEBUGLOG format ["Pocet pruchodu smyckou: %1", _greatestNr];
		//DEBUGLOG format ["zpozdeni ve smycce: %1", _dt];
		//DEBUGLOG format ["trvani => %1 x %2 = %3", _greatestNr, _dt, _greatestNr*_dt];
		_timeold = time;
		//DEBUGLOG format ["Start v %1", _timeold];
		if(_brightm > 5) then
		{
			[(_greatestNr*_dt)]spawn
			{
				_timeAll = _this select 0;
				_timeWait = (_timeAll/3); //2/3
				Sleep _timeWait;
				
				"colorCorrections" ppEffectAdjust [1, 3.9, 0.1, [0.0, 0.0, 0.0, 0.0], [1, 1, 0.7, 0.65],  [0.199, 0.587, 0.114, 0.0]]; 
				"colorCorrections" ppEffectCommit (_timeAll/3);
			};
		};    
		for "_i" from 0 to (_greatestNr-1) step 1 do 
		{
			if(_i <= _rm) then {_r = _i};
			if(_i <= _gm) then {_g = _i};
			if(_i <= _bm) then {_b = _i};
			_light setLightColor [(_r)/255, (_g)/255, (_b)/255];
			//DEBUGLOG format ["Nastavuji barvu [%1/255, %2/255, %3/255]", _r, _g, _b];
			_light setLightBrightness (_brightm/_greatestNr)*_i;
			//DEBUGLOG format ["Nastavuji setLightBrightness %1", (_brightm/_greatestNr)*_i];
		
			_dtime = (_dtime + _dt);
			//DEBUGLOG format ["dTime = %1", _dtime];
			WaitUntil{time >= _dtime}
			
		};
		//DEBUGLOG format ["Konec v %1, trvani: %2", time, time - _timeold];
		/*
		"colorCorrections" ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, 0.0], [1.0, 1.0, 1.0, 1.0], [1.0, 1.0, 1.0, 1.0]];     
		"colorCorrections" ppEffectCommit 1;
		*/
		_r = 0; _g = 0; _b = 0;
		if(!isNil "_off") then
		{
			_greatestNr = [_rm,_gm,_bm] call BIS_fnc_greatestNum;
			_dt = _offTime/_greatestNr;
			//DEBUGLOG format ["_dt: %1", _time/_greatestNr];
			_dtime = time;
			//DEBUGLOG format ["Pocet pruchodu smyckou off: %1", _greatestNr];
			//DEBUGLOG format ["zpozdeni ve smycce off: %1", _dt];
			//DEBUGLOG format ["trvanioff => %1 x %2 = %3", _greatestNr, _dt, _greatestNr*_dt];
			_timeold = time;
			//DEBUGLOG format ["Start v %1", _timeold];
			if(_brightm > 5) then
			{
				[(_greatestNr*_dt)]spawn
				{
					_timeAll = _this select 0;
					_timeWait = (_timeAll/3); //2/3
					Sleep _timeWait;
					
					"colorCorrections" ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, 0.0], [1.0, 1.0, 1.0, 1.0], [1.0, 1.0, 1.0, 1.0]];
					"colorCorrections" ppEffectCommit (_timeAll/3);
				};
			};
			for "_i" from (_greatestNr-1) to 0 step -1 do 
			{
				if(_i <= _rm) then {_r = _i};
				if(_i <= _gm) then {_g = _i};
				if(_i <= _bm) then {_b = _i};
				_light setLightColor [(_r)/255, (_g)/255, (_b)/255];
				//DEBUGLOG format ["Nastavuji barvu [%1/255, %2/255, %3/255]", _r, _g, _b];
				_light setLightBrightness (_brightm/_greatestNr)*_i;
				//DEBUGLOG format ["Nastavuji setLightBrightness %1", (_brightm/_greatestNr)*_i];
			
				_dtime = (_dtime + _dt);
				//DEBUGLOG format ["dTime = %1", _dtime];
				WaitUntil{time >= _dtime}
				
			};
			//DEBUGLOG format ["Konec off v %1, trvani: %2", time, time - _timeold];
		};
		
		BIS_turningOnInProgress = nil;
		//DEBUGLOG format ["BIS_TurnLightOn: Done, %1", time - _mTime];
	
	}
	else
	{
		//DEBUGLOG format ["Turning of %1 in progress, try later", _light];	
	};
};