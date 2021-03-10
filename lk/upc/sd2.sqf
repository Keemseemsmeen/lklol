

ammo=false;
nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";

_mapMarkText = "Click on the map to designate the supply drop LZ";
_closeMapMessage = "Close the map to initiate drop procedure";
_droppoint = "SD_DropMarker";
_dropMarkerType = "SupplyVehicle";
_incomingMessage = "This is eagle one, we are inbound with supply drop, please stand by...";
_triggerDistance = 200;

// Map click to determine where the supplies will be dropped.
SD_dropmarked = true;
hint _mapMarkText;
_mapString = format["SD_DropMarker = createMarker [""%1"", _pos]; ""%1"" setMarkerType ""%2"";;SD_dropmarked=false",_droppoint, _dropMarkerType];
onMapSingleClick _mapString;
waitUntil{!SD_dropmarked};
onMapSingleClick "";

hint _closeMapMessage;
waitUntil{!visibleMap};
hintSilent "";

_pos = getmarkerpos "SD_DropMarker";



if ace2ammodrop then {

hint "ACE ammo";
spawntype0 = "ACE_USLaunchersBox";
spawntype1 = "ACE_USSpecialWeaponsBox";
spawntype2 = "ACE_USBasicAmmunitionBox"} else {

	hint "BIS ammo";
	spawntype0 = "USLaunchersBox";
	spawntype1 = "USSpecialWeaponsBox";
	spawntype2 = "USBasicAmmunitionBox"};


_dir = 90;
_airtype = "C130J";
_type = "GUE_Soldier_Pilot";
mygroup = creategroup side player;



_target = createVehicle  ["testsphere2",[_pos select 0,_pos select 1,-10], [], 0, "FLY"];
_target setpos [_pos select 0,_pos select 1,200];
_target setDir _dir;
_vdir = vectorDir _target;
_target setpos [(_pos select 0) + (_vdir select 0) * 26, (_pos select 1) + (_vdir select 1) * 26,200];
_apos = getposasl _target;


_npos = [(_pos select 0) + (_vdir select 0) * -1500, (_pos select 1) + (_vdir select 1) * -1500, 300];

_vehicle = createVehicle  [_airtype,_npos, [], 0, "FLY"];
_vehicle setpos _npos;
_vehicle setDir _dir;


_vehicle setvelocity [(_vdir select 0)*50,(_vdir select 1)*50, 5];

_type createUnit [_npos, mygroup,"pilot=this;"];
_pilot = pilot;
_pilot moveindriver _vehicle;
_pilot reveal _target;
_pilot doMove _npos;
_pilot dotarget _target;
_pilot dowatch _target;
_pilot FlyInHeight 400;
_vehicle FlyInHeight 400;


while {_vehicle distance _target > 40} do {
    sleep 0.1;
    if(_vehicle distance _target < 600) then {
        _pilot FlyInHeight 100;
        _pilot doMove _npos;
    };
};

    _bpos = _vehicle ModelToWorld [0,-12,-5.5];
    _bomb = spawntype0 createVehicle _bpos;
    _bomb setpos _bpos;
    _bomb setDir direction _vehicle;
    _chute = "ParachuteMediumWest" createVehicle getpos _bomb;
    _chute setpos (_bomb ModelToWorld [0,0,3]);
    _bomb attachTo [_chute,[0,0,2.5]];

    sleep 0.2;
    _bpos = _vehicle ModelToWorld [0,-12,-5.5];
    _bomb = spawntype1 createVehicle _bpos;
    _bomb setpos _bpos;
    _bomb setDir direction _vehicle;
    _chute = "ParachuteMediumWest" createVehicle getpos _bomb;
    _chute setpos (_bomb ModelToWorld [0,0,3]);
    _bomb attachTo [_chute,[0,0,2.8]];

    sleep 0.2;
    _bpos = _vehicle ModelToWorld [0,-12,-5.5];
    _bomb = spawntype2 createVehicle _bpos;
    _bomb setpos _bpos;
    _bomb setDir direction _vehicle;
    _chute = "ParachuteMediumWest" createVehicle getpos _bomb;
    _chute setpos (_bomb ModelToWorld [0,0,3]);
    _bomb attachTo [_chute,[0,0,2.4]];

    deletevehicle _target;
    sleep 0.05;

_plane FlyInHeight 250;


sleep 1;
_plane FlyInHeight 450;
_pilot doMove [(_pos select 0) + (_vdir select 0) * 800, (_pos select 1) + (_vdir select 1) * 800, 500];

sleep 15;

deletevehicle _vehicle;
deletevehicle _pilot;

deletemarker "SD_DropMarker";

sleep 100;
hint "Ammo Drop is available again";
ammp=true;
nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";
