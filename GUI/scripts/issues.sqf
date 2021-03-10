//how to use the lost key functions and such

_input = "
''' '''

'''Issues:'''
* shit i know is broken.. but i am to lazy to fix now.. and most won't know. (i hope)

'''Team Status:'''
* will not populate the menu outside of a vehicle.

'''Text Color:'''
*saves the current color everywhere, except when re-opening the dialog from full close.
*
*
*
*
*not too much of it is broken at this time
*
*
*though some of it is important...
*
'''i'll get to it...   soon'''
*
*i hope
*
*
* write a bug report if you see something i don't...
*
*or it's something i don't care about...
*
*
'''Music by:'''
*Jingle, Jangle, Jingle - Kay Kyser

'''The rest..'''
* well.. like i said. when one puts an assload of hours into something that has no end.. well.. you just gotta let 'em have it.
*
*just to make sure
";


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Localized
_inputLocalized = [];


x_inputLocalized = _inputLocalized;
x_input = _input;

_inputArrayUnicode = toarray _input;
_inputArrayUnicode = _inputArrayUnicode - [42];

_inputString = "";
_inputArrayDebug = [];
_deleteSpaces = false;
_deleteRows = false;

_isBold = false;
_isTitle = false;
_countTotal = count _inputArrayUnicode - 1;

for "_i" from 0 to _countTotal do {
	_current = _inputArrayUnicode select _i;
	_previous = if (_i > 0) then {_inputArrayUnicode select (_i-1)} else {-1};
	_next = if (_i < (count _inputArrayUnicode - 1)) then {_inputArrayUnicode select (_i+1)} else {-1};


	_output = tostring [_current];

	if (_current == 32 && (_previous == 10 || _next == 10)) then {_output = "";};
	if (_current == 10) then {_output = "<br />"};
	if (_current == 39 && _previous == 39 && _next != 39) then {_output = "";};
	if (_current == 39 && _previous != 39 && _next == 39) then {_output = "";};
	if (_current == 39 && _previous == 39 && _next == 39) then {
		_output = if (_isBold) then {_isBold = false; "</t>";} else {_isBold = true; "<t color='#dd6666'>";};
	};
	if (_current == 61 && _previous == 61 && _next != 61) then {_output = "";};
	if (_current == 61 && _previous != 61 && _next == 61) then {_output = "";};
	if (_current == 61 && _previous == 61 && _next == 61) then {
		_output = if (_isTitle) then {_isTitle = false; "</t>";} else {_isTitle = true; "<t color='#dd6666' size='1.5'>";};
	};


	_inputString = _inputString + _output;
	_inputArrayDebug = _inputArrayDebug + [[_current,_output]];


};


creditsText = _inputString;
_layer = 1 * random 72;
	
sqf = [creditsText,[safezoneX,safezoneW * 0.5],safezoneH - 0.3 * safezoneH,1000,-1,-57,_layer] spawn bis_fnc_dynamicText;

playSound "Yippe_Yay";

