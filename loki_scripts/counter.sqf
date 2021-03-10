
//sleep 120;


private ["_totalW","_totalE","_totalC","_totalI","_totalA","_totalEnemy","_totalUknown"];
while {true} do
{
	_totalW = 0; { _totalW = _totalW + ({ alive _x } count (crew _x)) } forEach (list westTrigger);
	_totalE = 0; { _totalE = _totalE + ({ alive _x } count (crew _x)) } forEach (list EastTrigger);
	_totalC = 0; { _totalC = _totalC + ({ alive _x } count (crew _x)) } forEach (list CivTrigger);
	_totalI = 0; { _totalI = _totalI + ({ alive _x } count (crew _x)) } forEach (list ResistanceTrigger);
	
	_totalA = 0; { _totalA = _totalA + ({ alive _x } count (crew _x)) } forEach (list AnimalTrigger);	
	_totalEnemy = 0; { _totalEnemy = _totalEnemy + ({ alive _x } count (crew _x)) } forEach (list EnemyTrigger);

	_totalUknown = 0; { _totalUknown = _totalUknown + ({ alive _x } count (crew _x)) } forEach (list UnknownTrigger);	
	// <-- hint 
	hintsilent format 
	[
	"West: %1\nEast: %2\nCiv: %3\nInd: %4\nAnimal: %5\nEnemy: %6\nUnknown: %7"
	, _totalW, _totalE, _totalC, _totalI, _totalA, _totalEnemy,_totalUknown
	]; 
	sleep 5;
//	if (_totalC < 10) then {endMission "END2"};	
	
};

