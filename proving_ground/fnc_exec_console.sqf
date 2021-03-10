#include "defs.hpp"
#define GET_DISPLAY (findDisplay loki_debug_console_IDD)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})

_mode = _this select 0;
switch (_mode) do {
	case 0: {//execinitsult = call compile (ctrlText loki_debug_console_edit_IDC);
		_console_history = __uiGet(loki_console_history);
		if (isNil{_console_history}) then {
			_console_history = ["hint format [""%1"",cursortarget]"];
			__uiSet(loki_console_history,_console_history);
			{
				GET_CTRL(loki_debug_console_history_IDC) lbAdd _x;
				GET_CTRL(loki_debug_console_history_IDC) lbSetData [(lbSize GET_CTRL(loki_debug_console_history_IDC))-1,_x];
			} forEach _console_history;
		}else{
			{
				GET_CTRL(loki_debug_console_history_IDC) lbAdd _x;
				GET_CTRL(loki_debug_console_history_IDC) lbSetData [(lbSize GET_CTRL(loki_debug_console_history_IDC))-1,_x];
			} forEach _console_history;
			GET_CTRL(loki_debug_console_edit_IDC) ctrlSetText (_console_history select ((count _console_history)-1));
			GET_CTRL(loki_debug_console_result_IDC) ctrlSetText str __uiGet(loki_console_result);
		};
	};
	case 1: {//exec
		_command = ctrlText loki_debug_console_edit_IDC;
		_console_history = __uiGet(loki_console_history);
		if (({_x==_command} count _console_history)<1) then {
			_console_history set [(count _console_history),_command];
			__uiSet(loki_console_history,_console_history);
			GET_CTRL(loki_debug_console_history_IDC) lbAdd str _command;
			GET_CTRL(loki_debug_console_history_IDC) lbSetData [(lbSize GET_CTRL(loki_debug_console_history_IDC))-1,_command];
		};
		_result = call compile _command;
		if (!(isNil {_result})) then {
			GET_CTRL(loki_debug_console_result_IDC) ctrlSetText str _result;
			__uiSet(loki_console_result,_result);
		};
	};
	case 2: {//fill console from history
		GET_CTRL(loki_debug_console_edit_IDC) ctrlSetText GET_SELECTED_DATA(loki_debug_console_history_IDC);
	};
	case 3: {//exec command from history
		_command = GET_SELECTED_DATA(loki_debug_console_history_IDC);
		GET_CTRL(loki_debug_console_edit_IDC) ctrlSetText _command;
		_result = call compile _command;
		if (!(isNil {_result})) then {
			GET_CTRL(loki_debug_console_result_IDC) ctrlSetText str _result;
			__uiSet(loki_console_result,_result);
		};
	};
};