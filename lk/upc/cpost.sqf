//===================================FOB-C================================
hq1d removeaction hq1dac1;
cpostup = false;

publicvariable "cpostup";


hq1ct = "FoldTable" createVehicle getpos hq1d;
hq1ct attachto [hq1d,[2,0,0.7]];
hq1ct setDir 90;
hq1ct enablesimulation false;

hq1csp ="SatPhone" createVehicle getPos hq1ct;
hq1csp attachTo [hq1ct,[0.8,0.2,0.6]];
hq1csp setDir 180;

hq1clp ="Notebook" createVehicle getPos hq1ct;
hq1clp attachTo [hq1ct,[0,0.2,0.6]];

hq1ctv ="SmallTV" createVehicle getPos hq1ct;
hq1ctv attachTo [hq1ct,[-0.8,0.2,0.9]];

hq1ccn = "Land_CamoNetVar_NATO" createVehicle getpos hq1d;
hq1ccn attachto [hq1d,[0,0,2]];
hq1ccn setDir 180;
hq1ccnt enablesimulation false;

hq1clpac1 = hq1clp addAction ["FOB Command Menu", "lkscripts\cmenu\fobc_menu.sqf", [], 0, true, true, "", ""];

[] exec "lkscripts\cmenu\c_init.sqf"

//===================================FOB-C================================