
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

titleText["WASD - move, Arrows - rotate, Num-/Num+ - zoom, V - NV, N - normal view, Q - exit","plain down"];
_keyhandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call (loki_logic getVariable ""satcam_keyhandler"")"];
loki_logic setVariable ["loki_satcam",[_cam,_keyhandler,[_pos select 0,_pos select 1,200],[_dir,_pitch]]];