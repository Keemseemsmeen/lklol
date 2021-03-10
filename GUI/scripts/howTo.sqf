//how to use the lost key functions and such

_input = "
''' '''

'''Usage:'''
* Each of the main script suites are used in a specific way.

'''Most options:'''
* are self-explanatory, the rest are here.

'''Gigan Cam:'''
*Once in use, hit spacebar to exit

'''SatView:'''
* click on the map to set inital location.

'''H.A.L.O.:'''
* set the inital height, then,
* click on the map to set jump location.

'''[R3F] Systems'''
*gives the ability to pick up most things and put them in a vehicle or container. if you want to use the [R3F] artillery, goto the ARTILLERY section, and you will see the ability to spawn a R3F Artillery Center. Otherwise you will always see the 'load in' addaction in your menu.

'''On / Off buttons:'''
* some functions can be turned on / off by the same button, these include:
*
* FPS
* Object Status
* Bullet Cam
*

'''MapClick vs. Request Button:'''
*when you choose a thing to spawn, the choice between MapClick and Request is simple.
*
*Mapclick puts the spawned 'thing' where you clicked on the map and the Request button spawns the 'thing' requested at the player (your position).

'''Rotate Button'''
* is only used for a few of the custom artillery calls...

'''Music by:'''
*Forty Six and 2 - Tool

'''The rest..'''
* well.. the song is running out.. you figure it out.
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

playSound "Tool_46";

