//Configure SOM module with custom settings. Must run during the first 2 seconds of a mission.

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
_initialDelay = ((random 300) + 300);

//Should an automatic Reinforce be triggered when there are casualties?
//Default is true.
_autoReinforce = true;

//??? Delay between sec ops?
//Default: 30
_secOpSpacing = ((random 300) + 300);

//??? From 0 to 1. 0 means no secops starting. With 1 they do start. Some kind of chance variable?
//Default: 0.7
_randomActivation = 0;

//Min Max distance of sec ops.
//Default: [300, 700]
_secOpDistances = [300, 700];

_settings = [_pool, _hq, _callsigns, _initialDelay, _autoReinforce, _secOpSpacing, _randomActivation, _secOpDistances];

//BIS_SOM is module name.
SOM setVariable ["settings", _settings];