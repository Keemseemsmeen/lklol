// about the lost key and why i do what i do

_input = "
''' '''

'''Description:'''
* The Lost Key is a stress testing tool for mission makers.

'''Features:'''
*Ghost Mode,God Mode,Unlimited ammo
*spawn anything from your addons...
*teleport, h.a.l.o., freeCam, SatView
*full music player with custom music
*hitch anything
*full debug features and functions
* different modes of artillery from the stupid to as real as it gets in a game. [R3F]
*animation viewers
*ability to copy and paste most names, classes, and code from anything to the clipboard.
*and much more!

'''Reason For:'''
* Anyone who has spent hours upon hours in the editor trying to get a mission perfect, just to get overwhelmed by fighting the mission to see if a change works.. this is why i made this. I build missions that last 6+ hours... ever try to debug the end trigger in one of those?! Then you can understand why i made this. The real bitch is that only a handful of people will use this as it was intended for... the rest will use it to have fun and goof off with.. 
*which is also ok...
*UNLESS...
*
*you are one of those fukin half monkey dumb fuks that can't resist fuking other peoples games up by using this as a cheat engine.
*
*in that case..
*
* you are an asshole that has made all i have done a waste of time.
*
*Thanks, DICK!
*
*otherwise...
*
*Thank You
*for using the Lost Key and making kick ass missions!

'''Music by:'''
*Just a Gigolo - Louis Prima
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
	
sqf = [creditsText,[safezoneX,safezoneW * 0.5],safezoneH - 0.3 * safezoneH,1000,-1,-60,_layer] spawn bis_fnc_dynamicText;

playSound "just_a_gigolo";

