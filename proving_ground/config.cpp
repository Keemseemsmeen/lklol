#include "defs_ui.hpp"
#include "defs.hpp"
#include "CfgExplorer2\config.cpp"

class loki_debug_main
{
	idd = loki_debug_main_IDD;
	name = "loki_debug_main";
	movingEnable = false;
	
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {
				loki_cVeh_btn,
				loki_dVeh_btn,
				loki_repair_btn,
				loki_booster_btn,
				loki_display_btn,
				loki_reload_btn,
				loki_cWeap_btn,
				loki_teleport_btn,
				loki_sattelite_btn,
				loki_console_btn,
				loki_targets_btn,
				loki_cfgexplorer_btn,
				loki_get_bot_btn,
				loki_bulletcam_btn,
				loki_sound_btn,
				loki_status_btn,
				loki_BIS_help_btn,
				loki_BIS_cfgviewer_btn,
				loki_close_btn
				};
/////////////
#include "defs_base_control.hpp"
/////////////
//column 1
	class loki_cVeh_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = safezoneY + btn_height*0;
		text = "Create vehicle";
		action = "closeDialog 0;createDialog ""loki_debug_veh_creator"";[0] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_cWeap_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = safezoneY + btn_height*1;
		text = "Get weapon";
		action = "closeDialog 0;createDialog ""loki_debug_weap_creator"";[0,0] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_targets_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = safezoneY + btn_height*2;
		text = "Targets";
		action = "closeDialog 0;createDialog ""loki_target_display"";[0] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_dVeh_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = safezoneY + btn_height*3;
		text = "Delete vehicle";
		action = "deleteVehicle cursorTarget;closeDialog 0;"; 
	};

	class loki_get_bot_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = safezoneY + btn_height*4;
		text = "Get bot in team";
		action = "((group player) createUnit [typeOf player,getpos player,[],0.1,""FORM""]) setSkill 1"; 
	};

	class loki_close_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = safezoneY + btn_height*6;
		text = "Close";
		action = "closeDialog 0;"; 
	};
//column 2
	class loki_repair_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + btn_height*0;
		text = "Repair";
		action = "if (vehicle player == player) then {player setDamage 0; cursorTarget setDamage 0; cursorTarget setFuel 1;} else {vehicle player setDamage 0;vehicle player setFuel 1;player setDamage 0; };closeDialog 0;"; 
	};

	class loki_booster_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + btn_height*1;
		text = "Booster";
		action = "[] spawn (loki_logic getVariable ""FNC_booster"");closeDialog 0;"; 
	};

	class loki_teleport_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + btn_height*2;
		text = "Teleport";
		action = "hint ""Click on map to teleport"";onMapSingleClick ""vehicle player setPos [_pos select 0,_pos select 1,0]; onMapSingleClick '';""; showMap true; closeDialog 0;"; 
	};

	class loki_sattelite_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + btn_height*3;
		text = "Sattelite";
		action = "hint ""Click on map to aim sattelite"";onMapSingleClick ""[_pos] call (loki_logic getVariable 'FNC_sattelite');onMapSingleClick '';""; showMap true; closeDialog 0;"; 
	};

	class loki_bulletcam_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + btn_height*4;
		text = "Bulletcam";
		action = "call (loki_logic getVariable ""FNC_bulletcam"");"; 
	};

	class loki_status_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + btn_height*5;
		text = "Status display";
		action = "call (loki_logic getVariable ""FNC_status"")";
	};

	class loki_console_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + btn_height*6;
		text = "Console";
		action = "closeDialog 0;createDialog ""loki_debug_console"";[0] call (loki_logic getVariable ""FNC_exec_console"");"; 
	};
//column 3
	class loki_sound_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = safezoneY + btn_height*0;
		text = "Sound player";
		action = "closeDialog 0;createDialog ""loki_sound_player"";[0] call (loki_logic getVariable ""FNC_sound"");"; 
	};

	class loki_display_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = safezoneY + btn_height*1;
		text = "BalCa";
		action = "execVM ""\x\addons\balca\balca.sqf"";closeDialog 0;"; 
	};

	class loki_reload_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = safezoneY + btn_height*2;
		text = "Reloader";
		action = "(vehicle player) execVM ""\x\addons\loki_reloader\act_open_dialog.sqf"";closeDialog 0;"; 
	};

	class loki_cfgexplorer_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = safezoneY + btn_height*3;
		text = "cfgExplorer";
		action = "closeDialog 0;createDialog ""HJ_ConfigExplorer"";"; 
	};

	class loki_BIS_help_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = safezoneY + btn_height*4;
		text = "BIS help";
		action = "closeDialog 0;[] call BIS_fnc_help"; 
	};

	class loki_BIS_cfgviewer_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = safezoneY + btn_height*5;
		text = "BIS cfgviewer";
		action = "closeDialog 0;[] call BIS_fnc_configviewer"; 
	};
};

class loki_debug_veh_creator
{
	idd = loki_debug_VC_IDD;
	name = "loki_debug_veh_creator";
	movingEnable = false;
	
	controlsBackground[] = {loki_debug_background};
	objects[] = {};
	controls[] = {
				loki_VC_vehlist,
				loki_VC_vehicle_shortcut,
				loki_VC_veh_info,
				loki_VC_fill_static,
				loki_VC_fill_car,
				loki_VC_fill_truck,
				loki_VC_fill_APC,
				loki_VC_fill_tank,
				loki_VC_fill_helicopter,
				loki_VC_fill_plane,
				loki_VC_fill_ship,
				loki_VC_class_to_clipboard_btn,
				loki_VC_info_to_clipboard_btn,
				loki_VC_create_veh_core_btn,
				loki_VC_create_veh_player_btn,
				loki_VC_close_btn
				};
/////////////////
	class loki_debug_background
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = safezoneX-border_offsetX; w = column_weight*3 + border_offsetX*3;
		y = safezoneY-border_offsetY-btn_height*3; h = display_height+border_offsetY*2+btn_height*4;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_gameoptions_background_ca.paa";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};


/////////////
#include "defs_base_control.hpp"
/////////////

	class loki_VC_vehlist : loki_debug_list
	{
		idc = loki_VC_vehlist_IDC;
		x = safezoneX; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2; 
		h = display_height - offset_bottom*4 - (safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[1] call (loki_logic getVariable ""FNC_create_vehicle"")";
		onLBDblClick = "[2] call (loki_logic getVariable ""FNC_create_vehicle"")";
	};

	class loki_VC_vehicle_shortcut : loki_debug_image
	{
		idc = loki_VC_vehicle_shortcut_IDC;
		x = safezoneX + column_weight; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2;
		h = img_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_action_getingunner_ca.paa";
	};

	class loki_VC_veh_info : loki_debug_text
	{
		idc = loki_VC_veh_info_IDC;
		type = CT_STRUCTURED_TEXT+ST_LEFT;
		size = 0.023;
		x = safezoneX + column_weight*2; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2; 
		h = display_height - offset_bottom*3-(safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};

	class loki_VC_fill_static : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*0; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Static";
		action = "[0,0] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_fill_car : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*0; w = btn_weight-column_div;
		y = safezoneY;
		text = "Car";
		action = "[0,1] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_fill_truck : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*1; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Truck";
		action = "[0,2] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_fill_APC : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*1; w = btn_weight-column_div;
		y = safezoneY;
		text = "APC";
		action = "[0,3] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_fill_tank : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*2; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Tank";
		action = "[0,4] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_fill_helicopter : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*2; w = btn_weight-column_div;
		y = safezoneY;
		text = "Chopper";
		action = "[0,5] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_fill_plane : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*3; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Plane";
		action = "[0,6] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_fill_ship : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*3; w = btn_weight-column_div;
		y = safezoneY;
		text = "Ship";
		action = "[0,7] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_class_to_clipboard_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom-btn_height;
		text = "Class to clipboard";
		action = "[4] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_info_to_clipboard_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom-btn_height;
		text = "Info to clipboard";
		action = "[5] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_create_veh_core_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + offset_top*2+img_height;
		text = "Create at player start";
		action = "[2] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_create_veh_player_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = safezoneY + offset_top*2+img_height + btn_height;
		text = "Create at player";
		action = "[3] call (loki_logic getVariable ""FNC_create_vehicle"")"; 
	};

	class loki_VC_close_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = btn_weight;
		y = display_height-safezoneY- offset_bottom;
		text = "Close";
		action = "closeDialog 0;"; 
	};
};

class loki_debug_weap_creator
{
	idd = loki_debug_WC_IDD;
	name = "loki_debug_weap_creator";
	movingEnable = false;
	
	controlsBackground[] = {loki_debug_background};
	objects[] = {};
	controls[] = {
				loki_WC_weaplist,
				loki_WC_magazinelist,
				loki_WC_weapon_shortcut,
				loki_WC_weap_info,
				loki_WC_magazine_info,
				loki_WC_fill_rifles,
				loki_WC_fill_scoped_rifles,
				loki_WC_fill_heavy,
				loki_WC_fill_launchers,
				loki_WC_fill_pistols,
				loki_WC_fill_grenades,
				loki_WC_fill_binocular,
				loki_WC_fill_items,
				loki_WC_weap_to_clipboard_btn,
				loki_WC_ammo_to_clipboard_btn,
				loki_WC_create_weap_btn,
				loki_WC_create_magazine_btn,
				loki_WC_clear_magazines_btn,
				loki_WC_close_btn
				};
/////////////////
	class loki_debug_background
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = safezoneX-border_offsetX; w = column_weight*3 + border_offsetX*3;
		y = safezoneY-border_offsetY-btn_height*3; h = display_height+border_offsetY*2+btn_height*4;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_gameoptions_background_ca.paa";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};


/////////////
#include "defs_base_control.hpp"
/////////////

	class loki_WC_weaplist : loki_debug_list
	{
		idc = loki_WC_weaplist_IDC;
		x = safezoneX; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2; 
		h = display_height - offset_bottom*4 - (safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[1] call (loki_logic getVariable ""FNC_create_weapon"");";
		onLBDblClick = "[2] call (loki_logic getVariable ""FNC_create_weapon"");";
	};

	class loki_WC_magazinelist : loki_debug_list
	{
		idc = loki_WC_magazinelist_IDC;
		x = safezoneX + column_weight; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2 + img_height_wc; 
		h = display_height - offset_bottom*4 - img_height_wc-(safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[3] call (loki_logic getVariable ""FNC_create_weapon"");";
		onLBDblClick = "[4] call (loki_logic getVariable ""FNC_create_weapon"");";
	};

	class loki_WC_weapon_shortcut : loki_debug_image
	{
		idc = loki_WC_weapon_shortcut_IDC;
		x = safezoneX + column_weight; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2;
		h = img_height_wc;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};

	class loki_WC_weap_info : loki_debug_text
	{
		idc = loki_WC_weap_info_IDC;
		type = CT_STRUCTURED_TEXT+ST_LEFT;
		size = 0.023;
		x = safezoneX + column_weight*2; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2;
		h = img_height_wc;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};

	class loki_WC_magazine_info : loki_debug_text
	{
		idc = loki_WC_magazine_info_IDC;
		type = CT_STRUCTURED_TEXT;
		size = 0.023;
		x = safezoneX + column_weight*2; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2 + img_height_wc; 
		h = display_height - offset_bottom*4 - img_height_wc-(safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};

	class loki_WC_fill_rifles : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*0; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Rifles";
		action = "[0,0] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_fill_scoped_rifles : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*0; w = btn_weight-column_div;
		y = safezoneY;
		text = "Scoped";
		action = "[0,1] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_fill_heavy : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*1; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Heavy";
		action = "[0,2] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_fill_launchers : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*1; w = btn_weight-column_div;
		y = safezoneY;
		text = "Launchers ";
		action = "[0,3] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_fill_pistols : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*2; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Pistols";
		action = "[0,4] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_fill_grenades : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*2; w = btn_weight-column_div;
		y = safezoneY;
		text = "Grenades";
		action = "[0,5] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_fill_binocular : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*3; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Binoculars";
		action = "[0,6] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_fill_items : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*3; w = btn_weight-column_div;
		y = safezoneY;
		text = "Items";
		action = "[0,7] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_weap_to_clipboard_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom-btn_height;
		text = "Class to clipboard";
		action = "[5] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_ammo_to_clipboard_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom-btn_height;
		text = "Ammo to clipboard";
		action = "[6] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_create_weap_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom;
		text = "Get weapon";
		action = "[2] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_create_magazine_btn : loki_debug_btn
	{
		x = safezoneX+column_weight; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom;
		text = "Get magazine";
		action = "[4] call (loki_logic getVariable ""FNC_create_weapon"");"; 
	};

	class loki_WC_clear_magazines_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = column_weight-column_div;
		y = display_height-safezoneY-offset_bottom-btn_height;
		text = "Clear magazines";
		action = "loki_logic setVariable [MAGS,[]];{player removeMagazine _x} forEach magazines player;"; 
	};

	class loki_WC_close_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = btn_weight;
		y = display_height-safezoneY- offset_bottom;
		text = "Close";
		action = "closeDialog 0;"; 
	};
};

class loki_debug_console
{
	idd = loki_debug_console_IDD;
	name = "loki_debug_console";
	movingEnable = false;
	
	controlsBackground[] = {loki_debug_background};
	objects[] = {};
	controls[] = {
				loki_debug_console_edit,
				loki_debug_console_result,
				loki_debug_console_history,
				loki_debug_console_exec_btn,
				loki_debug_console_close_btn

				};

	onKeyDown = "if((_this select 1) == 28) then {[1] call (loki_logic getVariable ""FNC_exec_console"");}; nil; ";
/////////////////
	class loki_debug_background
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = safezoneX-border_offsetX; w = column_weight*3 + border_offsetX*4;
		y = safezoneY-border_offsetY; h = display_height+border_offsetY*2;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_gameoptions_background_ca.paa";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};


/////////////
#include "defs_base_control.hpp"
/////////////

	class loki_debug_console_edit : loki_debug_edit
	{
		idc = loki_debug_console_edit_IDC;
		x = safezoneX; w = column_weight*3;
		y = safezoneY + offset_top*2; h = str_height*2;
		text = "enter command here";
	};

	class loki_debug_console_result : loki_debug_text
	{
		idc = loki_debug_console_result_IDC;
		type = CT_STRUCTURED_TEXT+ST_LEFT;
		size = 0.023;
		x = safezoneX; 
		w = column_weight*3;
		y = safezoneY + offset_top*2 + str_height*3;
		h = str_height*2;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};

	class loki_debug_console_history : loki_debug_list
	{
		idc = loki_debug_console_history_IDC;
		x = safezoneX; 
		w = column_weight*3;
		y = safezoneY + offset_top*2 + str_height*5; 
		h = display_height - offset_bottom*4 - str_height*5 - (safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[2] call (loki_logic getVariable ""FNC_exec_console"");";
		onLBDblClick = "[3] call (loki_logic getVariable ""FNC_exec_console"");";
	};

	class loki_debug_console_exec_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom;
		text = "Execute";
		action = "[1] call (loki_logic getVariable ""FNC_exec_console"");"; 
	};

	class loki_debug_console_close_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; w = btn_weight;
		y = display_height-safezoneY- offset_bottom;
		text = "Close";
		action = "closeDialog 0;"; 
	};
};

class loki_target_display
{
	idd = loki_target_display_IDD;
	name = "loki_target_display";
	movingEnable = false;
	
	controlsBackground[] = {loki_debug_background};
	objects[] = {};
	controls[] = {
				loki_target_vehlist,
				loki_target_vehicle_shortcut,
				loki_target_veh_info,
				loki_target_fill_man,
				loki_target_fill_car,
				loki_target_fill_truck,
				loki_target_fill_APC,
				loki_target_fill_tank,
				loki_target_fill_helicopter,
				loki_target_fill_plane,
				loki_target_fill_ship,
				loki_target_distance_desc,
				loki_target_direction_desc,
				loki_target_speed_desc,
				loki_target_distance,
				loki_target_direction,
				loki_target_speed,
				loki_target_apply_btn,
				loki_target_reset_btn,
				loki_target_land_create_btn,
				loki_target_air_create_btn,
				loki_target_clear_btn,
				loki_target_close_btn
				};
/////////////////
	class loki_debug_background
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = safezoneX-border_offsetX; w = column_weight*3 + border_offsetX*3;
		y = safezoneY-border_offsetY-btn_height*3; h = display_height+border_offsetY*2+btn_height*4;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_gameoptions_background_ca.paa";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};


/////////////
#include "defs_base_control.hpp"
/////////////

	class loki_target_vehlist : loki_debug_list
	{
		idc = loki_target_vehlist_IDC;
		x = safezoneX; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2; 
		h = display_height - offset_bottom*4 - (safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[2] call (loki_logic getVariable ""FNC_target"");";
		onLBDblClick = "[3] call (loki_logic getVariable ""FNC_target"");";
	};

	class loki_target_vehicle_shortcut : loki_debug_image
	{
		idc = loki_target_vehicle_shortcut_IDC;
		x = safezoneX + column_weight; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2;
		h = img_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_action_getingunner_ca.paa";
	};

	class loki_target_veh_info : loki_debug_text
	{
		idc = loki_target_veh_info_IDC;
		type = CT_STRUCTURED_TEXT+ST_LEFT;
		size = 0.023;
		x = safezoneX + column_weight; 
		w = column_weight - column_div;
		y = safezoneY + offset_top*2 + img_height; 
		h = display_height - offset_bottom*3 - img_height-(safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};

	class loki_target_fill_man : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*0; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Man";
		action = "[1,0] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_fill_car : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*0; w = btn_weight-column_div;
		y = safezoneY;
		text = "Car";
		action = "[1,1] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_fill_truck : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*1; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Truck";
		action = "[1,2] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_fill_APC : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*1; w = btn_weight-column_div;
		y = safezoneY;
		text = "APC";
		action = "[1,3] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_fill_tank : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*2; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Tank";
		action = "[1,4] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_fill_helicopter : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*2; w = btn_weight-column_div;
		y = safezoneY;
		text = "Chopper";
		action = "[1,5] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_fill_plane : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*3; w = btn_weight-column_div;
		y = safezoneY - btn_height;
		text = "Plane";
		action = "[1,6] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_fill_ship : loki_debug_btn
	{
		x = safezoneX + border_offsetX + btn_weight*3; w = btn_weight-column_div;
		y = safezoneY;
		text = "Ship";
		action = "[1,7] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_distance_desc : loki_debug_text
	{
		x = safezoneX+column_weight*2; 
		w = column_weight/2-column_div;
		y = safezoneY + offset_top*2+(str_height+border_offsetY)*0; 
		h = str_height;
		text = "Distance";
	};

	class loki_target_direction_desc : loki_debug_text
	{
		x = safezoneX+column_weight*2; 
		w = column_weight/2-column_div;
		y = safezoneY + offset_top*2+(str_height+border_offsetY)*1; 
		h = str_height;
		text = "Direction";
	};

	class loki_target_speed_desc : loki_debug_text
	{
		x = safezoneX+column_weight*2; 
		w = column_weight/2-column_div;
		y = safezoneY + offset_top*2+(str_height+border_offsetY)*2; 
		h = str_height;
		text = "Speed";
	};

	class loki_target_distance : loki_debug_edit
	{
		idc = loki_target_distance_IDC;
		x = safezoneX+column_weight*2.5; 
		w = column_weight/2-column_div;
		y = safezoneY + offset_top*2+(str_height+border_offsetY)*0; 
		h = str_height;
		text = "--";
	};

	class loki_target_direction : loki_debug_edit
	{
		idc = loki_target_direction_IDC;
		x = safezoneX+column_weight*2.5; 
		w = column_weight/2-column_div;
		y = safezoneY + offset_top*2+(str_height+border_offsetY)*1; 
		h = str_height;
		text = "--";
	};

	class loki_target_speed : loki_debug_edit
	{
		idc = loki_target_speed_IDC;
		x = safezoneX+column_weight*2.5; 
		w = column_weight/2-column_div;
		y = safezoneY + offset_top*2+(str_height+border_offsetY)*2; 
		h = str_height;
		text = "--";
	};

	class loki_target_apply_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; 
		w = column_weight-column_div;
		y = safezoneY + offset_top*2+(str_height+border_offsetY)*3; 
		text = "Apply";
		action = "[6] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_reset_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; 
		w = column_weight-column_div;
		y = safezoneY + offset_top*2+btn_height+(str_height+border_offsetY)*3; 
		text = "Reset";
		action = "loki_logic setVariable [TARGET_PROPS,[100,0,(getDir (loki_logic getVariable ""CORE""))+180]];[0] call (loki_logic getVariable ""FNC_target"");[6] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_land_create_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; 
		w = column_weight-column_div;
		y = safezoneY + offset_top*2+btn_height*2+(str_height+border_offsetY)*3; 
		text = "Add land target";
		action = "[3] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_air_create_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; 
		w = column_weight-column_div;
		y = safezoneY + offset_top*2+btn_height*3+(str_height+border_offsetY)*3; 
		text = "Add air target";
		action = "[4] call (loki_logic getVariable ""FNC_target"");"; 
	};

	class loki_target_clear_btn : loki_debug_btn
	{
		x = safezoneX+column_weight*2; 
		w = column_weight-column_div;
		y = safezoneY + offset_top*2+btn_height*4+(str_height+border_offsetY)*3; 
		text = "Clear targets";
		action = "{deleteVehicle _x} forEach (loki_logic getVariable ""LAND_TARGETS"");{{deleteVehicle _x} forEach _x} forEach (loki_logic getVariable ""CREW"");loki_logic setVariable [""LAND_TARGETS"",[]];{deleteVehicle _x} forEach (loki_logic getVariable ""AIR_TARGETS"");{{deleteVehicle _x} forEach _x} forEach (loki_logic getVariable ""CREW_AIR"");loki_logic setVariable [""AIR_TARGETS"",[]];"; 
	};

	class loki_target_close_btn : loki_debug_btn
	{
		x = safezoneX + btn_weight*3; w = btn_weight;
		y = display_height-safezoneY- offset_bottom;
		text = "Close";
		action = "closeDialog 0;"; 
	};
};

class loki_sound_player
{
	idd = loki_sound_player_IDD;
	name = "loki_sound_player";
	movingEnable = false;
	
	controlsBackground[] = {loki_debug_background};
	objects[] = {};
	controls[] = {
				loki_soundlist,
				loki_clipboard_btn,
				loki_close_btn
				};
/////////////////
	class loki_debug_background
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = safezoneX-border_offsetX; w = column_weight*3 + border_offsetX*3;
		y = safezoneY-border_offsetY; h = display_height+border_offsetY*2+btn_height*1;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_gameoptions_background_ca.paa";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};


/////////////
#include "defs_base_control.hpp"
/////////////

	class loki_soundlist : loki_debug_list
	{
		idc = loki_soundlist_IDC;
		x = safezoneX; 
		w = column_weight*3 - column_div;
		y = safezoneY + offset_top*2; 
		h = display_height - offset_bottom*4 - (safezoneY + offset_top*2);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "";
		onLBDblClick = "[1] call (loki_logic getVariable ""FNC_sound"");";
	};

	class loki_clipboard_btn : loki_debug_btn
	{
		x = safezoneX; w = column_weight-column_div;
		y = display_height-safezoneY- offset_bottom;
		text = "to Clipboard";
		action = "[2] call (loki_logic getVariable ""FNC_sound"");"; 
	};

	class loki_close_btn : loki_debug_btn
	{
		x = safezoneX + column_weight*2; w = btn_weight;
		y = display_height-safezoneY- offset_bottom;
		text = "Close";
		action = "closeDialog 0;"; 
	};
};

