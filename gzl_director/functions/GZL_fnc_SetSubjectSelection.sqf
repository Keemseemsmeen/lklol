_dlgIDD = _this select 0;
_ctrlIDC = _this select 1;
_subject = _this select 2;
_return = true;
disableSerialization;
_ctrl = (findDisplay _dlgIDD) displayCtrl _ctrlIDC;

for [{_index = 0}, {_index < (lbsize _ctrl)}, {_index = _index + 1}] do {
	//diag_log format["%1 %2",(lbText [_ctrlIDC, _index]),(str _subject select 0)];
	_text = lbText [_ctrlIDC, _index];
	if ( (_text == str _subject) || (_text == typeOf _subject))
	then{_ctrl lbSetSelected [_index, true];}
	else { _ctrl lbSetSelected [_index, false];};
};
if ((isNull _subject) || (_subject == GZL_PLAYER)) then { _ctrl lbSetSelected [0, true];};
_return