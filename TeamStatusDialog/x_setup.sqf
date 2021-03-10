#include "x_macros.sqf"

// edit this file and then run setupcopy.bat

// uncomment to show markers for sidemissions, main targets, etc.
//#define __DEBUG__

// uncomment to build the Two Teams version
//#define __TT__

// uncomment the corresponding #define preprocessor command
// use only one at a time
// comment all for the Two Teams version
#define __OWN_SIDE_WEST__
//#define __OWN_SIDE_EAST__
//#define __OWN_SIDE_GUER__

// uncomment the corresponding #define preprocessor command
// select which version you want to create
// you can uncomment multiple versions
// comment all for the Two Teams version
//#define __AI__
//#define __REVIVE__
//#define __ACE__
//#define __WOUNDS__
#define __OA__ // OA Only version
//#define __MANDO__

// uncomment if you want a ranked version like in Evolution
//#define __RANKED__

// for Carrier Domi
//#define __CARRIER__

// #define __DEFAULT__ for the default Chernarus version
// uncomment the corresponding preprocessor command for the version you want. Default is __DEFAULT__
// use only one at a time
// comment all for the Two Teams version
#define __DEFAULT__
//#define __EVERON__

#define __D_VER_NAME__ "Domination! One Team - West OA"
//#define __D_VER_NAME__ "Domination! One Team - A.C.E."
//#define __D_VER_NAME__ "Domination! One Team - West AI"
//#define __D_VER_NAME__ "Domination! One Team - West REVIVE"
//#define __D_VER_NAME__ "Domination! One Team - East"
//#define __D_VER_NAME__ "Domination! One Team - East AI"
//#define __D_VER_NAME__ "Domination! One Team - East Revive"
//#define __D_VER_NAME__ "Domination! Two Teams"

// uncomment, if you want the old intro
//#define __OLD_INTRO__

// if true then the old engineer (faster) script gets used
//#define __ENGINEER_OLD__

// respawn delay after death
// doesn't get used in the revive version
#define D_RESPAWN_DELAY 20

//#define __SMMISSIONS_MARKER__
