private ["_type", "_class"];

_type = _this select 0;

switch (_type) do
{
	default
	{
		_class = _type;
	};

};

_unit = createVehicle [_class, position player, [], 0, "NONE"];

