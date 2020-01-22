#ifndef GXI_H_INCLUDED
#define GXI_H_INCLUDED

#include <windows.h>

struct GXDisplayProperties {
  DWORD cxWidth;
  DWORD cyHeight;		  
  long cbxPitch;		   
  long cbyPitch;		
  long cBPP;		
  DWORD ffFormat;		
};

struct GXKeyList {
  short vkUp;		
  POINT ptUp;			
  short vkDown;
  POINT ptDown;
  short vkLeft;
  POINT ptLeft;
  short vkRight;
  POINT ptRight;
  short vkA;
  POINT ptA;
  short vkB;
  POINT ptB;
  short vkC;
  POINT ptC;
  short vkStart;
  POINT ptStart;
};

struct GXScreenRect {
  DWORD dwTop;
  DWORD dwLeft;
  DWORD dwWidth;
  DWORD dwHeight;
};

WCHAR *GXIInit();

int (*GXOpenDisplay)(HWND hWnd, DWORD dwFlags);
int (*GXCloseDisplay)();
void * (*GXBeginDraw)();
int (*GXEndDraw)();
int (*GXOpenInput)();
int (*GXCloseInput)();
GXDisplayProperties (*GXGetDisplayProperties)();
GXKeyList (*GXGetDefaultKeys)(int iOptions);
int (*GXSuspend)();
int (*GXResume)();
int (*GXSetViewport)( DWORD dwTop, DWORD dwHeight, DWORD dwReserved1, DWORD dwReserved2 );
BOOL (*GXIsDisplayDRAMBuffer)();

#define GX_FULLSCREEN	0x01	
#define GX_NORMALKEYS	0x02
#define GX_LANDSCAPEKEYS	0x03

#ifndef kfLandscape
#define kfLandscape	0x8		
#define kfPalette	0x10
#define kfDirect	0x20
#define kfDirect555	0x40
#define kfDirect565	0x80
#define kfDirect888	0x100	
#define kfDirect444	0x200
#define kfDirectInverted 0x400
#endif

#endif
