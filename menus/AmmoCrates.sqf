lbClear 72011;


_vehicles = configFile >> "CfgVehicles";

for "_i" from 0 to ((count _vehicles) - 1) do
{
	_vehicle = _vehicles select _i;
	if (isClass _vehicle) then
{
if ((configName _vehicle) isKindOf "ReammoBox") then
	{

			lbAdd [72011, getText(_vehicle >> "displayName")];
			lbSetData [72011, ((lbSize 72011) - 1), configName _vehicle];

	};
};
};

// Run this function directly from a button control action.
Request2 =
{
	[lbData [72011, lbCurSel 72011]] execVM '\loki_lost_key\menus\AmmoCreate.sqf';
	hint "AmmoCrate is here Master...";

};
Request =
{
	[lbData [72011, lbCurSel 72011]] execVM '\loki_lost_key\menus\listVehicles.sqf';
	hint "Select Map Position";

};
lbSetCurSel [4,0];