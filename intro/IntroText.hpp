class Titel1
{
	idd=1230090;
	movingEnable=0;
	duration=10;
	name="titel1";
	controls[]={"titel1"};
	class titel1: LOKI_RscText
	{
		idc=666676;
		style="16+2+512";
		lineSpacing=0.950000;
		text="Made 2010 by LOKI\n\n                   for life's little pleasures...";
		x=0.39000000;
		y=0.9100000;
		w=0.900000;
		h=0.700000;
		colorBackground[]={0,0,0,0};
		colorText[]={0.8,0.9,0.9,0.7};
		size=0.75;
		sizeEx = 0.026;
	};
};

class LOKI_MissionName
{
	idd=-1;
	movingEnable=0;
	duration=10;
	fadein=1;
	name="LOKI_MissionName";
//	sizeEx = 256;

	controls[]={"eWalkabout"};

	class eWalkabout : LOKI_RscPicture
	{
		x=0.27; y=0.30; w=0.5; h=0.225;
		text="\loki_lost_key\intro\img\eWalkabout.paa";
		sizeEx = 256;
	};
};



class a2Logo
{
	idd=-1;
	movingEnable=0;
	duration=10;
	name="a2Logo";
	sizeEx = 256;

	controls[]={"Picture"};

	class Picture : LOKI_RscPicture
	{
			x=0.37;
			y=0.1;
			w=0.3;
			h=0.2;
		text="\ca\ui\data\ui_logo_main_ca.paa";
		sizeEx = 256;
	};
};



	
class sanford
{
	idd=-1;
	movingEnable=0;
	duration=10;
	name="sanford";
	sizeEx = 256;

	controls[]={"Picture"};

	class Picture : LOKI_RscPicture
	{
		x=0.01; y=0.8; w=0.15; h=0.2;
		text="\loki_lost_key\intro\img\sanford.paa";
		sizeEx = 256;
	};	
};

class redfist
{
	idd=-1;
	movingEnable=0;
	duration=10;
	name="redfist";
	sizeEx = 256;

	controls[]={"Picture"};

	class Picture : LOKI_RscPicture
	{
		x=0.01; y=0.8; w=0.15; h=0.2;
		text="\loki_lost_key\intro\img\redfist.paa";
		sizeEx = 256;
	};	
};
class resistance
{
	idd=-1;
	movingEnable=0;
	duration=10;
	name="resistance";
	sizeEx = 256;

	controls[]={"Picture"};

	class Picture : LOKI_RscPicture
	{
		x=0.01; y=0.8; w=0.15; h=0.2;
		text="\loki_lost_key\intro\img\resistance.paa";
		sizeEx = 256;
	};	
};


// intro text

	class intro1
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=2;
	  	fadein=1;
	  	fadeout=1;
	  	name="intro1";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="all that matters on a walkabout ...";
	  	  	colorText[]={0,0.72,0,1};
	  	  	sizeEx = 0.08;
			x=0.0;
	  	  	y=0.25;
	  	  	w=1.0;
	  	  	h=0.2;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0,0.33,0,0.5};
	  	  	sizeEx = 0.04;
			x=0.0;
	  	  	y=0.85;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};
	class intro2
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="intro2";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text=" ... is finding the thing that can not be found ...  ";
	  	  	colorText[]={0,0.72,0,1};
	  	  	sizeEx = 0.08;
			x=0.0;
	  	  	y=0.45;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};
	
	class intro1a
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=2;
	  	fadein=1;
	  	fadeout=1;
	  	name="intro1";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="all that matters on a walkabout ...";
	  	  	colorText[]={0,0,0,1};
	  	  	sizeEx = 0.08;
			x=0.0;
	  	  	y=0.25;
	  	  	w=1.0;
	  	  	h=0.2;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0,0.33,0,0.5};
	  	  	sizeEx = 0.04;
			x=0.0;
	  	  	y=0.85;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};
	class intro2a
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="intro2";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text=" ... is finding the thing that can not be found ...  ";
	  	  	colorText[]={0,0,0,1};
	  	  	sizeEx = 0.08;
			x=0.0;
	  	  	y=0.25;
	  	  	w=1.0;
	  	  	h=0.2;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};	
	
	
	
	
	class end
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=7;
	  	fadein=1;
	  	fadeout=1;
	  	name="end";
	  	controls[]={"endtext","endtext2"};
	  	
	  	class endtext : RscTitleText
		{
	  	  	text="GAME OVER!";
	  	  	colorText[]={1,1,1,1};
	  	  	sizeEx = 0.08;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	
	  	class endtext2 : RscTitleText
		{
	  	  	text="GAME OVER!";
	  	  	colorText[]={0.5,0.5,1,0.2};
	  	  	sizeEx = 0.09;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};
	class outro1
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=2;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro1";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="There's a conflict in every human heart... ";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.2;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="  ";
	  	  	colorText[]={0,0.33,0,0.5};
	  	  	sizeEx = 0.04;
			x=0.0;
	  	  	y=0.85;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};
	class outro2
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro2";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="between the rational and irrational...  ";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
		
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};

	class outro3
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro3";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="between good and evil... ";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};			
	class outro4
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro4";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="and good does not always triumph. ";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};	
	};			
	class outro5
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro5";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="Sometimes... ";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	};				
	class outro6
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro6";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="the dark side ";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};
	class outro7
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro7";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="overcomes what Lincoln called";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};
	class outro8
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outro8";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="the better angels of our nature.  ";
	  	  	colorText[]={0.22,0.22,0.22,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="";
	  	  	colorText[]={0.8,0.8,0.8,1};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};	
	class outroM1
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outroM1";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="Thanks for playing.";
	  	  	colorText[]={0,0.72,0,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="YOUR MISSION NAME";
	  	  	colorText[]={0.8,0.8,0.8,0.72};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};	
	class outroM2
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outroM2";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="CLASSIFIED";
	  	  	colorText[]={0.72,0.,0,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="Island Location:";
	  	  	colorText[]={0.8,0.8,0.8,0.72};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};
			class outroM2a
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outroM2a";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="8";
	  	  	colorText[]={0.72,0.,0,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="active operators in theater:";
	  	  	colorText[]={0.8,0.8,0.8,0.72};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};	
	class outroM3
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outroM3";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="UNKNOWN";
	  	  	colorText[]={0.72,0.,0,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="Island Population:";
	  	  	colorText[]={0.8,0.8,0.8,0.72};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};
	class outroM4
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outroM4";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="11km X 11km";
	  	  	colorText[]={0.72,0.,0,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="Island Size:";
	  	  	colorText[]={0.8,0.8,0.8,0.72};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};
		class outroM5
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outroM5";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="others to enjoy  :)";
	  	  	colorText[]={0,0.72,0,0.72};
	  	  	sizeEx = 0.05;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="created for the:";
	  	  	colorText[]={0.8,0.8,0.8,0.72};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};						
	class outroLOKI
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	fadein=1;
	  	fadeout=1;
	  	name="outroLOKI";
	  	controls[]={"title1","title2"};
	  	
	  	class title1 : RscTitleText
		{
	  	  	text="YOURNAMEHERE";
	  	  	colorText[]={0,0.72,0,0.72};
	  	  	sizeEx = 0.06;
			x=0.0;
	  	  	y=0.75;
	  	  	w=1.0;
	  	  	h=0.1;
		};
	  	class title2 : RscTitleText
		{
	  	  	text="Created by:";
	  	  	colorText[]={0.8,0.8,0.8,0.72};
	  	  	sizeEx = 0.03;
			x=0.0;
	  	  	y=0.7;
	  	  	w=1.0;
	  	  	h=0.1;
		};			
		
	};			