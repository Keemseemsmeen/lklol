
createcenter sidelogic;
_grp = creategroup sidelogic;


coin = _grp createunit ["ConstructionManager", [0,0,1],[], 0,"none"];
nul = [coin] execVM "\loki_lost_key\lk\fob\coin.sqf";

UAVmod = _grp createunit ["UAVManager", [0,0,1],[], 0,"none"];
UAVmod setvariable ["name","RQ-1 Predator"];
UAVmod setvariable ["rules",[West]];

SOM = _grp createunit ["SecOpManager", [0,0,1],[], 0,"none"];
SOM synchronizeObjectsAdd [player];
SOM setvariable ["rules",[player]];
SOM setVariable ["settings", [[], true, nil, nil, false]];
execVM "\loki_lost_key\lk\oth\somsettings.sqf";

HC = _grp createunit ["HighCommand",position player,[],0,"none"];
HCs = _grp createunit ["HighCommandSubordinate",position player,[],0,"none"];
HCs synchronizeObjectsAdd [HC];
HC synchronizeObjectsAdd [player];

if (player == player) then {hint "LK Script Pack v0.8"};

fob = false;

setPitchBank = compile preprocessfile "\loki_lost_key\lk\oth\setPitchBank.sqf";




