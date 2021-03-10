
lbClear 72011;

lbAdd [72011,"CH-47"];
lbAdd [72011,"MH6J_EP1"];
lbAdd [72011,"MV22"];
lbAdd [72011,"Mi24_D"];
lbAdd [72011,"MH60S"];
lbAdd [72011,"UH1Y"];
lbAdd [72011,"UH60M_MEV_EP1"];
lbAdd [72011,"Mi17_medevac_RU"];
lbAdd [72011,"  ---  "];
lbAdd [72011,"  TESTING SECTION  "];
lbAdd [72011,"  ---  "];



lbSetCurSel [4,0];

Request2 = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{
		case "CH-47": {[player, "CH_47F_EP1"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};	
		case "MH6J_EP1": {[player, "MH6J_EP1"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};
		case "MV22": {[player, "MV22"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};	
		case "Mi24_D": {[player, "Mi24_D"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};
		case "MH60S": {[player, "MH60S"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};	
		case "UH1Y": {[player, "UH1Y"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};
		case "UH60M_MEV_EP1": {[player, "UH60M_MEV_EP1"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};
		case "Mi17_medevac_RU": {[player, "Mi17_medevac_RU"] execVM '\loki_lost_key\loki_scripts\extraction.sqf'};
		

		
	};
};


LN_ListBoxSel = 
{
	switch (lbText [72011,lbCurSel 72011]) do
	{
		case "CH-47": {};		
		case "MH6J_EP1": {};
		case "MV22": {};
		case "Mi24_D": {};
		case "MH60S": {};
		case "UH1Y": {};
		case "UH60M_MEV_EP1": {};
		case "Mi17_medevac_RU": {};
		

	};
};

