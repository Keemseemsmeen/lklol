sleep 10;

	SOMsupport removeaction act1;
	SOMsupport removeaction act2;
	SOMsupport removeaction act3;
	SOMsupport removeaction act4;
	SOMsupport removeaction act5;
	SOMsupport removeaction act6;
	SOMsupport removeaction act7;
	SOMsupport removeaction act8;
	SOMsupport removeaction act9;
	SOMsupport removeaction act10;
	SOMsupport removeaction act11;

	sleep 3;
	waituntil {alive SOMsupport};
	sleep 1;
	act1 = SOMsupport addaction ["SOM Mission Menu", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
	SOMsupport removeaction act2;
	SOMsupport removeaction act3;
	SOMsupport removeaction act4;
	SOMsupport removeaction act5;
	SOMsupport removeaction act6;
	SOMsupport removeaction act7;
	SOMsupport removeaction act8;
	SOMsupport removeaction act9;
	SOMsupport removeaction act10;
	SOMsupport removeaction act11;

	sleep 1;
	
