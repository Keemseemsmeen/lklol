publicVariable "fnc_loki_sideMenu_Call";
publicVariable "fnc_loki_add_c4";
publicVariable "fnc_loki_go";
publicVariable "fnc_loki_gogo";
publicVariable "fnc_loki_uber_weap";
publicVariable "fnc_loki_sZone_marker_create";
publicVariable "fnc_loki_sZone_marker_create2";
publicVariable "fnc_loki_sZone_marker_create2a";
publicVariable "fnc_loki_credits";
publicVariable "fnc_loki_FPS";
publicVariable "fnc_loki_Spectator";
publicVariable "fnc_loki_repair";
publicVariable "fnc_SatPhone_Create";
publicVariable "fnc_loki_Scalar_Spawner";
publicVariable "fnc_loki_Scalar_SpawnerBig";
publicVariable "fnc_loki_SSM_create";
publicVariable "fnc_loki_About";
publicVariable "fnc_loki_howTo";
publicVariable "fnc_loki_knownIssues";
publicVariable "fnc_loki_music_picker";
publicVariable "fnc_loki_intro_picker";
publicVariable "fnc_loki_unitCounter";
publicVariable "fnc_loki_Order_66";
publicVariable "fnc_loki_Spawn_Animals_Logic";
publicVariable "fnc_loki_Spawn_ACM_Logic";
publicVariable "fnc_loki_Spawn_SECOP_Logic";
publicVariable "fnc_loki_Spawn_AliceManager_Logic";
publicVariable "fnc_loki_Spawn_SilvieManager_Logic";
publicVariable "fnc_loki_Spawn_MandoMissile";
publicVariable "fnc_loki_Spawn_MandoSAM";
publicVariable "fnc_loki_locationFinder";
publicVariable "fnc_loki_lk_scripts";
publicVariable "fnc_loki_groupSpawn";
publicVariable "fnc_loki_HoloMap";
publicVariable "fnc_loki_Scuba";
publicVariable "fnc_loki_HunKil_Tank1";
publicVariable "fnc_loki_CampSpawn_All";
publicVariable "fnc_loki_MBG_Creator";

// Spawn what is needed for the MBG builder
fnc_loki_MBG_Creator = {

//Create a MBG Module if not present
if ((isClass(configFile >> "cfgPatches" >> "MBG_Creationism"))) then {
private ["_MBG_CreationismManager", "_MBG_Creationism"];
createCenter sideLogic;
_grpLogicMBG_CreationismManager = createGroup sideLogic;
_MBG_CreationismManager = _grpLogicMBG_CreationismManager createUnit ["MBG_Creationism_Plugin", [1, 1, 1], [], 0, "NONE"];

};

};


// Master Camp Spawner.sqf
fnc_loki_CampSpawn_All = {
private["_posX", "_posY", "_i", "_cfg", "_count", "_cfgiName", "_markerName", "_cfgiTags"];

waitUntil {time > 1};

_posX = (getPos player) select 0;
_posY = ((getPos player) select 1) + 40;

// Read Config File
_cfg =(configFile >> "CfgObjectCompositions");
_count = count _cfg;

hintSilent "Starting Composition Generation...";

for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do
{
	_cfgiName = configName (_cfg select _i);
	_cfgiTags = getArray ((_cfg select _i) >> "tags");
	
	// Create Marker
	_markerName = createMarker["mrk" + _cfgiName, [_posX + (_i%8)*400, _posY + floor(_i/8)*90 + (_i%2)*45]];
	_markerName setMarkerShape "ICON";
	_markerName setMarkerType "FOB";
	_markerName setMarkerText _cfgiName;
	
	// Marker Color
	if ("west" in _cfgiTags) then { _markerName setMarkerColor "ColorBlue"; };
	if ("east" in _cfgiTags) then { _markerName setMarkerColor "ColorRed"; };
	if ("resistance" in _cfgiTags) then { _markerName setMarkerColor "ColorYellow"; };
	
	// Create Composition
	_newComp = [(getMarkerPos _markerName), (markerDir _markerName), _cfgiName] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
	   
};

hintSilent "..done! \n\n you can teleport around the map by clicking alt & left mouse button";

// Teleport with ALT + LMB
onMapSingleClick "
if ((local player) and _alt) then
{
	player setPos _pos;
}";

};

// Spawn M1A1 TUSK with crew and you.. some random waypoints too...
 fnc_loki_HunKil_Tank1 = {
 
_this = createCenter west;
_center_0 = _this;

group_0 = createGroup _center_0;

_vehicle_1 = objNull;
if (true) then
{
  _this = createVehicle ["M1A2_US_TUSK_MG_EP1", [(position player select 0), (position player select 1) +15 , 0], [], 0, "CAN_COLLIDE"];
  _vehicle_1 = _this;
  _this setDir 86.155197;
  _this setVehicleVarName "M1A2_TUSK_HUNTER";
  M1A2_TUSK_HUNTER = _this;
};

player moveInGunner M1A2_TUSK_HUNTER;
[player] join group_0;

_unit_2 = objNull;
if (true) then
{
  _this = group_0 createUnit ["US_Soldier_Crew_EP1", [(position player select 0), (position player select 1) +17 , 0], [], 0, "CAN_COLLIDE"];
  _unit_2 = _this;
  _this setVehicleInit "this moveInDriver M1A2_TUSK_HUNTER;";
  _this setUnitAbility 0.90000002;
};

_unit_3 = objNull;
if (true) then
{
  _this = group_0 createUnit ["US_Soldier_Crew_EP1", [(position player select 0), (position player select 1) +18 , 0], [], 0, "CAN_COLLIDE"];
  _unit_3 = _this;
  _this setVehicleInit "this moveInCommander M1A2_TUSK_HUNTER;";
  _this setUnitAbility 0.60000002;
  _this setUnitRank "COLONEL";  
  group_0 selectLeader _this;
};

_unit_4 = objNull;
if (true) then
{
  _this = group_0 createUnit ["US_Soldier_Crew_EP1", [(position player select 0), (position player select 1) +18.5 , 0], [], 0, "CAN_COLLIDE"];
  _unit_4 = _this;
  _this setVehicleInit "this moveInTurret [M1A2_TUSK_HUNTER,[0,1]];";
  _this setUnitAbility 0.60000002;
};

hint "Click on the map to set the S.A.D. area.";

onMapSingleClick " 

_this = group_0 addWaypoint [_pos , 10];
_this setWaypointType 'SAD';
_this setWaypointBehaviour 'COMBAT';
_waypoint_0 = _this;

_this = group_0 addWaypoint [[(_pos select 0), (_pos select 1) -random 1000 , 0], 500];
_this setWaypointType 'SAD';
_this setWaypointBehaviour 'COMBAT';
_this setWaypointTimeout [30, 60, 90];
_waypoint_1 = _this;

_this = group_0 addWaypoint [[(_pos select 0), (_pos select 1) +random 720 , 0], 500];
_this setWaypointType 'SAD';
_this setWaypointBehaviour 'COMBAT';
_this setWaypointTimeout [30, 60, 90];
_waypoint_2 = _this;

_this = group_0 addWaypoint [[(_pos select 0), (_pos select 1) +random 1000 , 0], 500];
_this setWaypointType 'CYCLE';
_this setWaypointBehaviour 'COMBAT';
_this setWaypointTimeout [30, 60, 90];
_waypoint_3 = _this;

 hintSilent 'M1A1 TUSK Spawned..\n waypoints are random..\n kill some shit!';
onMapSingleClick '';

true;
";

processInitCommands;

};

//call SPON Scuba
fnc_loki_scuba = {

// Run Core with debugging (real missions won't want debugging, so call with [] instead).
[] call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initCore.sqf";

  // Ensure that SPON Core is running.
  if ((isNil "SPON_Core_version")) exitWith
  {
	Hint "you need SPON Core for the SPON Scuba to work."; // Return.
  };

// Using default values, but show the map markers.
[] call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Scuba\initScuba.sqf";

// Allow the player to scuba!
[1] call SPON_Scuba_enableForPlayer;

hint "SPON Scuba added - Have a nice swim!";
};


//call SPON HoloMap
fnc_loki_HoloMap = {

// Run Core with debugging (real missions won't want debugging, so call with [] instead).
[] call compile preprocessFileLineNumbers "\loki_lost_key\SPON\Core\initCore.sqf";

  // Ensure that SPON Core is running.
  if ((isNil "SPON_Core_version")) exitWith
  {
	Hint "you need SPON Core for the SPON holoMap to work."; // Return.
  };

  if (!(isNull holoMapMobileHQ)) then {deleteVehicle holoMapMobileHQ;};

  _this = createVehicle ["misc01",[(position player select 0) + 3, (position player select 1) , -0.5], [], 0, "CAN_COLLIDE"];
  holoMapMobileHQ = _this;
  _this setVehicleVarName "holoMapMobileHQ";
  holoMapMobileHQ = _this;
  holoMapMobileHQ setVectorUp [0,0,0.1];
  

// Initialise the HoloMap system.
[] call compile preprocessFileLineNumbers "\loki_lost_key\SPON\HoloMap\initHoloMap.sqf";  

// Example base setup, connected to mobile HQ APC. Sensor switchable using PC.
[holoMapMobileHQ, {player}, 2000, 1, side player] call SPON_Holo_projector;

};



//Group Spawn
fnc_loki_groupSpawn = {

//Create objects.

_enemyside = "";
if (side player == west) then {_enemySide = east};
if (side player == east) then {_enemySide = west};

private ["_cpPos", "_grpP"];
_cpPos = markerPos "sZoneLocal";
_type = _this select 0;

switch (_type) do 
		{

			// Enemy Groups
			case 0: {_grpP = [_cpPos, _enemySide, 5 + (random 2),[], [], [0.75, 1]] call BIS_fnc_spawnGroup;};
			case 1: {_grpP = [_cpPos, _enemySide, 10 + (random 5),[], [], [0.75, 1]] call BIS_fnc_spawnGroup;};
			
			// Friendly Groups
			case 50: {_grpP = [_cpPos, side player, 5 + (random 2),[], [], [0.75, 1]] call BIS_fnc_spawnGroup;};
			case 51: {_grpP = [_cpPos, side player, 10 + (random 5),[], [], [0.75, 1]] call BIS_fnc_spawnGroup;};			
					
		};

//[_grpP, _cpPos] call BIS_fnc_taskDefend; 

// give the sides their demeanor
West setFriend [East, 0.1];West setFriend [Resistance, 0.72];West setFriend [Civilian, 1];
East setFriend [Resistance, 0.72];East setFriend [West, 0.1];East setFriend [Civilian, 1];
Resistance setFriend [East, 0.72];Resistance setFriend [West, 0.72];Resistance setFriend [Civilian, 0.72];
Civilian setFriend [East, 1];Civilian setFriend [West, 1];Civilian setFriend [Resistance, 1];

hint "Group spawned";
deleteMarkerLocal sZoneLocal; 
};





//Mando S.A.M. if you have the mando missile .pbo's
fnc_loki_Spawn_MandoSAM = {

createCenter sideLogic;
_grpLogicMando = createGroup sideLogic;
_mandoInit = _grpLogicMando createUnit ["Mando_Missile_ArmA", [1, 1, 1], [], 0, "NONE"];

_grpLogicMando = createGroup sideLogic;
_mandoMissile = _grpLogicMando createUnit ["Mando_Missile_ArmA_full", [1, 1, 1], [], 0, "NONE"];

// Wait for Mando Missile initialization 
waitUntil {!isNil "mando_missile_init_done"};
waitUntil {mando_missile_init_done};

[] execVM "\loki_lost_key\loki_scripts\mmSAM_console_setup.sqf";

};

//LK SCRIPT PACK
fnc_loki_lk_scripts = {

[] execVM "\loki_lost_key\lk\var\lkcom_init.sqf";
[] execVM "\loki_lost_key\lk\var\server_init.sqf";

//on nuclear strike, delete trees?;
dtree=false;

//FOB is a respawn point?;
fobrespawn=true;

//Use the ACE 2 ammo supply drop?;
ace2ammodrop=false;

//Use Ace 2 vehicles drop?;
ace2vehdrop=false;
};

//Created by: Tankbuster // edit loki
//find exact coordinates from within the game.
fnc_loki_locationFinder = {
t_pos = getPos player;
t_pos_x_eastwest = (t_pos select 0);
t_pos_y_northsouth = (t_pos select 1);
t_pos_z_altitude = ((getPosASL player) select 2);
hint format ["East/West = %1 \n North/South = %2 \n Altitude = %3", t_pos_x_eastwest, t_pos_y_northsouth, t_pos_z_altitude];
copyToClipboard format ["East/West = %1, North/South = %2, Altitude = %3", t_pos_x_eastwest, t_pos_y_northsouth, t_pos_z_altitude];
};

//Spawn MandoMissile logics and Console if mma.pbo is installed
fnc_loki_Spawn_MandoMissile = {

createCenter sideLogic;
_grpLogicMando = createGroup sideLogic;
_mandoInit = _grpLogicMando createUnit ["Mando_Missile_ArmA", [1, 1, 1], [], 0, "NONE"];

_grpLogicMando = createGroup sideLogic;
_mandoMissile = _grpLogicMando createUnit ["Mando_Missile_ArmA_full", [1, 1, 1], [], 0, "NONE"];

// Wait for Mando Missile initialization 
waitUntil {!isNil "mando_missile_init_done"};
waitUntil {mando_missile_init_done};

[] execVM "\loki_lost_key\loki_scripts\mma_console_setup.sqf";

};

//Create a SILVIE Logic
fnc_loki_Spawn_SilvieManager_Logic = {

private ["_grpLogicSILVIE", "_SILVIE"];
createCenter sideLogic;
_grpLogicSILVIE = createGroup sideLogic;
_SILVIE = _grpLogicSILVIE createUnit ["SilvieManager", [1, 1, 1], [], 0, "NONE"];
_SILVIE synchronizeObjectsAdd [player];

private ["_ok"];
_ok = [] execVM "ca\modules\silvie\data\scripts\main.sqf";
};

//Create a ALICE Logic
fnc_loki_Spawn_AliceManager_Logic = {

private ["_grpLogicSOM", "_alice"];
createCenter sideLogic;
_grpLogicALICE = createGroup sideLogic;
_alice = _grpLogicALICE createUnit ["AliceManager", [1, 1, 1], [], 0, "NONE"];
_alice synchronizeObjectsAdd [player];

};

// S.O.M. Logic
fnc_loki_Spawn_SECOP_Logic = {

//Create the S.O.M. Logic
private ["_grpLogicSOM", "_som"];
createCenter sideLogic;
_grpLogicSOM = createGroup sideLogic;
_som = _grpLogicSOM createUnit ["SecOpManager", [1, 1, 1], [], 0, "NONE"];
_som synchronizeObjectsAdd [player];

//SOM module with custom settings.
private ["_pool", "_hq", "_callsigns", "_initialDelay", "_autoReinforce", "_secOpSpacing", "_randomActivation", "_secOpDistances", "_settings"];

//List of secops.
//Default: ["ambush", "attack_location", "defend_location", "destroy", "escort", "patrol", "rescue", "search", "trap"]
_pool = ["ambush", "attack_location", "destroy", "escort", "patrol", "rescue", "search", "trap"];

//Enable or disable HQ.
//Default: true
_hq = true;

//Team text, team speech, H.Q. text, H.Q. speech.
//Default: ["ALPHA", ["Alpha"], "H.Q.", ["HQ"]]
_callsigns = ["Razor", ["Razor"], "H.Q.", ["HQ"]];

//Delay in seconds before starting random SecOps selection. Only seems to affect the first secops.
//Default: 30
_initialDelay = ((random 0) + 0);

//Should an automatic Reinforce be triggered when there are casualties?
//Default is true.
_autoReinforce = false;

//Delay between sec ops?
//Default: 30
_secOpSpacing = ((random 30) + 30);

//From 0 to 1. 0 means no secops starting. With 1 they do start.
//Default: 0.7
_randomActivation = 1;

//Min Max distance of sec ops.
//Default: [300, 700]
_secOpDistances = [500, 2000];

_settings = [_pool, _hq, _callsigns, _initialDelay, _autoReinforce, _secOpSpacing, _randomActivation, _secOpDistances];

_som setVariable ["settings", _settings];

[] spawn
{
	Sleep 10;
	[["transport", "aerial_reconnaissance", "supply_drop", "tactical_airstrike", "artillery_barrage"], _som] call BIS_SOM_addSupportRequestFunc;
};

SOM_mainScope = _som getVariable "mainScope";

};

// Spawn an Ambient Life Module
fnc_loki_Spawn_Animals_Logic = {

_logic = _this select 0;
_logic setpos [(position player select 0), (position player select 1) , 0]; 
_fsm = [] execfsm "CA\Modules\Animals\data\fsms\Animals_main.fsm";
hint "Ambient Life Module Spawned.";
};

//Create a high intensity ACM Module.
fnc_loki_Spawn_ACM_Logic = {execVM "\loki_lost_key\loki_scripts\ACM.sqf";};



// Order 66 - kill 'em all
fnc_loki_Order_66 = {execVM "\loki_lost_key\loki_scripts\order66.sqf";};

//unit Counter
fnc_loki_unitCounter = {

//west
_this = createTrigger ["EmptyDetector", position player];
_this setTriggerArea [5000, 5000, 0, false];
_this setTriggerActivation ["WEST", "PRESENT", true];
_this setTriggerStatements ["this", "go = [] execVM ""\loki_lost_key\loki_scripts\counter.sqf""", ""];
_this setEffectCondition "false";
westTrigger = _this;
_trigger_0 = _this;

//east
_this1 = createTrigger ["EmptyDetector", position player];
_this1 setTriggerArea [5000, 5000, 0, false];
_this1 setTriggerActivation ["EAST", "PRESENT", true];
_this1 setTriggerStatements ["this", "go = [] execVM ""\loki_lost_key\loki_scripts\counter.sqf""", ""];
_this1 setEffectCondition "false";
eastTrigger = _this1;
_trigger_1 = _this1;

//Civ
_this2 = createTrigger ["EmptyDetector", position player];
_this2 setTriggerArea [5000, 5000, 0, false];
_this2 setTriggerActivation ["CIV", "PRESENT", true];
_this2 setTriggerStatements ["this", "go = [] execVM ""\loki_lost_key\loki_scripts\counter.sqf""", ""];
_this2 setEffectCondition "false";
CivTrigger = _this2;
_trigger_2 = _this2;

//Resistance
_this3 = createTrigger ["EmptyDetector", position player];
_this3 setTriggerArea [5000, 5000, 0, false];
_this3 setTriggerActivation ["GUER", "PRESENT", true];
_this3 setTriggerStatements ["this", "go = [] execVM ""\loki_lost_key\loki_scripts\counter.sqf""", ""];
_this3 setEffectCondition "false";
ResistanceTrigger = _this3;
_trigger_3 = _this3;

//Animals
_this4 = createTrigger ["EmptyDetector", position player];
_this4 setTriggerArea [5000, 5000, 0, false];
_this4 setTriggerActivation ["AMBIENT LIFE", "PRESENT", true];
_this4 setTriggerStatements ["this", "go = [] execVM ""\loki_lost_key\loki_scripts\counter.sqf""", ""];
_this4 setEffectCondition "false";
AnimalTrigger = _this4;
_trigger_4 = _this4;

//Enemy
_this5 = createTrigger ["EmptyDetector", position player];
_this5 setTriggerArea [5000, 5000, 0, false];
_this5 setTriggerActivation ["ENEMY", "PRESENT", true];
_this5 setTriggerStatements ["this", "go = [] execVM ""\loki_lost_key\loki_scripts\counter.sqf""", ""];
_this5 setEffectCondition "false";
EnemyTrigger = _this5;
_trigger_5 = _this5;

//Unknown
_this6 = createTrigger ["EmptyDetector", position player];
_this6 setTriggerArea [5000, 5000, 0, false];
_this6 setTriggerActivation ["UNKNOWN", "PRESENT", true];
_this6 setTriggerStatements ["this", "go = [] execVM ""\loki_lost_key\loki_scripts\counter.sqf""", ""];
_this6 setEffectCondition "false";
UnknownTrigger = _this6;
_trigger_6 = _this6;

};

//lost key credits
fnc_loki_credits = {closeDialog 0; [] execVM "\loki_lost_key\GUI\scripts\credits.sqf";};

// Random Intro Picker Function
fnc_loki_intro_picker = {

fncAddIntro = {

	3 cutRsc ["lostkey","PLAIN",5];

  switch _this do
	{
    case 0: 
	{
	Sleep 3;
	1 cutRsc ["Loki_FU","PLAIN",2]; 
	sleep 10;
	[localize "STR_INTRO_x0", localize "STR_INTRO_x0a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	
    case 1: 
	{
	
	sleep 3;
	1 cutRsc ["sanford","PLAIN",2];
	sleep 10;
	[localize "STR_INTRO_x1", localize "STR_INTRO_x1a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	
    case 2: 
	{
	Sleep 3;	
	1 cutRsc ["redfist","PLAIN",2]; 
	sleep 10;
	[localize "STR_INTRO_x2", localize "STR_INTRO_x2a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	
	case 3: 
	{
	Sleep 3;	
	1 cutRsc ["resistance","PLAIN",2];
	sleep 10;
	[localize "STR_INTRO_x3", localize "STR_INTRO_x3a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	};
};
IntroCount = 4;
fncPickIntro = {
  if isserver then {
    if (count Intro != 0) then {
      addIntro = Intro select (floor random count Intro);
      Intro = Intro - [addIntro];
      publicvariable "addIntro";
      if !isdedicated then { addIntro call fncAddIntro };
    };
  };
};  
  
if isserver then {
  Intro = [];
  for "_i" from 0 to (IntroCount - 1) do {
    Intro set [_i,_i];
  };
} else {
  [] spawn {
    waituntil {!isnil "addIntro"};
    addIntro call fncAddIntro;
    "addIntro" addpublicvariableeventhandler {(_this select 1) call fncAddIntro};
  };
};  
call fncPickIntro; // add random Intro for fun	  
};

// Random Intro Music Picker Function
fnc_loki_music_picker = {

fnc_loki_AddMusic = {
  switch _this do
	{
    case 0: 
	{
	playSound "Mission_Intro";
    };
    case 1: 
	{
	playSound "Mission_Intro1";
    };
    case 2: 
	{
	playSound "Mission_Intro2";
	};
    case 3: 
	{
	playSound "Mission_Intro3";
    };
	};
};

MusicCount = 4;
fnc_loki_PickMusic = {
  if isserver then {
    if (count Music != 0) then {
      addMusic = Music select (floor random count Music);
      Music = Music - [addMusic];
      publicvariable "addMusic";
      if !isdedicated then { addMusic call fnc_loki_AddMusic };
    };
  };
};  
  
if isserver then {
  Music = [];
  for "_i" from 0 to (MusicCount - 1) do {
    Music set [_i,_i];
  };
} else {
  [] spawn {
    waituntil {!isnil "addMusic"};
    addMusic call fnc_loki_AddMusic;
    "addMusic" addpublicvariableeventhandler {(_this select 1) call fnc_loki_AddMusic};
  };
};  
call fnc_loki_PickMusic; // add random Music for fun	  
};

//lost key known issues
fnc_loki_knownIssues = {closeDialog 0; [] execVM "\loki_lost_key\GUI\scripts\issues.sqf";};

//how to use the lost key
fnc_loki_howTo = {closeDialog 0; [] execVM "\loki_lost_key\GUI\scripts\howTo.sqf";};


// about the lost key 
fnc_loki_About = {closeDialog 0; [] execVM "\loki_lost_key\GUI\scripts\about.sqf";};


//need some BIS support?
fnc_loki_SSM_create = {

 player execVM '\ca\modules_e\ssm\data\scripts\init.sqf';
 hint " Simple Support Module Fuctions added to your command menu (spacebar)";
 player setvariable ["BIS_SSM_UnitRequestConfigArray",[["Custom Squad",0.5,["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT"]]]];

};


//Spawn a small scalar tower for fun
fnc_loki_Scalar_Spawner = {
  _this = createVehicle ["Land_Farm_WTower",(getMarkerPos "tower_spawn_center"), [], 0, "CAN_COLLIDE"];
  _this setpos [(position player select 0) + 20, (position player select 1) , 0];
  _scalar_tower = _this;
  _this setVehicleVarName "scalarTower99";
  scalarTower99 = _this;
  scalarTower99 setVectorUp [0,0,0.1];

  YNH = [scalarTower99] execVM "\loki_lost_key\loki_scripts\scalar\scalar.sqf";
};

//Spawn a big scalar tower for even more fun
fnc_loki_Scalar_SpawnerBig = {

	hint "NOTE: Scalar TowerBig can ONLY be destroyed by using -- scalarTower98b setdamage 1";

  _this = createVehicle ["Land_A_TVTower_Base",(getMarkerPos "tower_spawn_center_big"), [], 0, "CAN_COLLIDE"];
  _this setpos [(position player select 0) + 40, (position player select 1) , 0];
  _scalar_towerBig = _this;
  _this setVehicleVarName "scalarTower98";
  scalarTower98 = _this;
  scalarTower98 setVectorUp [0,0,0.1];
    
   _this1 = createVehicle ["Land_A_TVTower_Mid",(getMarkerPos "tower_spawn_center_big"), [], 0, "CAN_COLLIDE"];
   _this1 setpos [(position player select 0) + 40, (position player select 1) , 0];   
   _scalar_towerBiga = _this1;
   _this1 setVehicleVarName "scalarTower98a";
   scalarTower98a = _this1; 

   _this2 = createVehicle ["Land_A_TVTower_Top",(getMarkerPos "tower_spawn_center_big"), [], 0, "CAN_COLLIDE"];
   _this2 setpos [(position player select 0) + 40, (position player select 1) , 0];
   _scalar_towerBigb = _this2;
   _this2 setVehicleVarName "scalarTower98b";
   scalarTower98b = _this2;   
 
  YNH = [scalarTower98b] execVM "\loki_lost_key\loki_scripts\scalar\scalarBig.sqf";
};

// Create a SatPhone to use R3F arty
fnc_SatPhone_Create = {
_vehicle_SatPhone = objNull;
	if (true) then
	{
		_this = createVehicle ["satPhone", position player, [], 0, "CAN_COLLIDE"];
		_vehicle_SatPhone = _this;
		_this setVehicleinit "go = [this] execVM ""\loki_lost_key\R3F_ARTY_AND_LOG\create_arty_quarter.sqf"";";
		_this setPos (position player);
		processInitCommands; 
   	};
};

// Repair
fnc_loki_repair = {
if (vehicle player == player) then {player setDamage 0; cursorTarget setDamage 0; cursorTarget setFuel 1;} else {vehicle player setDamage 0;vehicle player setFuel 1;player setDamage 0; };closeDialog 0;
};

// Spectator Mode
fnc_loki_Spectator = {
KEGs_can_exit_spectator = true; KEGs_no_butterfly_mode = true; aspec = [player, objNull, "x"] execVM "\loki_lost_key\spect\specta.sqf"; closedialog 0;
};

//loki FPS checker
fnc_loki_FPS = {
if (isNil "LOKI_fpsMonitor") then { LOKI_fpsMonitor = true; } else { LOKI_fpsMonitor = not LOKI_fpsMonitor;};
if (LOKI_fpsMonitor) then {  [] spawn { while { LOKI_fpsMonitor } do  { hintsilent str diag_FPS; sleep 1 };};};
};

// populate the side menu arrays
fnc_loki_sideMenu_Call = {
[west, "West", 72144] execVM '\loki_lost_key\menus\comboVeh.sqf';
[east, "East", 72146] execVM '\loki_lost_key\menus\comboVeh.sqf';
[resistance, "Armed Locals", 72148] execVM '\loki_lost_key\menus\comboVeh.sqf';
[civilian, "Civilians", 721499] execVM '\loki_lost_key\menus\comboVeh.sqf';

[west, "West", 721436] execVM '\loki_lost_key\menus\comboVeh2.sqf';
[east, "East", 721438] execVM '\loki_lost_key\menus\comboVeh2.sqf';
[resistance, "Armed Locals", 721440] execVM '\loki_lost_key\menus\comboVeh2.sqf';
[civilian, "Civilians", 721442] execVM '\loki_lost_key\menus\comboVeh2.sqf';
};

// sZone Marker creation
fnc_loki_sZone_marker_create = {
deleteMarkerLocal sZoneLocal; 
deleteMarkerLocal sZoneAnimLocal;
sZoneLocal = createMarkerLocal ["sZoneLocal",[0,0,0]];
sZoneAnimLocal = createMarkerLocal ["supportZoneAnim",[0,0,0]];
sZoneLocal setMarkerPosLocal [getPos player select 0, getPos player select 1];
sZoneLocal setMarkerBrushLocal "SOLID";
sZoneLocal setMarkerShapeLocal "ELLIPSE";
sZoneLocal setMarkerColorLocal "ColorGreen";
sZoneLocal setMarkerDirLocal 0;
sZoneLocal setMarkerSizeLocal [50,50];
sZoneAnimLocal setMarkerPosLocal [0,0];
sZoneAnimLocal setMarkerShapeLocal "ICON";
sZoneAnimLocal setMarkerTypeLocal "Arrow";
sZoneAnimLocal setMarkerColorLocal "ColorBlack";
sZoneAnimLocal setMarkerTextLocal "";
sZoneAnimLocal setMarkerDirLocal 0;
sZoneAnimLocal setMarkerSizeLocal [0.5,1];
};
// sZone Marker color and size creation for arty
fnc_loki_sZone_marker_create2 = {
_sizeA = _this select 0;
_sizeB = _this select 1;
_color = _this select 2;

sZoneLocal setMarkerSizeLocal [_sizeA,_sizeB]; sZoneLocal setMarkerColorLocal _color; sZoneLocal setMarkerShapeLocal "ELLIPSE"; sZoneAnimLocal setMarkerPosLocal [0,0]; onMapSingleClick "sZoneLocal setMarkerPosLocal _pos"
};
// sZone Marker color and size creation for arty rotate
fnc_loki_sZone_marker_create2a = {
_sizeA = _this select 0;
_sizeB = _this select 1;
_color = _this select 2;

sZoneLocal setMarkerSizeLocal [_sizeA,_sizeB]; sZoneLocal setMarkerColorLocal _color; sZoneLocal setMarkerShapeLocal "ELLIPSE"; sZoneAnimLocal setMarkerPosLocal (getMarkerPos sZoneLocal); onMapSingleClick "sZoneLocal setMarkerPosLocal _pos; sZoneAnimLocal setMarkerPosLocal _pos"};		

	


//Mischief stuff
fnc_loki_add_c4 = {
hint "8 C4's added...";
player addWeapon ("Put"); 
player addMagazine ("PipeBomb"); player addMagazine ("PipeBomb"); 
player addMagazine ("PipeBomb"); player addMagazine ("PipeBomb"); 
player addMagazine ("PipeBomb"); player addMagazine ("PipeBomb"); 
player addMagazine ("PipeBomb"); player addMagazine ("PipeBomb");
};

fnc_loki_go = {
hint "Go Loki -- body armor, view 5000m, uber weapons";
player addEventHandler ["handleDamage", { (damage (_this select 0)) + ((_this select 2) * 0.1) }];
setViewDistance 5000;
player addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
};

fnc_loki_gogo = {
hint "Go Go Loki -- God's body armor, View 5000m, Uber Weapons, Ghost Mode On";
player setCaptive true;
setViewDistance 5000;
player addEventHandler ["handleDamage", { false }];
player addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
};
// UBER Weapons
fnc_loki_uber_weap = {
hint "Uber Weapons On";

[] spawn {
	while {true} do {
		sleep 0.5;
		_mags = magazines player;
		{
			if !(_x in _mags) then {
				player addMagazine _x;
			};
		}forEach magazines player;
		{
			(vehicle _x) setVehicleAmmo 1;
		}forEach units group player;
	};
};
};






