// credits for all the people who helped, and a sharp rebuke for all the lil bitches whining in the community... still... after 10 fukin years.. ...  ...losers

_input = "
''' '''
* 
<img image='gui\img\lostkey.paa' size='7' />

'''Lord of the Lost Key'''
* LOKI <img image='gui\img\loki.paa' size='1' />

'''Proving Ground scripts'''
* conKORD

'''Team Status and Admins scripts'''
* Xeno 

'''HoloMap, Scuba, RearView, Map'''
* Spooner 

'''Sat View'''
* PIXEL ART STUDIO 

'''Gig Cam'''
* Gigan 

'''LDL Support'''
* LurchiDerLurch 

'''[R3F] Systems'''
* madbull ~R3F~ 

'''Those who helped:'''
* Randy
* ViperMaul
* Emery
* Matchy
*
'''most of all''' 
*my lovely wife for allowing all the hours i put into this monster.
*

'''Music''' 
*
*Poker Face from: South Park

'''Thanks to:'''
*BIS and the ArmA community which is full of ungrateful dipshits.
*
*who say.. 'you can't do this.. and you can't do that'...
*
* well to that... 
*     i say read the legal coming up.
*
*		|
*		|
*		V
*
*
*
'''Legal''' 
*
*if you have a problem with anything contained herein
*
*
*   its just a game! 
*
*
*    FUK YOU
*
<img image='gui\img\fukyou.paa' size='7' />
*

'''Other Shit''' 
*
*if there is something of yours in the lost key and i didn't give you credit.. tell me and i will.
*
*otherwise... if there is something in the lost key that is yours and you have an issue with it being in the lost key... see legal
*
* especially the fuk you... its just a game... part.
*
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
	
sqf = [creditsText,[safezoneX,safezoneW * 0.5],safezoneH - 0.3 * safezoneH,1000,-1,-85,_layer] spawn bis_fnc_dynamicText;


if (cameraView == "INTERNAL") then { cameraOn switchCamera "EXTERNAL"; };
	playSound "SP_Pokerface";
	player playMove "ActsPercMstpSnonWnonDnon_DancingDuoIvan";
	sleep 2;
	player playMove "ActsPercMstpSnonWnonDnon_DancingDuoIvan";
	sleep 65;
	playSound "lastwords";
	sleep 16;
if (cameraView == "EXTERNAL") then { cameraOn switchCamera "INTERNAL"; };

