lbClear 72011;

_side = _this select 0;
_title = _this select 1;
_listIDC = _this select 2;

lbAdd [_listIDC,"  -----"];
lbAdd [_listIDC,"Units"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "CAManBase"];
lbAdd [_listIDC,"Air"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "Air"];
lbAdd [_listIDC,"Armor"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "Tank"];
lbAdd [_listIDC,"Cars"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "Car"];
lbAdd [_listIDC,"Bikes"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "Motorcycle"];
lbAdd [_listIDC,"Static"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "StaticWeapon"];
lbAdd [_listIDC,"Misc"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "House"];
lbAdd [_listIDC,"Ships"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "Ship"];
lbAdd [_listIDC,"Animals"];
lbSetData [_listIDC, (lbSize _listIDC) - 1, "CAAnimalBase"];

lbSetCurSel [_listIDC,0];

Combo_Set2 =
{

	private ["_type", "_side"];
	
	_type = (_this select 0) lbData (lbCurSel (_this select 0));
	_side = _this select 2;
	[_type, _side] execVM "\loki_lost_key\menus\listVehicles2.sqf";
	
	

};
