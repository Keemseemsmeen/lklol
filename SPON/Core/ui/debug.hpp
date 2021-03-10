// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// -----------------------------------------------------------------------------
// File: SPON\Core\ui\debug.cpp
//
// Description:
//   Describes the debug log.
//
// -----------------------------------------------------------------------------

#ifndef SPON_SCRIPTS_DEBUG_HPP
#define SPON_SCRIPTS_DEBUG_HPP

#include "handles.hpp"

#define SPON_DEBUG_CLIENT_TITLE " Client Log "
#define SPON_DEBUG_SERVER_TITLE " Server Log "

#define SPON_DEBUG_ITEM_WIDTH 0.98
#define SPON_DEBUG_LIST_HEIGHT 0.35
#define SPON_DEBUG_ITEM_WIDTH (1 - (SPON_HORIZONTAL_SPACING * 2))
#define SPON_DEBUG_BUTTON_SIDE_INDENT 0.1

#define SPON_DEBUG_BUTTON_Y 0.94

class SPON_dlgDebugLog
{
	idd = SPON_DEBUG_DISPLAY_IDD;
	
	movingEnable = false;
	
	class logList : SPON_rscListBox
	{
		x = SPON_HORIZONTAL_SPACING;
		w = SPON_DEBUG_ITEM_WIDTH;
		h = SPON_DEBUG_LIST_HEIGHT;
		
		sizeEx = SPON_FONT_SIZE_SMALL;
	    rowHeight = SPON_FONT_SIZE_SMALL * 1.25;
	};
	
	controlsBackground[] = {background};
	class background : SPON_rscBackground
	{
		 x = 0.0;
		 y = 0.0;
		 
		 w = 1.0;
		 h = 1.0;
	};
	
	objects[] = { };
	controls[] =
	{
		clientTitle, clientList, clientCopy,
		bigList,
		serverTitle, serverList, serverCopy,
		autoUpdateButton, autoUpdateStatus,
		closeButton
	};
	
	class clientTitle : SPON_rscHeadingLabel
	{ 
		text = SPON_DEBUG_CLIENT_TITLE;

		x = SPON_HORIZONTAL_SPACING;
		y = 0;

		w = SPON_DEBUG_ITEM_WIDTH;
	};

	// List of previous debugging output.
	class clientList : logList
	{
		idc = SPON_DEBUG_CLIENT_LIST_IDC;
		x = SPON_HORIZONTAL_SPACING;
		y = SPON_HEADING_HEIGHT + SPON_VERTICAL_SPACING;

		onLBSelChanged = "_this call SPON_debugClientListSelChanged;";
	};
	
	// Larger list used when we don't have server listing.
	class bigList : clientList
	{
		idc = SPON_DEBUG_BIG_LIST_IDC;
		h = (SPON_DEBUG_LIST_HEIGHT * 2) + (SPON_VERTICAL_SPACING * 3) + SPON_EDIT_HEIGHT + SPON_HEADING_HEIGHT;
	};
	
	// Small editable area so that selected debug message may be copy-and-pasted out.
	class clientCopy : SPON_rscEdit
	{
		idc = SPON_DEBUG_CLIENT_EDIT_IDC;
		x = SPON_HORIZONTAL_SPACING;
		y = SPON_HEADING_HEIGHT + SPON_VERTICAL_SPACING + SPON_DEBUG_LIST_HEIGHT + SPON_VERTICAL_SPACING;
		w = SPON_DEBUG_ITEM_WIDTH;
		
		sizeEx = SPON_FONT_SIZE_SMALL;
	};
	
	class serverTitle : SPON_rscHeadingLabel
	{ 
		idc = SPON_DEBUG_SERVER_TITLE_IDC;
		text = SPON_DEBUG_SERVER_TITLE;

		x = SPON_HORIZONTAL_SPACING;
		y = SPON_HEADING_HEIGHT + SPON_VERTICAL_SPACING + SPON_DEBUG_LIST_HEIGHT + SPON_VERTICAL_SPACING + SPON_EDIT_HEIGHT + SPON_VERTICAL_SPACING;
		 
		w = SPON_DEBUG_ITEM_WIDTH;
	};
	
	// List of previous debugging output.
	class serverList : logList
	{
		idc = SPON_DEBUG_SERVER_LIST_IDC;
		x = SPON_HORIZONTAL_SPACING;
		y = SPON_HEADING_HEIGHT + SPON_VERTICAL_SPACING + SPON_DEBUG_LIST_HEIGHT + SPON_VERTICAL_SPACING + SPON_EDIT_HEIGHT + SPON_VERTICAL_SPACING + SPON_HEADING_HEIGHT + SPON_VERTICAL_SPACING;
		
		onLBSelChanged = "_this call SPON_debugServerListSelChanged;";
	};
	
	// Small editable area so that selected debug message may be copy-and-pasted out.
	class serverCopy : SPON_rscEdit
	{
		idc = SPON_DEBUG_SERVER_EDIT_IDC;
		x = SPON_HORIZONTAL_SPACING;
		y = SPON_HEADING_HEIGHT + SPON_VERTICAL_SPACING + SPON_DEBUG_LIST_HEIGHT + SPON_VERTICAL_SPACING + SPON_EDIT_HEIGHT + SPON_VERTICAL_SPACING + SPON_HEADING_HEIGHT + SPON_VERTICAL_SPACING + SPON_DEBUG_LIST_HEIGHT + SPON_VERTICAL_SPACING;
		w = SPON_DEBUG_ITEM_WIDTH;
		
		sizeEx = SPON_FONT_SIZE_SMALL;
	};

	// Toggle auto-update.
	class autoUpdateButton : SPON_rscButton
	{
		x = SPON_DEBUG_BUTTON_SIDE_INDENT;
		y = SPON_DEBUG_BUTTON_Y;

		text = "$STR_SPON_DEBUG_AUTO_UPDATE";
		action = "[] call SPON_debugToggleAutoUpdate;";
	};
	
	class autoUpdateStatus : SPON_rscLabel
	{
		idc = SPON_DEBUG_UPDATE_STATUS_IDC;
		text = "$STR_SPON_DEBUG_OFF";
		 
		x = SPON_DEBUG_BUTTON_SIDE_INDENT + SPON_BUTTON_WIDTH + SPON_HORIZONTAL_SPACING;
		y = SPON_DEBUG_BUTTON_Y;
		 
		w = 0.15;
	};
	
	// Button to close the window.
	class closeButton : SPON_RscButton
	{
		x = (1.0 - SPON_DEBUG_BUTTON_SIDE_INDENT) - SPON_BUTTON_WIDTH;
		y = SPON_DEBUG_BUTTON_Y;
		text = "$STR_SPON_CORE_CLOSE_BUTTON";
		action = "closeDialog 0;";
	};
};

#endif
