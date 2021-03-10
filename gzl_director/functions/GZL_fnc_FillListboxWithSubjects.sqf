private["_ctrlIDC","_dlgIDD","_sideMask","_vehMask","_subject","_player","_index","_return"];

_ctrlIDC = _this select 0;
_dlgIDD = _this select 1;
_sideMask = _this select 2;
_vehMask = _this select 3;
_player = _this select 4;
_subject = objNull;
_index = 0;
_return = [];
	
lbClear _ctrlIDC;
_index = lbAdd [_ctrlIDC, "[Random]"]; 
_return = [objNull];

if ('Man' in _vehMask ) then {	
	{	if ( (vehicle _x == _x) && (_x != _player) && ( str side _x in _sideMask) ) then {
			_index = lbAdd [_ctrlIDC, name _x];
			_return = _return + [_x];	};					
	} forEach allUnits;
};
{	
	if ( (_x != _player) && ( str side _x in _sideMask) ) then {
		_subject = _x;
		{
			if (_subject isKindOf _x) then {
				_index = lbAdd [_ctrlIDC, typeOf _subject];
				_return = _return + [_subject];
				if (true) exitWith{}; };				
		}forEach _vehMask;	
	};
} forEach vehicles;
[_dlgIDD, _ctrlIDC, (_this select 5) select 0] spawn GZL_fnc_SetSubject;
_return