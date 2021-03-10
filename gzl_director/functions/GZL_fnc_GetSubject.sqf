private["_vehicleName","_vehicle","_return"];
_vehicleName = _this select 0;
_found = false;
{
	if (_x == _vehicleName) exitWith {_found = true; _return = _x};
}forEach allUnits;

if (!_found) then {

	{
		if(_x == _vehicleName) exitWith {_found = true;_return = _x};
	}forEach vehicles;
};
if (!_found) then {	_return = _objNull;};
_return