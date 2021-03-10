closeDialog 0; 
waitUntil{!dialog};
LOKI_GUI_Key_Color = LOKI_GUI_Key_Color - 1;
[72003] execVM "\loki_lost_key\GUI\scripts\Color_Settings.sqf";

createDialog 'Master_Loki_Dialog_Work2';

call fnc_loki_sideMenu_Call;
