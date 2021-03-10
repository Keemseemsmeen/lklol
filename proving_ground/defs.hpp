#define __quoted(str) #str
#define __uiSet(name, value) uiNamespace setVariable [__quoted(name), value]
#define __uiGet(name) (uiNamespace getVariable __quoted(name))

#define loki_get(name) (loki_logic getVariable __quoted(name))
#define loki_set(name,value) loki_logic setVariable [__quoted(name),(value)]
#define loki_set_arr(name,index,value) call{_arr=loki_get(name);_arr set [index,value];loki_set(name,_arr)};

#define loki_debug_main_IDD 66461
#define loki_debug_VC_IDD (loki_debug_main_IDD + 10)

#define loki_VC_vehlist_IDC (loki_debug_main_IDD + 11)
#define loki_VC_vehicle_shortcut_IDC (loki_debug_main_IDD + 12)
#define loki_VC_veh_info_IDC (loki_debug_main_IDD + 13)


#define loki_debug_WC_IDD (loki_debug_main_IDD + 20)

#define loki_WC_weaplist_IDC (loki_debug_main_IDD + 21)
#define loki_WC_magazinelist_IDC (loki_debug_main_IDD + 22)
#define loki_WC_weapon_shortcut_IDC (loki_debug_main_IDD + 23)
#define loki_WC_weap_info_IDC (loki_debug_main_IDD + 24)
#define loki_WC_magazine_info_IDC (loki_debug_main_IDD + 25)

#define loki_debug_console_IDD (loki_debug_main_IDD + 30)

#define loki_debug_console_edit_IDC (loki_debug_main_IDD + 31)
#define loki_debug_console_result_IDC (loki_debug_main_IDD + 32)
#define loki_debug_console_history_IDC (loki_debug_main_IDD + 33)

#define loki_target_display_IDD (loki_debug_main_IDD + 40)

#define loki_target_vehlist_IDC (loki_debug_main_IDD + 41)
#define loki_target_vehicle_shortcut_IDC (loki_debug_main_IDD + 42)
#define loki_target_veh_info_IDC (loki_debug_main_IDD + 43)
#define loki_target_distance_IDC (loki_debug_main_IDD + 44)
#define loki_target_direction_IDC (loki_debug_main_IDD + 45)
#define loki_target_speed_IDC (loki_debug_main_IDD + 46)

#define loki_sound_player_IDD (loki_debug_main_IDD + 50)

#define loki_soundlist_IDC (loki_debug_main_IDD + 51)

#define loki_debug_hint_IDD (loki_debug_main_IDD + 60)

#define loki_hint_text_IDC (loki_debug_main_IDD + 61)
#define loki_hint_text2_IDC (loki_debug_main_IDD + 62)