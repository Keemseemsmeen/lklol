private ["_grpLogic", "_acm", "_garbageMan"];
createCenter sideLogic;
_grpLogic = createGroup sideLogic;
_acm = _grpLogic createUnit ["AmbientCombatManager", [1, 1, 1], [], 0, "NONE"];
_acm synchronizeObjectsAdd [player];

_garbageMan = _grpLogic createUnit ["BattleFieldClearance", [1, 1, 1], [], 0, "NONE"];
_garbageMan synchronizeObjectsAdd [player];

waitUntil {!(isNil "BIS_ACM_setIntensityFunc")};
[2, _acm] call BIS_ACM_setIntensityFunc;

waitUntil {!(isNil "BIS_ACM_setSpawnDistanceFunc")};
[_acm, 100, 500] call BIS_ACM_setSpawnDistanceFunc;