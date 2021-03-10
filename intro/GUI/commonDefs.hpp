#ifndef _COMMON_DEFS_HPP
#define _COMMON_DEFS_HPP

#define true 1
#define false 0

#define ReadAndWrite 0 //! any modifications enabled
#define ReadAndCreate 1 //! only adding new class members is allowed
#define ReadOnly 2 //! no modifications enabled
#define ReadOnlyVerified 3 //! no modifications enabled, CRC test applied

#define FontMAIN "TahomaB"
#define FontDEBUG "LucidaConsoleB"

#define SizeXSmall ( 16 / 408 )
#define SizeSmall ( 16 / 408 )
#define SizeNormal ( 21 / 408 )
#define SizeMedium ( 29 / 408 )
#define SizeLarge ( 36 / 408 )

#define SizeTitle 0.08
#define SizeBookTitle 0.06
#define SizeBook 0.05
#define SizeHint 0.0468
#define SizeListBig  0.042
#define SizeList  0.0378

#define SizeMapMarker  32

#define Black 0, 0, 0
#define Green 0.0, 0.6, 0.0
#define Red 0.7, 0.1, 0.0
#define Yellow 0.8, 0.6, 0.0
#define White 0.8, 0.8, 0.8
#define ShineGreen 0.07, 0.7, 0.2
#define ShineRed 1, 0.2, 0.2
#define ShineYellow 1, 1, 0
#define ShineWhite 1, 1, 1
#define Blue 0.1, 0.1, 0.9

#define Gray1 0.00, 0.00, 0.00
#define Gray2 0.20, 0.20, 0.20
#define Gray3 0.50, 0.50, 0.50
#define Gray4 0.60, 0.60, 0.60
#define Gray5 0.80, 0.80, 0.80

#endif