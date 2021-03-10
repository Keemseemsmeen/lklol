lbClear 72011;
lbAdd [72011,""];
lbAdd [72011,""];
lbAdd [72011,"         created by"];
lbAdd [72011,""];
lbAdd [72011,"            loki"];
lbAdd [72011,""];
lbAdd [72011,"   www.lokisnightmare.com"];


lbSetCurSel [4,0];








LN_ListBoxSel = 
{


	switch (lbText [72011,lbCurSel 72011]) do
	{

		case "created by": {};
		case "loki": {};
		case "": {};
		case "www.lokisnightmare.com": {};

		
	};

	ctrlSetText [5,(format ["Request"])];
		
};

exit