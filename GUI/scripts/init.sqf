

if (_this == "load") then {
	if (isnil "loki_var1") then {loki_var1 = ""};
	if (isnil "loki_var2") then {loki_var2 = ""};
	if (isnil "loki_var3") then {loki_var3 = ""};
	if (isnil "loki_var4") then {loki_var4 = ""};
	ctrlsettext [316011,loki_var1];
	ctrlsettext [316021,loki_var2];
	ctrlsettext [316031,loki_var3];
	ctrlsettext [316041,loki_var4];

	if (isnil "loki_cmd1") then {loki_cmd1 = ""};
	if (isnil "loki_cmd2") then {loki_cmd2 = ""};
	if (isnil "loki_cmd3") then {loki_cmd3 = ""};
	if (isnil "loki_cmd4") then {loki_cmd4 = ""};
	if (isnil "loki_cmd5") then {loki_cmd5 = ""};
	if (isnil "loki_cmd6") then {loki_cmd6 = ""}; // mike: this line was forgotten by author
	ctrlsettext [316101,loki_cmd1];
	ctrlsettext [316102,loki_cmd2];
	ctrlsettext [316103,loki_cmd3];
	ctrlsettext [316104,loki_cmd4];
	ctrlsettext [316105,loki_cmd5];
	ctrlsettext [316106,loki_cmd6]; // mike: this line was forgotten by author

	while {loki_debug_run} do {
		if (ctrltext 316011 != "") then {ctrlsettext [316012, format ["%1",call compile (ctrltext 316011)]];};
		if (ctrltext 316021 != "") then {ctrlsettext [316022, format ["%1",call compile (ctrltext 316021)]];};
		if (ctrltext 316031 != "") then {ctrlsettext [316032, format ["%1",call compile (ctrltext 316031)]];};
		if (ctrltext 316041 != "") then {ctrlsettext [316042, format ["%1",call compile (ctrltext 316041)]];};
		sleep 0.1; 
	};
};
if (_this == "unload") then {
	loki_var1 = (ctrlText 316011);
	loki_var2 = (ctrlText 316021);
	loki_var3 = (ctrlText 316031);
	loki_var4 = (ctrlText 316041);

	loki_cmd1 = (ctrlText 316101);
	loki_cmd2 = (ctrlText 316102);
	loki_cmd3 = (ctrlText 316103);
	loki_cmd4 = (ctrlText 316104);
	loki_cmd5 = (ctrlText 316105);
	loki_cmd6 = (ctrlText 316106); // mike: this line was forgotten by author
};