
SOMsupport = _this select 0;

SOMsupport removeaction act1;
SOMsupport removeaction act2;
SOMsupport removeaction act3;
SOMsupport removeaction act4;
SOMsupport removeaction act5;
SOMsupport removeaction act6;
SOMsupport removeaction act7;
SOMsupport removeaction act8;
SOMsupport removeaction act9;
SOMsupport removeaction act10;
SOMsupport removeaction act11;


if ambush then {act1 = SOMsupport addaction ["SOM Ambush Mission", "somscripts\ambush.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Ambush Mission is not available"};
sleep 0.02;
if attack then { act2 = SOMsupport addaction ["SOM Attack Location Mission", "somscripts\attack.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Attack Location Mission is not available"};
sleep 0.02;
if rescue then { act3 = SOMsupport addaction ["SOM Rescue Mission", "somscripts\rescue.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Rescue Mission is not available"};
sleep 0.02;
if defend then { act4 = SOMsupport addaction ["SOM Defend Location Mission", "somscripts\defend.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Defend Location Mission is not available"};
sleep 0.02;
if patrol then { act5 = SOMsupport addaction ["SOM Patrol Mission", "somscripts\patrol.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Patrol Mission is not available"};
sleep 0.02;
if escort then { act6 = SOMsupport addaction ["SOM Escort Mission", "somscripts\escort.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Escort Mission is not available"};
sleep 0.02;
if destroy then { act7 = SOMsupport addaction ["SOM Destroy Mission", "somscripts\destroy.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Destroy Mission is not available"};
sleep 0.02;
if search then { act8 = SOMsupport addaction ["SOM Search Mission", "somscripts\search.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Search Mission is not available"};
sleep 0.02;
if trap then { act9 = SOMsupport addaction ["SOM Trap Mission", "somscripts\trap.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Trap Mission is not available"};
sleep 0.02;
if reinforce then { act10 = SOMsupport addaction ["SOM Reinforcments", "somscripts\reinforce.sqf", [], 1, false, true, "", ""]} else {sleep 1; hint "Reinforcments are not available"};
sleep 0.02;

act11 = SOMsupport addaction ["Close Menu", "somscripts\menu\close_menu.sqf", [], 1, false, true, "", ""];