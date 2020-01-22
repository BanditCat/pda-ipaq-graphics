#ifndef PV_H_INCLUDED
#define PV_H_INCLUDED

#include <windows.h>  

/* Types */

struct PVColor {
  struct Color{
   Color( BYTE ri, BYTE gi, BYTE bi ) :
	r( ri ), g( gi ), b( bi ), a( 255 ){}
    BYTE r;
    BYTE g;
    BYTE b;
    BYTE a;
  } color;
  PVColor( void ) : color( 0, 0, 0 ){};
  PVColor( BYTE ri, BYTE gi, BYTE bi ) : 
	color( ri, gi, bi ){}
  DWORD dword( void ){ 
	return *( (DWORD*)( &color ) );
  };
};

struct PVInputs {
  BYTE penstatus;
  WORD penx;
  WORD peny;
  signed short int pendx;
  signed short int pendy;
  
  DWORD buttons;
};

struct PVDeviceInfo {
  WORD *screen;
  WORD deltax;
  WORD deltay; 
  WORD height;
  WORD width;

  BYTE bpp;
  BOOL inverted;

  BYTE redshift;
  BYTE redbits;
  BYTE blueshift;
  BYTE bluebits; 
  BYTE greenshift;
  BYTE greenbits;
};


/* Constants */

/* Return values */
#define PV_OK 0x0100	
#define PV_EXIT 0x0200
#define PV_ERROR 0x0300

/* Drawing constants */
#define PV_DITHER 0x0001
#define PV_TOSCREEN 0x0010
#define PV_TOPIXMAP 0x0020
#define PV_XOR 0x0100
/* Three d constants */
#define PVT_NOAA 0x0002
/* masks */
#define PV_DRAWMODEFLAGS 0x000f
#define PV_DRAWTARGETFLAGS 0x00f0
#define PV_DRAWBLITFLAGS 0x0f00

/* Button constants */
#define PV_BHUP 0x00000001
#define PV_BCUP 0x00010000
#define PV_BHDOWN 0x00000002
#define PV_BCDOWN 0x00020000
#define PV_BHLEFT 0x00000004
#define PV_BCLEFT 0x00040000
#define PV_BHRIGHT 0x00000008
#define PV_BCRIGHT 0x00080000
#define PV_BHA 0x00000010
#define PV_BCA 0x00100000
#define PV_BHB 0x00000020
#define PV_BCB 0x00200000
#define PV_BHC 0x00000040
#define PV_BCC 0x00400000
#define PV_BHD 0x00000080
#define PV_BCD 0x00800000

/* Pen constants */
#define PV_PHELD 0x01
#define PV_PCHANGED 0x02


/* Functions */
extern void PVPutPixel( WORD x, WORD y, PVColor color, DWORD flags );
extern void PVRect( WORD x1, WORD y1, WORD x2, WORD y2, PVColor c, DWORD flags );
extern void PVcls( PVColor c, DWORD flags );
extern PVColor PVrgb( BYTE r, BYTE g, BYTE b );
extern void PVUpdate();
extern void PVDontUpdate();
extern void PVSetErrorMessage( char *em );
extern void PVAlphaLine( WORD x1, WORD y1, BYTE a1, WORD x2, WORD y2, BYTE a2, PVColor c, DWORD flags );
extern void PVLine( WORD x1, WORD y1, WORD x2, WORD y2, PVColor c, DWORD flags );
extern void PVSetGamma( double g );
extern double PVGetGamma();

/* Globals */
extern int PVTick( double delta );
extern int PVInit();
extern void PVClose();

extern WORD *PVScreen;
extern PVInputs PVInput;
extern PVDeviceInfo PVDevice;

#endif
