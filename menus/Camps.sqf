
lbClear 72011;

lbAdd [72011,"  ---  "];
lbAdd [72011,"WEST CAMPS"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"smallbase"];
lbAdd [72011,"bunkerMedium05"];
lbAdd [72011,"fuelDepot_US"];
lbAdd [72011,"GuardPost3_US_EP1"];
lbAdd [72011,"GuardPost4_US"];
lbAdd [72011,"AntiAir1_US"];
lbAdd [72011,"Camp1_US"];
lbAdd [72011,"FireBase1_US"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"EAST CAMPS"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"  ---  "];
lbAdd [72011,"GUER CAMPS"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"  ---  "];
lbAdd [72011,"CIV CAMPS"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"  ---  "];
lbAdd [72011,"SHOOTING RANGES"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"  ---  "];
lbAdd [72011,"SPAWN ALL BIS CAMPS"];


lbSetCurSel [72011,0];

Request2 = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{
		case "smallbase": {Camp_01 = [getPos player, random 360, "smallbase"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};	
		case "bunkerMedium05": {Camp_01 = [getPos player, random 360, "bunkerMedium05"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};
		case "fuelDepot_US": {Camp_01 = [getPos player, random 360, "fuelDepot_US"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};
		case "GuardPost3_US_EP1": {Camp_01 = [getPos player, random 360, "GuardPost3_US_EP1"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};
		case "GuardPost4_US": {Camp_01 = [getPos player, random 360, "GuardPost4_US"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};
		case "AntiAir1_US": {Camp_01 = [getPos player, random 360, "AntiAir1_US"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};
		case "Camp1_US": {Camp_01 = [getPos player, random 360, "Camp1_US"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};
		case "FireBase1_US": {Camp_01 = [getPos player, random 360, "FireBase1_US"] call (compile (preprocessFileLineNumbers 'ca\modules\dyno\data\scripts\objectMapper.sqf'));};
		

		case "SPAWN ALL BIS CAMPS": {call fnc_loki_CampSpawn_All; hint 'WARNING \n\n spawn in a 5km x 5km open area!\n\n there are alot of camps!';};
		
	};
};


LN_ListBoxSel = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{
		case "smallbase": {};		
		case "bunkerMedium05": {};
		case "fuelDepot_US": {};
		case "GuardPost3_US_EP1": {};
		case "GuardPost4_US": {};
		case "AntiAir1_US": {};
		case "Camp1_US": {};
		case "FireBase1_US": {};
		case "SPAWN ALL BIS CAMPS": {};
		

	};
};

