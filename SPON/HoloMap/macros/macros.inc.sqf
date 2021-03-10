// SPON HoloMap v0.4.0 (Mission-script version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

// -----------------------------------------------------------------------------
// SPON macros (#include this file).
//
// Description:
//   Useful macros. Both general macros and those specific to debugging via
//   the SPON Core debug log and error dialogs.
//
// -----------------------------------------------------------------------------
// Type-checking macros.
#define SPON_IS_ARRAY(X)   ((typeName (X)) == "ARRAY")
#define SPON_IS_BOOL(X)    ((typeName (X)) == "BOOL")
#define SPON_IS_CODE(X)    ((typeName (X)) == "CODE")
#define SPON_IS_CONFIG(X)  ((typeName (X)) == "CONFIG")
#define SPON_IS_CONTROL(X) ((typeName (X)) == "CONTROL")
#define SPON_IS_DISPLAY(X) ((typeName (X)) == "DISPLAY")
#define SPON_IS_GROUP(X)   ((typeName (X)) == "GROUP")
#define SPON_IS_OBJECT(X)  ((typeName (X)) == "OBJECT")
#define SPON_IS_SCALAR(X)  ((typeName (X)) == "SCALAR")
#define SPON_IS_SCRIPT(X)  ((typeName (X)) == "SCRIPT")
#define SPON_IS_SIDE(X)    ((typeName (X)) == "SIDE")
#define SPON_IS_STRING(X)  ((typeName (X)) == "STRING")
#define SPON_IS_TEXT(X)    ((typeName (X)) == "TEXT")

#define SPON_IS_NUMBER(X)  ((typeName (X)) == "SCALAR")
#define SPON_IS_INTEGER(X)  (SPON_IS_SCALAR(X) and (floor(X) == (X)))

// SPON Types.
#define SPON_TYPE_ASSOC "#SPON#ASSOC#"
#define SPON_TYPE_SET "#SPON#SET#"
#define SPON_IS_ASSOC(X) (((X) select 0) == SPON_TYPE_ASSOC)
#define SPON_IS_SET(X) (((X) select 0) == SPON_TYPE_SET)

// === Splitting an array into a number of variables ===
#define SPON_EXPLODE_2(X,A,B) \
	A = (X) select 0; B = (X) select 1
	
#define SPON_EXPLODE_3(X,A,B,C) \
	A = (X) select 0; B = (X) select 1; C = (X) select 2
	
#define SPON_EXPLODE_4(X,A,B,C,D) \
	A = (X) select 0; B = (X) select 1; C = (X) select 2; D = (X) select 3
	
#define SPON_EXPLODE_5(X,A,B,C,D,E) \
	SPON_EXPLODE_4(X,A,B,C,D); E = (X) select 4;
	
#define SPON_EXPLODE_6(X,A,B,C,D,E,F) \
	SPON_EXPLODE_4(X,A,B,C,D); E = (X) select 4; F = (X) select 5
	
#define SPON_EXPLODE_7(X,A,B,C,D,E,F,G) \
	SPON_EXPLODE_4(X,A,B,C,D); E = (X) select 4; F = (X) select 5; G = (X) select 6
	
#define SPON_EXPLODE_8(X,A,B,C,D,E,F,G,H) \
	SPON_EXPLODE_4(X,A,B,C,D); E = (X) select 4; F = (X) select 5; G = (X) select 6; H = (X) select 7

// === Getting parameters passed to a code block (function) ===
#define SPON_GET_PARAMS_1(A) \
	private 'A'; A = _this select 0
	
#define SPON_GET_PARAMS_2(A,B) \
	private ['A', 'B']; SPON_EXPLODE_2(_this,A,B)
	
#define SPON_GET_PARAMS_3(A,B,C) \
	private ['A', 'B', 'C']; SPON_EXPLODE_3(_this,A,B,C)
	
#define SPON_GET_PARAMS_4(A,B,C,D) \
	private ['A', 'B', 'C', 'D']; SPON_EXPLODE_4(_this,A,B,C,D)
	
#define SPON_GET_PARAMS_5(A,B,C,D,E) \
	private ['A', 'B', 'C', 'D', 'E']; SPON_EXPLODE_5(_this,A,B,C,D,E)
	
#define SPON_GET_PARAMS_6(A,B,C,D,E,F) \
	private ['A', 'B', 'C', 'D', 'E', 'F']; SPON_EXPLODE_6(_this,A,B,C,D,E,F)
	
#define SPON_GET_PARAMS_7(A,B,C,D,E,F,G) \
	private ['A', 'B', 'C', 'D', 'E', 'F', 'G']; SPON_EXPLODE_7(_this,A,B,C,D,E,F,G)
	
#define SPON_GET_PARAMS_8(A,B,C,D,E,F,G,H) \
	private ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']; SPON_EXPLODE_8(_this,A,B,C,D,E,F,G,H)

	
#define SPON_GET_DEFAULT_PARAM(INDEX,NAME,DEF_VALUE) \
	private 'NAME'; \
	if (isNil "_this") then \
	{ \
		NAME = (DEF_VALUE); \
	} \
	else \
	{ \
		if ((count _this) > (INDEX)) then \
		{ \
			if (isNil {_this select (INDEX)}) then \
			{ \
				NAME = (DEF_VALUE); \
			} \
			else \
			{ \
				NAME = _this select (INDEX); \
			}; \
		} \
		else \
		{ \
			NAME = (DEF_VALUE); \
		}; \
	};
	
// === Array operations ===
#define SPON_PUSH(ARRAY,VALUE) (ARRAY) resize ((count (ARRAY)) + 1); (ARRAY) set [(count (ARRAY)) - 1, (VALUE)]
#define SPON_LAST(ARRAY) ((ARRAY) select ((count (ARRAY)) - 1))

// Some commonly used vehicle-checking operations.
#define SPON_IN_VEHICLE(X) ((vehicle (X)) != (X))
#define SPON_IS_DRIVING(X) (SPON_IN_VEHICLE(X) and ((driver (vehicle (X))) == (X)))
#define SPON_ON_FOOT(X) ((vehicle (X)) == (X))

// Wait until the player has properly synched in MP.
#define SPON_WAIT_FOR_PLAYER_SYNC() \
if ((not isServer) and (isNull player)) then \
{ \
	waitUntil { not (isNull player); }; \
	waitUntil { time > 10; }; \
}

// === Debugging ===
#ifdef SPON_THIS_FILE
#define SPON_ERROR_FILE 'SPON_THIS_FILE\n\n'
#endif
// #else	
#ifndef SPON_THIS_FILE
#define SPON_THIS_FILE ""
#define SPON_ERROR_FILE ""
#endif

// Trace with just a simple message.
#define SPON_TRACE(TEXT) \
	if SPON_debugMode then { ['SPON_THIS_FILE', TEXT] call SPON_debugAppendLog2; }
	
// Trace with a message and 1-8 variables to show.
#define SPON_TRACE_1(TEXT,A) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2', TEXT, A]] call SPON_debugAppendLog2; }
	
#define SPON_TRACE_2(TEXT,A,B) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2, B=%3', TEXT, A, B]] call SPON_debugAppendLog2; }
	
#define SPON_TRACE_3(TEXT,A,B,C) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2, B=%3, C=%4', TEXT, A, B, C]] call SPON_debugAppendLog2; }
	
#define SPON_TRACE_4(TEXT,A,B,C,D) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2, B=%3, C=%4, D=%5', TEXT, A, B, C, D]] call SPON_debugAppendLog2; }
	
#define SPON_TRACE_5(TEXT,A,B,C,D,E) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6', TEXT, A, B, C, D, E]] call SPON_debugAppendLog2; }
	
#define SPON_TRACE_6(TEXT,A,B,C,D,E,F) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7', TEXT, A, B, C, D, E, F]] call SPON_debugAppendLog2; }
	
#define SPON_TRACE_7(TEXT,A,B,C,D,E,F,G) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8', TEXT, A, B, C, D, E, F, G]] call SPON_debugAppendLog2; }
	
#define SPON_TRACE_8(TEXT,A,B,C,D,E,F,G,H) \
	if SPON_debugMode then { ['SPON_THIS_FILE', format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9', TEXT, A, B, C, D, E, F, G, H]] call SPON_debugAppendLog2; }

// === Assertion ===
#define SPON_ASSERTION_FAILED_TITLE "Assertion failed!"
#define SPON_ERROR_TITLE "Error!"

// e.g SPON_ASSERT(_frogIsDead,"The frog is alive");
#define SPON_ASSERT(CONDITION,MESSAGE) \
if (not (CONDITION)) then \
{ \
	[SPON_ERROR_FILE + 'Assertion (CONDITION) failed!\n\n'+ (MESSAGE), SPON_ASSERTION_FAILED_TITLE] call SPON_raiseError; \
	SPON_TRACE_1('Assertion (CONDITION) failed: MESSAGE',CONDITION); \
}

// e.g SPON_ASSERT_FALSE(_frogIsDead,"The frog died");
#define SPON_ASSERT_FALSE(CONDITION,MESSAGE) \
if (CONDITION) then \
{ \
	[SPON_ERROR_FILE + 'Assertion (not (CONDITION)) failed!\n\n' + (MESSAGE), SPON_ASSERTION_FAILED_TITLE] call SPON_raiseError; \
	SPON_TRACE_1('Assertion (not (CONDITION)) failed: MESSAGE',CONDITION); \
}

// e.g SPON_ASSERT_OP(_fish,>,5,"Too few fish ;(");
#define SPON_ASSERT_OP(A,OP,B,MESSAGE) \
if (not ((A) OP (B))) then \
{ \
	[SPON_ERROR_FILE + 'Assertion (A OP B) failed!\n' + 'A: ' + (str (A)) + '\n' + 'B: ' + (str (B)) + "\n\n" + (MESSAGE), SPON_ASSERTION_FAILED_TITLE] call SPON_raiseError; \
	SPON_TRACE_2('Assertion (A OP B) failed: MESSAGE',A,B); \
}

// e.g SPON_ASSERT_DEFINED(_anUndefinedVar,"Too few fish ;(");
#define SPON_ASSERT_DEFINED(VAR,MESSAGE) \
if (isNil VAR) then \
{ \
	[SPON_ERROR_FILE + 'Assertion (VAR is defined) failed!\n\n' + (MESSAGE), SPON_ASSERTION_FAILED_TITLE] call SPON_raiseError; \
	SPON_TRACE('Assertion (VAR is defined) failed: MESSAGE'); \
}

// Force an error.
#define SPON_ERROR(MESSAGE) \
[SPON_ERROR_FILE + "Manual error raised!\n\n" + (MESSAGE), SPON_ERROR_TITLE] call SPON_raiseError; \
SPON_TRACE_1(SPON_ERROR_TITLE,MESSAGE)

// Wait for a SPON Core component to be loaded.
#define SPON_WAIT_FOR_CORE() \
waitUntil { (not (isNil "SPON_Core_version")) or (time > 0) }; \
if (time > 0) then { hint "SPON Core not found before game started" }
