player removeaction playerac1;
player removeaction playerac2;
player removeaction playerac3;
player removeaction playerac4;
player removeaction playerac5;
player removeaction playerac6;
player removeaction playerac7;
player removeaction playerac8;





if nohq then {playerac1 = player addaction ["LAV HQ", "\loki_lost_key\lk\fob\lavhq.sqf", [], 809, false, true, "", ""]};
if hqdp then {playerac1 = player addaction ["Decamp FOB", "\loki_lost_key\lk\fob\delete_fob.sqf", [], 808, true, true, "", ""]};
if dhq then {playerac1 = player addaction ["Deploy FOB", "\loki_lost_key\lk\fob\deploy_fob.sqf", [], 807, true, true, "", ""]};
if (supply && hqdp) then {playerac2 = player addaction ["Vehicle Drop", "\loki_lost_key\lk\upc\sd1.sqf", [], 806, false, true, "", ""]};
if (ammo && hqdp) then {playerac3 = player addaction ["Ammo Drop", "\loki_lost_key\lk\upc\sd2.sqf", [], 805, false, true, "", ""]};
if (para && hqdp) then {playerac4 = player addaction ["Paratroopers", "\loki_lost_key\lk\upc\para.sqf", [], 804, false, true, "", ""]};
if (th && hqdp) then {playerac5 = player addaction ["Tomahawk Strike", "\loki_lost_key\lk\tomahawk\launch.sqs", [], 803, false, true, "", ""]};
if (nukev && hqdp) then {playerac6 = player addaction ["Nuclear Bomb", "\loki_lost_key\lk\nuke\nuke_incoming.sqf", [], 802, false, true, "", ""]};
if (!nukev) then {playerac7 = player addaction ["Cancel Nuclear strike", "\loki_lost_key\lk\nuke\cancel_nuke.sqf", [], 801, false, true, "", ""]};

playerac8 = player addaction ["Close Menu", "\loki_lost_key\lk\menu\close_menu.sqf", [], 800, false, true, "", ""];