player removeaction playerac1;

lavhqtrig = createTrigger ["EmptyDetector", [0,0,0]]; 
lavhqtrig setTriggerArea [0, 0, 0, false];
lavhqtrig setTriggerActivation ["NONE", "present", false];
lavhqtrig setTriggerStatements ["!alive lavhq1", "hint ""LAV HQ has been destroyed""; nohq=true; hqdp=false; dhq=false; nul = [player] execVM ""\loki_lost_key\lk\menu\close_menu.sqf""", ""];


lavhq1 = "LAV25_HQ" createVehicle (position player);

nohq=false;

dhq=true;

nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";

