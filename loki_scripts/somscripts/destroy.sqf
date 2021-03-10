//Create a S.O.M. Logic
private ["_grpLogicSOM", "_somDestroy"];
createCenter sideLogic;
_grpLogicSOM = createGroup sideLogic;
_somDestroy = _grpLogicSOM createUnit ["SecOpManager", [1, 1, 1], [], 0, "NONE"];
_somDestroy synchronizeObjectsAdd [player];

//SOM module with custom settings.
private ["_pool", "_hq", "_callsigns", "_initialDelay", "_autoReinforce", "_secOpSpacing", "_randomActivation", "_secOpDistances", "_settings"];

//List of secops.
//Default: ["ambush", "attack_location", "defend_location", "destroy", "escort", "patrol", "rescue", "search", "trap"]
_pool = ["destroy"];

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
_secOpSpacing = 999;

//From 0 to 1. 0 means no secops starting. With 1 they do start.
//Default: 0.7
_randomActivation = 1;

//Min Max distance of sec ops.
//Default: [300, 700]
_secOpDistances = [500, 2000];

_settings = [_pool, _hq, _callsigns, _initialDelay, _autoReinforce, _secOpSpacing, _randomActivation, _secOpDistances];

_somDestroy setVariable ["settings", _settings];

[] spawn
{
	Sleep 10;
	[["transport", "aerial_reconnaissance", "supply_drop", "tactical_airstrike", "artillery_barrage"], _somDestroy] call BIS_SOM_addSupportRequestFunc;
};

SOM_mainScope = _somDestroy getVariable "mainScope";

sleep 60;
_randomActivation = 0;