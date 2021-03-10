nukev=true;
nukehold=true;
onMapSingleClick "";
onMapSingleClick "";

hint "Nuclear Strike has been Canceled";

deletevehicle nukepos;

nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";
