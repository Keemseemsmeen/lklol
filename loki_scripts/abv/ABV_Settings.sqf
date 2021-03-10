 if ((isServer) && !(local player)) exitwith{};

// closeDialog 0;
createDialog "LOKI_settingsDialog";

LV_GroundVD = "";

ctrlSetText [1,(format ["%1",LV_GroundVD])];


lbAdd [3,"Very Low"];
lbAdd [3,"Low"];
lbAdd [3,"Normal"];
lbAdd [3,"High"];
lbAdd [3,"Very High"];

lbSetCurSel [3,(LV_TerrainDetail)];

lbAdd [2,"Off"];
lbAdd [2,"20%"];
lbAdd [2,"40%"];
lbAdd [2,"60%"];
lbAdd [2,"80%"];
lbAdd [2,"100%"];

lbSetCurSel [2,(LV_Fog)];

lbAdd [5,"Clear"];
lbAdd [5,"Partly Sunny"];
lbAdd [5,"Cloudy"];
lbAdd [5,"Rain"];
lbAdd [5,"Heavy Rain"];
lbAdd [5,"Storm"];

lbSetCurSel [5,(LV_Weather)];



BM_set =
{
	
	
LV_GroundVD = parseNumber (ctrlText 1);
setviewdistance LV_GroundVD;
	
		switch (lbCurSel 3) do
	{
		case 0: {setTerrainGrid 50; LV_TerrainDetail = 0};
		case 1: {setTerrainGrid 25; LV_TerrainDetail = 1};
		case 2: {setTerrainGrid 12.5; LV_TerrainDetail = 2};
		case 3: {setTerrainGrid 6.25; LV_TerrainDetail = 3};
		case 4: {setTerrainGrid 3.125; LV_TerrainDetail = 4};
	};

		switch (lbCurSel 2) do
	{
		case 0: {3 setFog 0; LV_Fog = 0};
		case 1: {3 setFog 0.20; LV_Fog = 1};
		case 2: {3 setFog 0.40; LV_Fog = 2};
		case 3: {3 setFog 0.60; LV_Fog = 3};
		case 4: {3 setFog 0.80; LV_Fog = 4};
		case 5: {3 setFog 1; LV_Fog = 5};
	};	
		switch (lbCurSel 5) do
	{
		case 0: {3 setovercast 0; 3 setRain 0; LV_Weather = 0};
		case 1: {3 setovercast 0.2; 3 setRain 0.20; LV_Weather = 1};
		case 2: {3 setovercast 0.4; 3 setRain 0.40; LV_Weather = 2};
		case 3: {3 setovercast 0.6; 3 setRain 0.60; LV_Weather = 3};
		case 4: {3 setovercast 0.8; 3 setRain 0.80; LV_Weather = 4};
		case 5: {3 setovercast 1; 3 setRain 1; LV_Weather = 5};
	};	
	
	closeDialog 0;
};