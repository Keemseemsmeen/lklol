// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
// File: SPON\Core\ui\error.hpp
//
// Description:
//   Error dialog.
//
// -----------------------------------------------------------------------------

#ifndef SPON_CORE_ERROR_HPP
#define SPON_CORE_ERROR_HPP

#include "handles.hpp"

#define SPON_CORE_ERROR_DIALOG_WIDTH 0.6

#define SPON_CORE_ERROR_TITLE_HEIGHT SPON_HEADING_HEIGHT
#define SPON_CORE_ERROR_MESSAGE_HEIGHT 0.3
#define SPON_CORE_ERROR_EDIT_HEIGHT SPON_EDIT_HEIGHT
#define SPON_CORE_ERROR_CLOSE_HEIGHT SPON_BUTTON_HEIGHT

#define SPON_CORE_ERROR_DIALOG_HEIGHT (SPON_CORE_ERROR_TITLE_HEIGHT + SPON_CORE_ERROR_MESSAGE_HEIGHT + SPON_CORE_ERROR_EDIT_HEIGHT + SPON_CORE_ERROR_CLOSE_HEIGHT + (SPON_VERTICAL_SPACING * 5))
#define SPON_CORE_ERROR_DIALOG_Y ((1 - SPON_CORE_ERROR_DIALOG_HEIGHT) / 2)

#define SPON_CORE_ERROR_TITLE_Y (SPON_CORE_ERROR_DIALOG_Y + SPON_VERTICAL_SPACING)
#define SPON_CORE_ERROR_MESSAGE_Y (SPON_CORE_ERROR_TITLE_Y + SPON_CORE_ERROR_TITLE_HEIGHT + SPON_VERTICAL_SPACING)
#define SPON_CORE_ERROR_EDIT_Y (SPON_CORE_ERROR_MESSAGE_Y + SPON_CORE_ERROR_MESSAGE_HEIGHT + SPON_VERTICAL_SPACING)
#define SPON_CORE_ERROR_CLOSE_Y (SPON_CORE_ERROR_EDIT_Y + SPON_CORE_ERROR_EDIT_HEIGHT + SPON_VERTICAL_SPACING)

// Centre the dialog.
#define SPON_CORE_ERROR_DIALOG_X ((1 - SPON_CORE_ERROR_DIALOG_WIDTH) / 2)
#define SPON_CORE_ERROR_DIALOG_Y ((1 - SPON_CORE_ERROR_DIALOG_HEIGHT) / 2)

#define SPON_CORE_ERROR_CONTROL_X (SPON_CORE_ERROR_DIALOG_X + SPON_HORIZONTAL_SPACING)
#define SPON_CORE_ERROR_CONTROL_WIDTH (SPON_CORE_ERROR_DIALOG_WIDTH - (SPON_HORIZONTAL_SPACING * 2))

#define SPON_CORE_ERROR_CLOSE_X ((1 - SPON_BUTTON_WIDTH) / 2)

class SPON_Core_ErrorDialog
{
	idd = SPON_ERROR_DIALOG_IDD;
	
	movingEnable = true;
	
	controlsBackground[] =
	{
		background
	};
	
	class background : SPON_rscBackground
	{
		 x = SPON_CORE_ERROR_DIALOG_X;
		 y = SPON_CORE_ERROR_DIALOG_Y;
		 
		 w = SPON_CORE_ERROR_DIALOG_WIDTH;
		 h = SPON_CORE_ERROR_DIALOG_HEIGHT;
	};
	
	objects[] = { };
	
	controls[] =
	{
		Title,
		Message,
		Copy,
		CloseButton
	};
	
	
	// Main title.
	class Title : SPON_rscHeadingLabel
	{ 
		idc = SPON_ERROR_TITLE_IDC;
		text = "$STR_SPON_CORE_ERROR_DEFAULT_TITLE";

		x = SPON_CORE_ERROR_CONTROL_X;
		y = SPON_CORE_ERROR_TITLE_Y;
		 
		w = SPON_CORE_ERROR_CONTROL_WIDTH;
	};
	
	// Error message text.
	class Message : SPON_rscTextArea
	{
		idc = SPON_ERROR_MESSAGE_IDC;
		x = SPON_CORE_ERROR_CONTROL_X;
		y = SPON_CORE_ERROR_MESSAGE_Y;
		w = SPON_CORE_ERROR_CONTROL_WIDTH;
		
		h = SPON_CORE_ERROR_MESSAGE_HEIGHT;
		 
		text = "";
	};
	
	// Editable line so that message may be copy-and-pasted out.
	class Copy : SPON_rscEdit
	{
		idc = SPON_ERROR_EDIT_IDC;
		
		x = SPON_CORE_ERROR_CONTROL_X;
		y = SPON_CORE_ERROR_EDIT_Y;
		w = SPON_CORE_ERROR_CONTROL_WIDTH;
		h = SPON_CORE_ERROR_EDIT_HEIGHT;
	};
	
	class CloseButton : SPON_RscButton
	{
		x = SPON_CORE_ERROR_CLOSE_X;
		y = SPON_CORE_ERROR_CLOSE_Y;
		text = "$STR_SPON_CORE_CLOSE_BUTTON";
		action = "closeDialog 0;";
	};
};

#endif
