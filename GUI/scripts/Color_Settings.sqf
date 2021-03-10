// orginial script from Clayman and ClayRadio

private ["_color","_displayIDD","_control"];
disableSerialization;

		LOKI_GUI_Key_Color = LOKI_GUI_Key_Color + 1;
		If (LOKI_GUI_Key_Color > 7) Then {LOKI_GUI_Key_Color = 1};

		switch (LOKI_GUI_Key_Color) do
		{
			case 1:	{_color = [1,0,0,1];};
			case 2:	{_color = [0,1,0,1];};
			case 3:	{_color = [1,0.5,0,1];};
			case 4:	{_color = [0,1,1,1];};
			case 5:	{_color = [1,1,1,1];};
			case 6:	{_color = [1,1,0,1];};
			case 7:	{_color = [0,0,1,1];};
		};

		{
			_displayIDD = _this select 0;
			_control = (findDisplay _displayIDD) displayCtrl _x;
			_control ctrlSetTextColor _color;
			_control ctrlCommit 0;
			
		} forEach 
				[
					// Main GUI's
					72000,72001,72002,72003,72004,72005,72006,72007,72008,72009,72010,
					
					// ListBox and ComboBox's
					72011,72012,
					
					// Set Buttons
					72100,72101,72102,72103,72104,72105,72106,72107,72108,72109,72110,72111,72112,72113,72114,
					
					// Start Screen Buttons
					72115,72116,72117,72118,
					
					// Work Buttons
					72119,72120,72121,72122,72123,72124,72125,72126,72127,72128,72129,72130,
					
					// Work2 Buttons
					72131,72132,72133,72134,72135,72136,72137,72138,72139,72140,72141,72142,
					
					// Sides Buttons					
					72143,72144,72145,72146,72147,72148,72149,721499,721433,721434,
					721435,721436,721437,721438,721439,721440,721441,721442,             // oops miss counted.. 
					
					// Movement Buttons
					72150,72151,72152,72153,72154,72155,72156,

					// Request Buttons
					72157,72158,72159,

					// Debug Buttons
					72160,72161,72162,72163,72164,72165,72166,72167,72168,72169,72170, // 72171 - 72199 reservered for future use
					
					// Cinema Buttons
					72300,72301,72302,72303,72304,
					72311,72312,72313,72314,72315,72316,72317,
					72321,72322,72323,72324,72325,72326,72327,
					72331,72332,72333,72334,72335,72336,72337,72338, // 72339 - 72350 reservered for future use
					
					// Fun Buttons
					72351,72352,72353,72354,72355, // 72356 - 72379 reservered for future use
					
					// Music Player
					72380,72381,72382,72383,72384,72385, // 72386 - 72400 reservered for future use
					
					// Modules Buttons
					72401,72402,72403,72404,72405,72406,
					72411,72412,72413,72414,72415,72416,72417,72418,72419, // 72420 - 72451 reservered for future use
					
					//Test Buttons
					72601,72602,72603,72604,72605,72606,72607,72608,72609,72610,72611,72612,72613,72614,72615,
					72616,72617,72618,72619,72620,72621,72622,72623,72624,72625,72626,72627,72628,72629,72630,
					72631,72632,72633,72634,72635,72636,72637,72638,72639,72640,72641,72642,72643,72644,72645,
					72646,72647,72648,72649,72650
					
				];
				


