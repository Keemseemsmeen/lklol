// SPON RearView v0.3.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
// File: SPON\RearView\ui\recognise.hpp
//
// Description:
//   RearView overlay definition.
//
// -----------------------------------------------------------------------------

#include "handles.hpp"

#define CAMERA_IMAGE "\ca\Wheeled\data\stryker_driver_optic_ca.paa"

// -----------------------------------------------------------------------------

class SPON_RV_cameraOverlay
{
	idd = SPON_RV_DISPLAY_IDD;
	
	movingEnable =  1;
	duration     =  999999;
	fadein       =  0;
	fadeout      =  0;
	name = "SPON RearView camera overlay";
	
	onLoad = "_this call SPON_RV_onLoad;";

	// -------------------------------------------------------------------------
	
	class ControlsBackground
	{
		class BackgroundLeft : SPON_rscBackground
		{
			colorBackground[] = { 0, 0, 0, 1 };
			
			x = -1.1;
			y = -0.1;
			w = 1.1;
			h = 1.2;
		};
		
		class BackgroundRight : BackgroundLeft
		{
			x = 1;
			w = 1.1;
		};
		
		class CameraView : SPON_rscPicture
		{
			text = CAMERA_IMAGE;
			
			x = -0.012;
			y = -0.135;
			
			w = 1.02;
			h = 1.375;
		};
	};
	
	// -------------------------------------------------------------------------
	
	Objects[] = { };
	
	// -------------------------------------------------------------------------
	
	class Controls
	{
		// Direction camera is looking in.
		class Direction : SPON_rscLabel
		{
			idc = SPON_RV_DIRECTION_IDC;
			
			style = ST_CENTER;
			
			text = "<Direction>";
			x = 0.27;
			y = 0.09;
			w = 0.6;
		};
	};
};
