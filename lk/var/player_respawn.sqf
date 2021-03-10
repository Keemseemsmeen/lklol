WaitUntil{not alive player};
WaitUntil{alive player};

if ( (!isServer) && (player != player) ) then{};
if !(isnull player) then {
if (player == player) then {hint "you are LKCOM"};
nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";
player addeventhandler ["Killed", {_this execVM "\loki_lost_key\lk\var\player_respawn.sqf"}];
coin setpos (getpos hq1d);
coin setvariable ["BIS_COIN_rules",[player],true];
};