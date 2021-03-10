

nohq=true;
hqdp=false;
dhq=false;

supply =true;
ammo=true;
para=true;
th=true;
nukev=true;

nul = [player] execVM "\loki_lost_key\lk\menu\close_menu.sqf";
player addeventhandler ["Killed", {_this execVM "\loki_lost_key\lk\var\player_respawn.sqf"}]