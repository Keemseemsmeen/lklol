closeDialog 0; 
waitUntil{!dialog};
LOKI_GUI_Key_Color = LOKI_GUI_Key_Color - 1;
[72001] execVM "\loki_lost_key\GUI\scripts\Color_Settings.sqf";

createDialog 'Master_Loki_Dialog_Admin';
