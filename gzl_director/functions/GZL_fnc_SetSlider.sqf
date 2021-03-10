private["_ctrlIDC","_range","_position","_speedA","_speedB","_return"];
_ctrlIDC = _this select 0;
_range = _this select 1;
_position = _this select 2;
_speedA = _this select 3;
_speedB = _this select 4;
_return = true;
disableserialization;
sliderSetRange [_ctrlIDC, -_range, _range];
sliderSetPosition [_ctrlIDC, _position];
sliderSetSpeed [_ctrlIDC,_speedA,_speedB];
_return