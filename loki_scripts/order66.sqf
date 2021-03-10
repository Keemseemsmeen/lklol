
//WEST
if (playerSide == west) then {
//kill the east sith
triggerOrder66 = createTrigger ["EmptyDetector", position player];
triggerOrder66 setTriggerArea [5000, 5000, 0, false];
triggerOrder66 setTriggerActivation ["EAST", "PRESENT", true];
triggerOrder66 setTriggerType "SWITCH";

//kill the Res. Rebels
triggerOrder66R = createTrigger ["EmptyDetector", position player];
triggerOrder66R setTriggerArea [5000, 5000, 0, false];
triggerOrder66R setTriggerActivation ["GUER", "PRESENT", true];
triggerOrder66R setTriggerType "SWITCH";
sleep 1;
private ["_sith_loons","_rebel_loons"];

_triggerOrder66List = list triggerOrder66;
sleep 0.01;
_triggerOrder66ListR = list triggerOrder66R;

_sith_loons = 0;
_rebel_loons = 0;

{_sith_loons = _sith_loons + ({ alive _x } count (crew _x)) } forEach (list triggerOrder66);
{_rebel_loons = _rebel_loons + ({ alive _x } count (crew _x)) } forEach (list triggerOrder66R);

sleep 1;
//get the vehicles first
{deletevehicle _x} foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;
sleep 2;
//get those knocked out of the vehicles
{deletevehicle _x}  foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;
sleep 1;
// for those tuff bassturds...
{deletevehicle _x} foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;

hint "killed ya.. you sith bassturds... and your little rebel friends too.";

sleep 1.5;

deletevehicle triggerorder66;
deletevehicle triggerorder66R;
};

// EAST
if (playerSide == east) then {
//kill the west jedi
triggerOrder66 = createTrigger ["EmptyDetector", position player];
triggerOrder66 setTriggerArea [5000, 5000, 0, false];
triggerOrder66 setTriggerActivation ["WEST", "PRESENT", true];
triggerOrder66 setTriggerType "SWITCH";

//kill the Res. Rebels
triggerOrder66R = createTrigger ["EmptyDetector", position player];
triggerOrder66R setTriggerArea [5000, 5000, 0, false];
triggerOrder66R setTriggerActivation ["GUER", "PRESENT", true];
triggerOrder66R setTriggerType "SWITCH";
sleep 1;
private ["_jedi_loons","_rebel_loons"];

_triggerOrder66List = list triggerOrder66;
sleep 0.01;
_triggerOrder66ListR = list triggerOrder66R;

_jedi_loons = 0;
_rebel_loons = 0;

{_jedi_loons = _jedi_loons + ({ alive _x } count (crew _x)) } forEach (list triggerOrder66);
{_rebel_loons = _rebel_loons + ({ alive _x } count (crew _x)) } forEach (list triggerOrder66R);

sleep 1;
//get the vehicles first
{deletevehicle _x} foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;
sleep 2;
//get those knocked out of the vehicles
{deletevehicle _x}  foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;
sleep 1;
// for those tuff bassturds...
{deletevehicle _x} foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;

hint "killed ya.. you jedi bassturds... and your little rebel friends too.";

sleep 1.5;

deletevehicle triggerorder66;
deletevehicle triggerorder66R;
};

//GUER
if (playerSide == east) then {
//kill the west jedi
triggerOrder66 = createTrigger ["EmptyDetector", position player];
triggerOrder66 setTriggerArea [5000, 5000, 0, false];
triggerOrder66 setTriggerActivation ["WEST", "PRESENT", true];
triggerOrder66 setTriggerType "SWITCH";

//kill the east sith
triggerOrder66R = createTrigger ["EmptyDetector", position player];
triggerOrder66R setTriggerArea [5000, 5000, 0, false];
triggerOrder66R setTriggerActivation ["EAST", "PRESENT", true];
triggerOrder66R setTriggerType "SWITCH";
sleep 1;
private ["_jedi_loons","_sith_loons"];

_triggerOrder66List = list triggerOrder66;
sleep 0.01;
_triggerOrder66ListR = list triggerOrder66R;

_jedi_loons = 0;
_sith_loons = 0;

{_jedi_loons = _jedi_loons + ({ alive _x } count (crew _x)) } forEach (list triggerOrder66);
{_sith_loons = _sith_loons + ({ alive _x } count (crew _x)) } forEach (list triggerOrder66R);

sleep 1;
//get the vehicles first
{deletevehicle _x} foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;
sleep 2;
//get those knocked out of the vehicles
{deletevehicle _x}  foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;
sleep 1;
// for those tuff bassturds...
{deletevehicle _x} foreach _triggerOrder66List;
sleep 0.01;
{deletevehicle _x} foreach _triggerOrder66ListR;

hint "all the jedi and sith are gone Master.";

sleep 1.5;

deletevehicle triggerorder66;
deletevehicle triggerorder66R;
};