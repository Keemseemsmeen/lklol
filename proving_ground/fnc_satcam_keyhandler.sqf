
	private ["_event","_keyCode","_shift","_control","_alt"];
	private["_handled","_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
	_ctrl = _this select 0;
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	_handled = false;


	_loki_satcam = loki_logic getVariable "loki_satcam";
	_cam = _loki_satcam select 0;
	_keyhandler = _loki_satcam select 1;
	_campos = _loki_satcam select 2;
	_dir = (_loki_satcam select 3) select 0;
	_pitch = (_loki_satcam select 3) select 1;
	switch (_dikCode) do {
		case 17:{	//W
			_newpos = [(_campos select 0) + sin(_dir)*(_campos select 2)/4,(_campos select 1) + cos(_dir)*(_campos select 2)/4,_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_newpos,[_dir,_pitch]]];
			};
		case 31:{	//S
			_newpos = [(_campos select 0) - sin(_dir)*(_campos select 2)/4,(_campos select 1) - cos(_dir)*(_campos select 2)/4,_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_newpos,[_dir,_pitch]]];
			};
		case 30:{	//A
			_newpos = [(_campos select 0) + sin(_dir-90)*(_campos select 2)/4,(_campos select 1) + cos(_dir-90)*(_campos select 2)/4,_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_newpos,[_dir,_pitch]]];
			};
		case 32:{	//D
			_newpos = [(_campos select 0) + sin(_dir+90)*(_campos select 2)/4,(_campos select 1) + cos(_dir+90)*(_campos select 2)/4,_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_newpos,[_dir,_pitch]]];
			};
		case 200:{	//up
			_pitch = (_pitch + 1) min 89;
			_cam setVectorDirAndUp [[sin(_dir)*cos(_pitch),cos(_dir)*cos(_pitch),sin(_pitch)],[-sin(_dir)*sin(_pitch), -cos(_dir)*sin(_pitch), -cos(_pitch)]];
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_campos,[_dir,_pitch]]];
			};
		case 208:{	//down
			_pitch = (_pitch - 1) max -89;
			_cam setVectorDirAndUp [[sin(_dir)*cos(_pitch),cos(_dir)*cos(_pitch),sin(_pitch)],[-sin(_dir)*sin(_pitch), -cos(_dir)*sin(_pitch), -cos(_pitch)]];
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_campos,[_dir,_pitch]]];
			};
		case 203:{	//left
			_dir = (_dir - 1);
			_cam setVectorDirAndUp [[sin(_dir)*cos(_pitch),cos(_dir)*cos(_pitch),sin(_pitch)],[-sin(_dir)*sin(_pitch), -cos(_dir)*sin(_pitch), -cos(_pitch)]];
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_campos,[_dir,_pitch]]];
			};
		case 205:{	//right
			_dir = (_dir + 1);
			_cam setVectorDirAndUp [[sin(_dir)*cos(_pitch),cos(_dir)*cos(_pitch),sin(_pitch)],[-sin(_dir)*sin(_pitch), -cos(_dir)*sin(_pitch), -cos(_pitch)]];
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_campos,[_dir,_pitch]]];
			};
		case 78:{	//Num +
			_newpos = [(_campos select 0),(_campos select 1),(((_campos select 2)-50) max 50)];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_newpos,[_dir,_pitch]]];
			};
		case 74:{	//Num -
			_newpos = [(_campos select 0),(_campos select 1),(((_campos select 2)+50) min 2000)];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,_newpos,[_dir,_pitch]]];
			};			
		case 49:{	//N normal view
			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;
			camUseNVG false;

			ppGrain = ppEffectCreate ["filmGrain", 2005];
			ppGrain ppEffectEnable true;
			ppGrain ppEffectAdjust [0.02, 1, 1, 0, 1];
			ppGrain ppEffectCommit 0;
		};			
		case 47:{	//V night vision
			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;
			camUseNVG true;
		};
		case 16:{	//Q

			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;

			camUseNVG false;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown",_keyhandler];
			loki_logic setVariable ["loki_satcam",nil];
			_cam cameraEffect ["terminate","back"];
			camDestroy _cam;
		};	
	};//end switch
	