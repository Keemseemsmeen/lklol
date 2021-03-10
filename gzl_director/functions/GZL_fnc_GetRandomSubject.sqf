private["_type","_array","_return"];
_array = _this select 0;
_bias = _this select 1;
_countSubjects = count _array;
_countMen = 0;
_countVeh = 0;
_countMrk = 0;
_return = objNull;
if (_countSubjects > 1) then
{	
	
	{
		if(_x isKindOf "MAN")
		then { _countMen = _countMen + 1;}
		else { if (!isNull _x) then {_countVeh = _countVeh + 1;};};
	}forEach _array;
	
	if ((_countMen > 0) && (_countVeh > 0))
	then
	{
		_typeSwitch = random 1;
		if (_typeSwitch >= _bias) then
		{
			while {true} do
			{
				_rnd = 1 + floor(random _countSubjects);
				if (((_array select _rnd) isKindOf "MAN")) exitWith {_return = (_array select _rnd);};
			};
		}
		else
		{
			while {true} do
			{
				_rnd = 1 + floor(random _countSubjects);
				if (!((_array select _rnd) isKindOf "MAN")) exitWith {_return = (_array select _rnd);};
			};
		};
	}
	else
	{
		if ( (_countMen == 0) && (_countVeh > 0) ) then
		{
			_rnd = 1 + floor(random _countVeh);
			_return = (_array select _rnd);
			
		};
		if ( (_countMen > 0) && (_countVeh == 0) ) then
		{
			_rnd = 1 + floor(random _countMen);
			_return = (_array select _rnd);			
		};
	};
	
};
_return