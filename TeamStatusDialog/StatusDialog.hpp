#include "x_setup.sqf"

	class controls {
		class XD_TeamStatusButton: XD_ButtonBase {
			idc = 11009;
			text = "Team Status";
			action = "CloseDialog 0;player execVM 'x_client\x_teamstatus.sqf'";
			x = 0.68;
			y = 0.62;
		};

	};

