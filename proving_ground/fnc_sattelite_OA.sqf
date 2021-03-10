
satcam_keyhandler =
{
private ["_event","_keyCode","_shift","_control","_alt"];
	private["_handled","_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
	_ctrl = _this select 0;
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	_handled = false;


	_loki_satcam = uiNamespace getVariable "loki_satcam";
	_cam = _loki_satcam select 0;
	_keyhandler = _loki_satcam select 1;
	_campos = _loki_satcam select 2;
	switch (_dikCode) do {
		case 17:{	//W
			_newpos = [(_campos select 0),(_campos select 1) + (_campos select 2)/4,_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			uiNamespace setVariable ["loki_satcam",[_cam,_keyhandler,_newpos]];
			};
		case 31:{	//S
			_newpos = [(_campos select 0),(_campos select 1) - (_campos select 2)/4,_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			uiNamespace setVariable ["loki_satcam",[_cam,_keyhandler,_newpos]];
			};
		case 30:{	//A
			_newpos = [(_campos select 0) - (_campos select 2)/4,(_campos select 1),_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			uiNamespace setVariable ["loki_satcam",[_cam,_keyhandler,_newpos]];
			};
		case 32:{	//D
			_newpos = [(_campos select 0) + (_campos select 2)/4,(_campos select 1),_campos select 2];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			uiNamespace setVariable ["loki_satcam",[_cam,_keyhandler,_newpos]];
			};
		case 78:{	//Num +
			_newpos = [(_campos select 0),(_campos select 1),(((_campos select 2)-50) max 50)];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			uiNamespace setVariable ["loki_satcam",[_cam,_keyhandler,_newpos]];
			};
		case 74:{	//Num -
			_newpos = [(_campos select 0),(_campos select 1),(((_campos select 2)+50) min 2000)];
			_cam camSetPos _newpos;
			_cam camCommit 0.1;
			uiNamespace setVariable ["loki_satcam",[_cam,_keyhandler,_newpos]];
			};	
		case 20:{	//T white is hot
			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;

			true setCamUseTi 0;
			camUseNVG false;
		};			
		case 49:{	//N normal view
			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;
							
			false setCamUseTi 0;
			false setCamUseTi 1;
			camUseNVG false;

			ppGrain = ppEffectCreate ["filmGrain", 2005];
			ppGrain ppEffectEnable true;
			ppGrain ppEffectAdjust [0.02, 1, 1, 0, 1];
			ppGrain ppEffectCommit 0;
		};	
		case 19:{	//R black is hot
			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;

			true setCamUseTi 1;
			camUseNVG false;
		};		
		case 47:{	//V night vision
			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;
							
			false setCamUseTi 0;
			false setCamUseTi 1;
			camUseNVG true;
		};
		case 16:{	//Q
			ppEffectDestroy ppColor;
			ppEffectDestroy ppInversion;
			ppEffectDestroy ppGrain;

			false setCamUseTi 0;
			false setCamUseTi 1;
			camUseNVG false;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown",_keyhandler];
			uiNamespace setVariable ["loki_satcam",nil];
			_cam cameraEffect ["terminate","back"];
			camDestroy _cam;
		};	
	};//end switch
	
};




_pos = _this select 0;
_pos = [_pos select 0,_pos select 1,-(_pos select 2)];
disableSerialization;

showCinemaBorder false;
_cam = "camera" camCreate [_pos select 0,_pos select 1,200];
_cam cameraeffect ["External", "Top"];
_cam camSetFovRange [0.1,0.7];
_dir = 0;
_pitch = -89;
_cam setVectorDirAndUp [[sin(_dir)*cos(_pitch),cos(_dir)*cos(_pitch),sin(_pitch)],[-sin(_dir)*sin(_pitch), -cos(_dir)*sin(_pitch), -cos(_pitch)]];

titleText["WASD - move, Num-/Num+ - zoom, R,T - TVC, V - NV, N - normal view, Q - exit","plain down"];
_keyhandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call satcam_keyhandler"];
uiNamespace setVariable ["loki_satcam",[_cam,_keyhandler,[_pos select 0,_pos select 1,200]]];