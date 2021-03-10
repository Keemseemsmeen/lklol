class CfgPatches
{
	class Loki_Lost_Key
	{
		units[] ={};
		weapons[] ={};
		requiredAddons[] = {"Extended_EventHandlers","CAUI"};
		requiredVersion  = 1.00;
		version          = 0.01;
	};

};	
	

class Extended_PreInit_EventHandlers
{
    init = "if ((isNil ""loki_LostKey"")) then { loki_LostKey = true; [] execVM ""\loki_lost_key\init.sqf"";}";
        
};


#include "\loki_lost_key\include.hpp"

class RscTitleText
  {
	type=0;
	idc=-1;
	style=2;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,0.5};
	font="TahomaB";
	size=1;
  };




class RscTitles
{
	
	
	titles[]=
	{
		"intro1","intro2","intro1a","intro2a","end","outro1","outro2","outro3","outro4","outro5","outro6","outro7","outro8"
		,"outroM1","outroM2","outroM2a","outroM3","outroLOKI","outroM4","outroM5","RscUnitInfoUAV_gunner"
		,"Titel1","LOKI_MissionName","a2Logo","sanford","redfist","resistance","Loki_FU"
		
		,"lostkey","loki"
	}; 
	
#include "\loki_lost_key\R3F_ARTY_AND_LOG\desc_rsct_include.h"
#include "\loki_lost_key\intro\IntroText.hpp"
//#include "\loki_lost_key\SPON\Scuba\ui\scuba.hpp"
#include "\loki_lost_key\SPON\RearView\ui\rearView.hpp"
	
class Loki_FU
{
	idd=-1;
	movingEnable=0;
	duration=10;
	name="Loki_FU";
	sizeEx = 256;

	controls[]={"Picture"};

	class Picture : LOKI_RscPicture
	{
		x=0.01; y=0.8; w=0.15; h=0.2;
		text="\loki_lost_key\gui\img\fukyou.paa";
		sizeEx = 256;
	};
};		
class lostkey
{
	idd=-1;
	movingEnable=0;
	duration=10;
	name="lostkey";
	sizeEx = 256;

	controls[]={"Picture"};

	class Picture : LOKI_RscPicture
	{
		x=0.01; y=0.8; w=0.15; h=0.2;
		text="\loki_lost_key\gui\img\lostkey.paa";
		sizeEx = 256;
	};
};	
class loki
{
	idd=-1;
	movingEnable=0;
	duration=10;
	name="loki";
	sizeEx = 256;

	controls[]={"Picture"};

	class Picture : LOKI_RscPicture
	{
		x=0.01; y=0.8; w=0.15; h=0.2;
		text="\loki_lost_key\gui\img\loki.paa";
		sizeEx = 256;
	};
};	




	class loki_debug_hint {
		idd = loki_debug_hint_IDD;
		onLoad = "with uiNameSpace do { loki_debug_hint = _this select 0 };";
		movingEnable = 0;
		duration = 1;
		fadeIn = "false";
		fadeOut = "false";
		controls[] = {"loki_hint_BG", "loki_hint_text", "loki_hint_text2"};
		
		class loki_hint_BG {
			idc = -1;
			type = CT_STATIC;
			font = "TahomaB";
			colorBackground[] = {0.1882, 0.2588, 0.149, 0.76};
			colorText[] = {0, 0, 0, 0};
			text = "";
			style = 128;
			sizeEx = ( 16 / 408 );
			x = 0;
			y = safezoneY;
			h = 0.08;
			w = 0.38;
		};
		
		class loki_hint_text : loki_hint_BG {
			idc = loki_hint_text_IDC;
			style = ST_CENTER;
			x = 0.01;
			h = 0.033;
			w = 0.37;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0.388, 0.545, 0.247, 0};
			font = "Zeppelin32";
			sizeEx = 0.03;
		};
		
		class loki_hint_text2 : loki_hint_text {
			idc = loki_hint_text2_IDC;
			y = safezoneY + 0.033;
		};
	};
};	

class CfgSounds
{

// Lost Key Sounds

    class Mission_Intro
   {
   name = "Mission_Intro";
   sound[] = {"\loki_lost_key\intro\sounds\Mission_Intro.ogg", 1.5, 1};
   titles[] = {Mission_Intro};
   };   
      class Mission_Intro1
  {
   name = "Mission_Intro1";
   sound[] = {"\loki_lost_key\intro\sounds\Mission_Intro1.ogg", 1.1, 1};
   titles[] = {Mission_Intro1};
  };  	
	 
      class Mission_Intro2
  {
   name = "Mission_Intro2";
   sound[] = {"\loki_lost_key\intro\sounds\Mission_Intro2.ogg", 2.0, 1};
   titles[] = {Mission_Intro2};
  };  
 
      class Mission_Intro3
  {
   name = "Mission_Intro3";
   sound[] = {"\loki_lost_key\intro\sounds\Mission_Intro3.ogg", 2.0, 1};
   titles[] = {Mission_Intro3};
  };  
      class Mission_Intro_Extended
  {
   name = "Mission_Intro_Extended";
   sound[] = {"\loki_lost_key\intro\sounds\Mission_Intro_Extended.ogg", 2.0, 1};
   titles[] = {Mission_Intro_Extended};
  }; 
  
    class Mission_Outro
   {
   name = "Mission_Outro";
   sound[] = {"\loki_lost_key\intro\sounds\Mission_Outro.ogg", 2.0, 1};
   titles[] = {Mission_Outro};
   };  	

    class Mission_Intro_short
   {
   name = "Mission_Intro_short";
   sound[] = {"\loki_lost_key\sounds\Mission_Intro_short.ogg", 2.5, 1};
   titles[] = {Mission_Intro_short};
   };

    class Yippe_Yay
   {
   name = "Yippe_Yay";
   sound[] = {"\loki_lost_key\sounds\Yippe_Yay.ogg", 2.5, 1};
   titles[] = {Yippe_Yay};
   };

    class Tool_46
   {
   name = "Tool_46";
   sound[] = {"\loki_lost_key\sounds\Tool_46.ogg", 2.5, 1};
   titles[] = {Tool_46};
   };

    class just_a_gigolo
   {
   name = "just_a_gigolo";
   sound[] = {"\loki_lost_key\sounds\just_a_gigolo.ogg", 2.5, 1};
   titles[] = {just_a_gigolo};
   };

   class mando_console_on
   {
   name = "mando_console_on";
   sound[] = {"\loki_lost_key\sounds\mando_console_on.ogg", 2.5, 1};
   titles[] = {mando_console_on};
   };

    class R_incoming
   {
   name = "R_incoming";
   sound[] = {"\loki_lost_key\sounds\R_incoming.ogg", 2.5, 1};
   titles[] = {R_incoming};
   };

    class Explo_Large
   {
   name = "Explo_Large";
   sound[] = {"\loki_lost_key\sounds\Explo_Large.ogg", 2.5, 1};
   titles[] = {Explo_Large};
   };

    class scalarDown
   {
   name = "scalarDown";
   sound[] = {"\loki_lost_key\sounds\scalarDown.ogg", 2.5, 1};
   titles[] = {scalarDown};
   };

    class SP_Pokerface
   {
   name = "SP_Pokerface";
   sound[] = {"\loki_lost_key\sounds\SP_Pokerface.ogg", 2.5, 1};
   titles[] = {SP_Pokerface};
   };
   
    class lastwords
   {
   name = "lastwords";
   sound[] = {"\loki_lost_key\sounds\lastwords.ogg", 2.5, 1};
   titles[] = {lastwords};
   }; 
   
// AC130 Sounds
class LDL_gun01
{
	name = "LDL_gun01";
	sound[] = {"\loki_lost_key\LDL_ac130\Sounds\gun01.ogg", db+3, 1.0};
	titles[]= {}; 
};
		
class LDL_gun02
{
	name = "LDL_gun02";
	sound[] = {"\loki_lost_key\LDL_ac130\Sounds\gun02.ogg", db+3, 1.0};
	titles[]= {}; 
};
		
class LDL_gun03
{
	name = "LDL_gun03";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\gun03.ogg, db+5, 1.0};
	titles[]= {}; 
};
			
class LDL_reload
{
	name = "LDL_reload";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\reload.ogg, db+5, 1.0};
	titles[]= {}; 
};
	
class LDL_Amb01
{
	name = "LDL_Amb01";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb01.ogg, db+2, 1.0};
	titles[]= {}; 
};
	
class LDL_Amb02
{
	name = "LDL_Amb02";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb02.ogg, db+2, 1.0};
	titles[]= {}; 
};
	
class LDL_Amb03
{
	name = "LDL_Amb03";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb03.ogg, db+2, 1.0};
	titles[]= {}; 
};
		
class LDL_Amb04
{
	name = "LDL_Amb04";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb04.ogg, db+2, 1.0};
	titles[]= {}; 
};
		
class LDL_Amb05
{
	name = "LDL_Amb05";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb05.ogg, db+2, 1.0};
	titles[]= {}; 
};
		
class LDL_Amb06
{
	name = "LDL_Amb06";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb06.ogg, db+2, 1.0};
	titles[]= {}; 
};
		
class LDL_Amb07
{
	name = "LDL_Amb07";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb07.ogg, db+2, 1.0};
	titles[]= {}; 
};
		
class LDL_Amb08
{
	name = "LDL_Amb08";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb08.ogg, db+2, 1.0};
	titles[]= {}; 
};
		
class LDL_Amb09
{
	name = "LDL_Amb09";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb09.ogg, db+2, 1.0};
	titles[]= {}; 
};
		
class LDL_Amb10
{
	name = "LDL_Amb10";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\Amb10.ogg, db+2, 1.0};
	titles[]= {}; 
};

class LDL_beep_short
{
	name = "LDL_beep_short";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\beep_short.ogg, db+0, 1.0};
	titles[]= {}; 
};

class LDL_beep_long
{
	name = "LDL_beep_long";
	sound[] = {\loki_lost_key\LDL_ac130\Sounds\beep_long.ogg, db+0, 1.0};
	titles[]= {}; 
};  

//---------------------LK Script Pack Sounds--------------------------------

	class nuke1s
	{
		name = "nuke1s"; // Name for mission editor
		sound[] = {\loki_lost_key\lk\sound\nuke1s.wss, db + 100, 1.0};
		titles[] = {0, ""};
	};
	class nuke2s
	{
		name = "nuke2s"; // Name for mission editor
		sound[] = {\loki_lost_key\lk\sound\nuke2s.wss, db + 10, 1.0};
		titles[] = {0, ""};
	};
	class radzoneb
	{
		name = "radzoneb"; // Name for mission editor
		sound[] = {\loki_lost_key\lk\sound\radiation.ogg, db + 0, 1.0};
		titles[] = {0, ""};
	};
	class incoming
	{
		name = "incoming"; // Name for mission editor
		sound[] = {\loki_lost_key\lk\sound\incoming.ogg, db + 0, 1.0};
		titles[] = {0, ""};
	};
	class nblast
	{
		name = "nblast"; // Name for mission editor
		sound[] = {\loki_lost_key\lk\sound\tom.wss, db + 2, 1.0};
		titles[] = {0, ""};
	};
 

// last bracket cfg_sounds
};

///////////////////////////////////////////////////////////////////////////////////////////