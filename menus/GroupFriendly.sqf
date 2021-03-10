
lbClear 72011;


lbAdd [72011,"Spawn Friendly Group 1"];
lbAdd [72011,"Spawn Friendly Group 2"];

lbSetCurSel [72011,0];

Request2 = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{
		
		case "Spawn Friendly Group 1": {[50] execVM '\loki_lost_key\loki_scripts\GroupSpawn.sqf';};
		case "Spawn Friendly Group 2": {[51] execVM '\loki_lost_key\loki_scripts\GroupSpawn.sqf';};
		
	};
};


LN_ListBoxSel = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{

		
		case "Spawn Friendly Group 1": {};
		case "Spawn Friendly Group 2": {};
	};
};

