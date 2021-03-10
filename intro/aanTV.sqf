//waituntil {!isnil "bis_fnc_init"};
BIS_ShowUI = "none";
sqf = [
	parsetext  localize "STR_EP1_aanTV.sqf0",
	parsetext 	(localize "STR_EP1_rolling_text.sqf0" + " " +  
			localize "STR_EP1_rolling_text.sqf1" + " " +  
			localize "STR_EP1_rolling_text.sqf2" + " " + 
			localize "STR_EP1_rolling_text.sqf3" + " " + 
			localize "STR_EP1_rolling_text.sqf4" + " " + 
			localize "STR_EP1_rolling_text.sqf5" + " " + 
			localize "STR_EP1_rolling_text.sqf6" + " " + 
			localize "STR_EP1_rolling_text.sqf7" + " " + 
			localize "STR_EP1_rolling_text.sqf8" + " " + 
			localize "STR_EP1_rolling_text.sqf9")

] spawn BIS_fnc_AAN;

	
	
2999 cutrsc ["rscAANnews","plain"];
disableserialization;
BIS_StateOfNews = "start";

_delayArray = [
	3, //--- 0: Harris up
	18, //--- 1: Harris down
	13, //--- 2: Map left
	6, //--- 3: Map zone
	2, //--- 4: Map Takistani forces
	6, //--- 5: Map NATO forces
	3, //--- 6: Map Air force
	2, //--- 7: Map Air strike
	0, //--- 8: Map Air strike blinking
	2, //--- 9: Map Air strike blinking duration
	6, //--- 10: Aziz
	14, //--- 11: Harris down	
	3 //---12: Exit
];


with uinamespace do {

	
	_display = BIS_AAN_news;

	_pic1 = _display displayctrl 300101;
	_pic2 = _display displayctrl 300102;
	_pic3 = _display displayctrl 300103;
	_pic4 = _display displayctrl 300104;
	_pic5 = _display displayctrl 300105;
	_pic6 = _display displayctrl 300106;
	_picList = [_pic1,_pic2,_pic3,_pic4,_pic5,_pic6];
	_delayList = [3,3,3,3,3,0];

	_pic1 ctrlsettext "\loki_lost_key\intro\img\CE0_takistan_map_1_co.paa";
	_pic2 ctrlsettext "\loki_lost_key\intro\img\CE0_takistan_map_2_ca.paa";
	_pic3 ctrlsettext "\loki_lost_key\intro\img\CE0_takistan_map_3_ca.paa";
	_pic4 ctrlsettext "\loki_lost_key\intro\img\CE0_takistan_map_4_ca.paa";
	_pic5 ctrlsettext "\loki_lost_key\intro\img\CE0_takistan_map_5_ca.paa";
	_pic6 ctrlsettext "\loki_lost_key\intro\img\CE0_takistan_map_6_ca.paa";
	{
		_x ctrlsetfade 1;
		_x ctrlcommit 0;
	} foreach _picList;

	_bcgLeft1 = _display displayctrl 300110;
	_bcgLeft2 = _display displayctrl 300111;
	_textL1 = _display displayctrl 300108;
	_bcgLeft = [_bcgLeft1,_bcgLeft2,_textL1] + _picList;
	{
		_pos = ctrlposition _x;
		_sx = _pos select 0;
		_sw = _pos select 2;
		_pos set [0,_sx - _sw];
		_x ctrlsetposition _pos;
		_x ctrlcommit 0;
	} foreach _bcgLeft;

	_bcgRight1 = _display displayctrl 300112;
	_bcgRight2 = _display displayctrl 300113;
	_picR1 = _display displayctrl 300107;
	_picR1 ctrlsettext "\loki_lost_key\intro\img\CE0_Harris_ca.paa";
	_textR1 = _display displayctrl 300109;
	_textR1 ctrlsetstructuredtext parsetext  localize "STR_EP1_aanTV.sqf1";
	_bcgRight = [_bcgRight1,_bcgRight2,_picR1,_textR1];
	_deltaR = ctrlposition _bcgRight1 select 3;
	{
		_pos = ctrlposition _x;
		_sy = _pos select 1;
		_sh = _pos select 3;
		_pos set [1,_sy + _deltaR];
		_x ctrlsetposition _pos;
		_x ctrlcommit 0;
	} foreach _bcgRight;
	///////////////////////////////////////////////////////////
	WaitUntil{BIS_ShowUI == "HarrisUp"};
	sleep (_delayArray select 0);
	BIS_StateOfNews = "HarrisUp";


	//--- Right background up
	{
		_pos = ctrlposition _x;
		_sy = _pos select 1;
		_sh = _pos select 3;
		_pos set [1,_sy - _deltaR];
		_x ctrlsetposition _pos;
		_x ctrlcommit 1;
	} foreach _bcgRight;
	sleep (_delayArray select 1);
	BIS_StateOfNews = "HarrisDown";

	//--- Right background down
	{
		_pos = ctrlposition _x;
		_sy = _pos select 1;
		_sh = _pos select 3;
		_pos set [1,_sy + _deltaR - (0.08 * safezoneH)];
		_x ctrlsetposition _pos;
		_x ctrlcommit 0.5;
	} foreach _bcgRight;
	sleep (_delayArray select 2);
	BIS_StateOfNews = "MapLeft";


	//--- Left background right
	{
		_pos = ctrlposition _x;
		_sx = _pos select 0;
		_sw = _pos select 2;
		_pos set [0,_sx + _sw];
		_x ctrlsetposition _pos;
		_x ctrlcommit 0.5;
	} foreach _bcgLeft;
	sleep 0.5;

	//--- Map animation
	for "_i" from 0 to (count _picList - 1) do {
		_pic = _picList select _i;
		_pic ctrlsetfade 0;
		_pic ctrlcommit 0.5;
		_delay = _delayList select _i;
		sleep (_delayArray select (3 + _i));
	};

	_time = time;
	while {(time - _time) < (_delayArray select 9)} do {
		_pic6 ctrlsetfade 1;
		_pic6 ctrlcommit 0;
		sleep 0.3;
		_pic6 ctrlsetfade 0;
		_pic6 ctrlcommit 0;
		sleep 0.3;
	};
	{
		_x ctrlsetfade 1;
		_x ctrlcommit 0.5;
	} foreach _picList;

	_picR1 ctrlsettext "\loki_lost_key\intro\img\CE0_Aziz_ca.paa"; //--- Preload
	sleep 0.6;

	//--- Battery, Aziz!
	_textL1 ctrlsetstructuredtext parsetext  localize "STR_EP1_aanTV.sqf2";
	_pos = ctrlposition _pic1;
	_sizeCoef = 0.7;
	_posX = (_pos select 0) + (_pos select 2)*(1 - _sizeCoef)/2;
	_posY = (_pos select 1) + (_pos select 3)*(1 - _sizeCoef)/2;
	_posW = (_pos select 2)*_sizeCoef;
	_posH = (_pos select 3)*_sizeCoef;
	_pic1 ctrlsetposition [_posX,_posY,_posW,_posH];
	_pic1 ctrlcommit 0;
	_pic1 ctrlsettext "\loki_lost_key\intro\img\CE0_Aziz_ca.paa";
	_pic1 ctrlsetfade 0;
	_pic1 ctrlcommit 0.5;

	_textL1 ctrlsetposition [_posX,_posY + _posH,_posW,_posH];
	_textL1 ctrlcommit 0;
	_textL1 ctrlsetfade 0;
	_textL1 ctrlcommit 0.5;
	sleep (_delayArray select 10);

	BIS_StateOfNews = "HarrisDown2";
	
	//--- Left backround left
	_pic1 ctrlsetfade 1;
	_pic1 ctrlcommit 0.5;
	_textL1 ctrlsetfade 1;
	_textL1 ctrlcommit 0.5;
	sleep 0.5;
	{
		_pos = ctrlposition _x;
		_sx = _pos select 0;
		_sw = _pos select 2;
		_pos set [0,_sx - _sw];
		_x ctrlsetposition _pos;
		_x ctrlcommit 0.5;
	} foreach _bcgLeft;
	sleep (_delayArray select 11);
	
	BIS_StateOfNews = "End";
	//--- Right background down
	{
		_pos = ctrlposition _x;
		_sy = _pos select 1;
		_sh = _pos select 3;
		_pos set [1,_sy + _deltaR];
		_x ctrlsetposition _pos;
		_x ctrlcommit 1;
	} foreach _bcgRight;
	BIS_AANEnded = true;
	
	DEBUGLOG "----------------AAENDED-true";
	sleep (_delayArray select 12);
			
	
	2999 cuttext ["","plain"];
	3000 cuttext ["","plain"];
};
closeDialog 0;