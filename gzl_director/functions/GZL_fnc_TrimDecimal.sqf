private["_num"];
_num = _this select 0;
_num = toArray str _num;
_trim = _this select 1;
_return = 0;
_decimal = 46;
_places = -1;
_hasDecimal = false;
_temp = "";
if ( (count _num) == 1 ) then {
	_return = _this select 0}
else {
	{
		if (_places == _trim) exitWith{};
		if ( _x == 45 ) then { _temp = _temp + "-" };
		if ( _x >= 48 ) then { _temp = _temp + str (_x - 48) };
		if ( _x == 46 ) then { _hasDecimal = true; _temp = _temp + "." };
		if ( _hasDecimal ) then { _places = _places + 1; };
					
	}forEach _num;
	_return = parseNumber _temp;
};
_return


