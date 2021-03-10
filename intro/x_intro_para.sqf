if (isserver and (isNull player)) exitWith {};

waitUntil {player == player};

setViewDistance 6000;

player setPos [(markerPos "HALO_Start") select 0 , (markerPos "HALO_Start") select 1, ((markerPos "HALO_Start") select 2) +2200];

_height = 3200;

[player, _height + random 50] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";

call fncYNH_intro_picker;
call fncYNH_music_picker;

sleep 60;
if (isMultiplayer) then {
setViewDistance lk_ViewDistance;
} else {setViewDistance 1500};

