private["_displayIDD","_ctrlIDC","_control","_items","_return","_index","_selected"];
_displayIDD = _this select 0;
_ctrlIDC = _this select 1;
disableSerialization;
_control = (findDisplay _displayIDD) displayCtrl _ctrlIDC;
_items = lbSize _control;
_singleSelect = false;
_return = [];
if (_items != 0)  then {
	

	for [ {_index = 0},{ _index < _items },{_index = _index + 1 } ]
	do
	{ 
		_selected = _control lbIsSelected _index;
		//_return = _return + [_selected];
		if (_singleSelect)
		then { _return = _return + [false]; _control lbSetSelected [_index, false];	}
		else { _return = _return + [_selected]; };
		if ((_index == 0) && (_selected)) then { _singleSelect = true;};
	};
};
_return

