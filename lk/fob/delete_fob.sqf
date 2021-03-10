player removeaction playerac1;
deletevehicle hq1trig;
hqdp=false;

nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";

hint "FOB is being Decamped";

if hq1ddone then {lavhq1 = "LAV25_HQ" createVehicle (position hq1d);

deletevehicle hq1d;
sleep 2;
_array = lavhq1 nearObjects ["Thing", 100];
{deletevehicle _x} foreach _array;

sleep 2;
_array = lavhq1 nearObjects ["StaticSEARCHLight", 100];
{deletevehicle _x} foreach _array;

sleep 2;
_array = lavhq1 nearObjects ["StaticWeapon", 100];
{deletevehicle _x} foreach _array;

sleep 2;
_array = lavhq1 nearObjects ["Static", 100];
{deletevehicle _x} foreach _array;

dhq=true

} else {


sleep 2;
_array = hq1d nearObjects ["Thing", 100];
{deletevehicle _x} foreach _array;

sleep 2;
_array = hq1d nearObjects ["StaticSEARCHLight", 100];
{deletevehicle _x} foreach _array;

sleep 2;
_array = hq1d nearObjects ["StaticWeapon", 100];
{deletevehicle _x} foreach _array;

sleep 2;
_array = hq1d nearObjects ["Static", 100];
{deletevehicle _x} foreach _array;
deletevehicle hq1d};


sleep 2;

{deleteVehicle _x} forEach (units GroupHQG1);

deletevehicle h1;

coin setPos [0,0,1];

uavcons=false;
barcons=false;
arty=false;
hqcons=false;
sm=false;
uavlh=false;




