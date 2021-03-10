
class RscGroupBox2
{

	type = 0;
	idc = -1;
	style = 112;
	text = "";
	colorBackground[] = {1, 1, 1, 0.6};
	colorText[] = {0, 0, 0, 0};
	font = "BitStream";
	sizeEx = 0.02;
};


//-------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------

class Loki_RscDisplayInterrupt: LOKI_RscStandardDisplay
{
	movingEnable=0;
	enableSimulation=0;
	onLoad="private ['_dummy']; _dummy = _this call compile preprocessFile 'pauseOnload.sqf'; 			private ['_dummy']; _dummy = [_this,'onload'] call compile preprocessFile '\ca\ui\scripts\pauseCutScene.sqf'; 			_dummy = ['Init', _this] execVM '\ca\ui\scripts\pauseLoadinit.sqf';       _dummy = [] call compile preprocessFile '\ca\ui\scripts\uiPostEffectBlur.sqf';";
	onUnload=" private [""_dummy""]; _dummy = [""Unload"", _this] call compile preprocessFile ""\ca\ui\scripts\pauseOnUnload.sqf""; 			_dummy = [_this,'unload'] call compile preprocessFile '\ca\ui\scripts\pauseCutScene.sqf';";
	class controlsBackground
	{
		class Mainback;
	};
	class controls
	{
		delete B_Abort;
		delete B_Options;
		delete B_Retry;
		delete B_Load;
		delete B_Revert;
		delete B_Save;
		delete B_Continue;
		delete B_Diary;
		delete Title;

		class MissionTitle;
		class DifficultyTitle;
		class CA_PGTitle;
		class PG_Save;
		class PG_Skip;
		class PG_Revert;
		class PG_Again;
		class PG_Options;
		class PG_Abort;

		//--- This is the trick
		class B_loki_debug: PG_SAVE
		{
			idc = 113801;
			y = 100;
			text = "Debug Console";
			default = 1;
			action = "createdialog 'loki_debug';";
			colorBackground[] = {1,1,1,0};
		};

		class HintA_Select;
		class ButtonCancel;
	};
	class KeyHints
	{
	};
};

//-------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------


class loki_debug
{
	idd = 316005;
	movingEnable = 1;
	onLoad = "_sqf = 'load' spawn compile preprocessfilelinenumbers '\loki_lost_key\GUI\scripts\init.sqf'; loki_debug_run = true";
	onUnload = "loki_debug_run = false; loki_var1 = (ctrlText 316011);loki_var2 = (ctrlText 316021);loki_var3 = (ctrlText 316031);loki_var4 = (ctrlText 316041);loki_cmd1 = (ctrlText 316101);loki_cmd2 = (ctrlText 316102);loki_cmd3 = (ctrlText 316103);loki_cmd4 = (ctrlText 316104);loki_cmd5 = (ctrlText 316105);loki_cmd6 = (ctrlText 316106);"; // mike: added loki_cmd6 = (ctrlText 316106);
	class Controls
	{

		class Drag: RscGroupBox2
		{
			x=0.100;
			y=0.070;
			w=0.800;
			h=0.830;
			colorbackground[] = {0,0,0,0.8};
			colortext[] = {0,0,0,0};
			moving = 1;
		};
		class Header : LOKI_RscText
		{
			style=2;
			x=0.100;
			y=0.070;
			w=0.800;
			h=0.04;
			text="Debug Console";
			sizeEx = 0.04;
			colortext[]={0,0.72,0.72,1};
			colorBackground[] = {0,0,0,0};
		};

		class SubBackground1 : RscGroupBox2
		{
			x=0.110;
			y=0.115;
			w=0.780;
			h=0.410;
			style=128;
			colorBackground[] = {0.709,0.972,0.384,0.2/*0.25, 0.25, 0.25, 1.55*/};
		};
		class SubBackground2 : RscGroupBox2
		{
			x=0.110;
			y=0.535;
			w=0.780;
			h=0.350;
			style=128;
			colorBackground[] = {0.709,0.972,0.384,0.2/*0.25, 0.25, 0.25, 1.55*/};
		};

		//----- Value check -----
		class ValueInput1 : LOKI_RscEdit
		{
			IDC = 316011;
			//style = 16
			x = 0.120;
			y = 0.125;
			w = 0.760;
			h = 0.04;
			autocomplete = "scripting";
		};
		class ValueOutput1 : LOKI_RscEdit
		{
			IDC = 316012;
			x = 0.120;
			y = 0.165-0.001;
			w = 0.760;
			h = 0.04;
		};

		class ValueInput2 : ValueInput1
		{
			IDC = 316021;
			y = 0.225;
		};
		class ValueOutput2 : ValueOutput1
		{
			IDC = 316022;
			y = 0.265-0.001;
		};

		class ValueInput3 : ValueInput1
		{
			IDC = 316031;
			y = 0.325;
		};
		class ValueOutput3 : ValueOutput1
		{
			IDC = 316032;
			y = 0.365-0.001;
		};

		class ValueInput4 : ValueInput1
		{
			IDC = 316041;
			y = 0.425;
		};
		class ValueOutput4 : ValueOutput1 // mike: changed ValueOutpu4 to ValueOutput4
		{
			IDC = 316042;
			y = 0.465-0.001;
		};

		//----- Command lines -----
		class CommandInput1 : LOKI_RscEdit
		{
			IDC = 316101;
			//style = 16
			x = 0.120;
			y = 0.550;
			w = 0.695;
			h = 0.04;
			autocomplete = "scripting";
		};
		class CommandModules : LOKI_RscButton
		{
			idc = -1;
			x = 0.820;
			y = 0.550;
			w = 0.060;
			h = 0.04;
			colorText[] = {0.75, 0.75, 0.75, 1};
			colorBackground[] = {0.709/2,0.972/2,0.384/2,1};
			text = "Exec";
			action = "call compile (ctrlText 316101);";
			default = 1;
		};

		class CommandInput2 : CommandInput1
		{
			IDC = 316102;
			y = 0.600;
		};
		class CommandSITCOM : CommandModules
		{
			y = 0.600;
			action = "call compile (ctrlText 316102);";
		};

		class CommandInput3 : CommandInput1
		{
			IDC = 316103;
			y = 0.650;
		};
		class CommandButton3 : CommandModules
		{
			y = 0.650;
			action = "call compile (ctrlText 316103);";
		};

		class CommandInput4 : CommandInput1
		{
			IDC = 316104;
			y = 0.700;
		};
		class Commandcredits : CommandModules
		{
			y = 0.700;
			action = "call compile (ctrlText 316104);";
		};

		class CommandInput5 : CommandInput1
		{
			IDC = 316105;
			y = 0.750;
		};
		class CommandButton5 : CommandModules
		{
			y = 0.750;
			action = "call compile (ctrlText 316105);";
		};

		class CommandInput6 : CommandInput1
		{
			IDC = 316106;
			y = 0.800;
		};
		class CommandButton6 : CommandModules
		{
			y = 0.800;
			action = "call compile (ctrlText 316106);";
			default = true;
		};
	};
};