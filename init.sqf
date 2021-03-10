// the Lost Key by loki


//Create a Function Logic if not present -- needed for alot of shit
createCenter sideLogic;
_grpLogicFunctionsManager = createGroup sideLogic;
_FunctionsManager = _grpLogicFunctionsManager createUnit ["FunctionsManager", [1, 1, 1], [], 0, "NONE"];
//_FunctionsManager setVehicleVarName "bis_missionscope";

waituntil {!isnil "bis_fnc_init"};

// add zAddAction
[]spawn
{
private["_veh", "_idx"];
_idx = -1;
//if (isDedicated) exitWith{};
while {true} do
{
   if (_idx == -1) then
   {
      _idx = (vehicle player) addAction [("<t color=""#00d9ff"">" + ("> Lost Key") + "</t>"), "\loki_lost_key\start.sqf"];
      _veh = vehicle player;
   };

   if (_veh != vehicle player) then
   {
      _veh removeAction _idx;
      _idx = -1;      
   };
   Sleep 1;
};
};

LOKI_GUI_Key_Color = 1;
LOKI_GUI_Key_Color = LOKI_GUI_Key_Color -1;

"destroyObjects" addPublicVariableEventHandler
{
    _objects = _this select 1;
    {_x setdammage 1} forEach _objects;
};

#include "\loki_lost_key\functions\fnc_loki.sqf"

if (format ["%1", name player]=="loki") then {
#include "\loki_lost_key\R3F_ARTY_AND_LOG\init.sqf";
};

_vehicle_1 = objNull;
if (true) then
{
  _this = createVehicle ["HeliHEmpty", [4821.6587, 4560.7803, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_1 = _this;
  _this setVehicleVarName "core";
  core = _this;
  _this setpos [(position player select 0) + 10, (position player select 1) , 0];
};

_core = _this;
_dir = direction _core;
_pos = getpos _core;

waitUntil {!isNil "core"};
[core] execVM "\loki_lost_key\proving_ground\init.sqf";

//*****************************************//
/*	init.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*/

//Check for Addon
if (!(isClass(configFile>>"CfgPatches">>"LDL_ac130"))) then 
{
	//No Addon detected
	//Spawn LDL_init
	LDL_init = compile preprocessFileLineNumbers "\loki_lost_key\LDL_ac130\LDL_init.sqf";
	[]spawn LDL_init;
}
else
{
	//Addon detected.
	//LDL_init = compile preprocessFileLineNumbers "\loki_lost_key\LDL_ac130\LDL_init.sqf";
	//[]spawn LDL_init;
};

//Wait for the init
waitUntil {!isNil "LDL_initDone"};
waitUntil {LDL_initDone};

//*****************************************//

//Options for the AC-130 (optional)
LDL_options =
[
	1000,  //0:  Default radius for the rotating AC130. Default: 1000
	700,  //1:  Default height for the rotating AC130. Default: 700
	1000,  //2:  Munition for the 25mm. Default: 1000
	50,    //3:  Munition for the 40mm. Default: 50
	20,    //4:  Munition for the 105mm. Default: 20
	true,  //5:  Show Infantry Strobes at startup. Default: true
	false, //6:  Show Vehicle Detection at startup. Default: false
	false, //7:  Activate 360� view. Default: false
	false, //8:  Show waypoints for rotating AC130. Default: false
	true,  //9:  Show particles (smoke, tracer etc.); Default: true
	9.5,   //10: Maximum zoom level for the 25mm. Default: 9.5 (only numbers between 1 and 10)
	9,     //11: Maximum zoom level for the 40mm. Default: 9 (only numbers between 1 and 10)
	8,     //12: Maximum zoom level for the 105mm. Default: 8 (only numbers between 1 and 10)
	-1,    //13: Time in seconds when AC130 script stops. Default: -1 (infinite)
	180,   //14: Time in seconds the AI controlled AC130 stays in the air. Default: 180
	true,  //15: Disable Vehicle Detection (Enemy and friendly units). Default: true
	false, //16: Disable Infantry Strobes. Default: false
	false, //17: Disable Monitor. Default: false
	false, //18: Disable third-person view. Default: false
	1,     //19: Camera effect at startup: 1 (Nothing), 2 (FLIR white), 3 (FLIR black), 4 (NVG). Default: 1
	10,     //20: Delay for mapclick AC130 to arrive. Default: 120
	true,  //21: Sequence at startup. Default: true
	30,	 //22: Available AC130 mapclicks per player. Default: 3
	false, //23: Disable Sounds. Default: false
	false	 //24: Enable Optical Zoom. Default: false !BETA only available for rotating AC130 BETA!
];
