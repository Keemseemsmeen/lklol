private["_ctrlLow", "_ctrlHigh","_show","_return"];
_ctrlLow = _this select 0;
_ctrlHigh = _this select 1;
_show = _this select 2;
_return = true;
for [{_idc = _ctrlLow},{_idc <= _ctrlHigh},{_idc = _idc + 1}]
do {ctrlShow [_idc,_show];};
_return