
lbClear 72011;


lbAdd [72011,"Spawn Enemy Group 1"];
lbAdd [72011,"Spawn Enemy Group 2"];

lbSetCurSel [72011,0];

Request2 = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{
		
		case "Spawn Enemy Group 1": {[0] execVM '\loki_lost_key\loki_scripts\GroupSpawn.sqf';};
		case "Spawn Enemy Group 2": {[1] execVM '\loki_lost_key\loki_scripts\GroupSpawn.sqf';};
		
	};
};


LN_ListBoxSel = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{

		
		case "Spawn Enemy Group 1": {};
		case "Spawn Enemy Group 2": {};
	};
};

