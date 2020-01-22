/* Core PVis functions */
#include "pvi.h"


/* Globals */
BYTE dith8[2][4] = { { 0, 4, 2 , 6 }, { 1, 5, 3, 7 } }; 
BYTE dith4[2][2] = { { 0, 2 }, { 1 , 3 } }; 


void PVPutPixel( WORD x, WORD y, PVColor c, DWORD flags ){
  WORD *sp,dx,dy,w,h;

  if( flags & PV_TOPIXMAP ){
    sp = PVCurrentPixmap->data;
    dy = ( w = PVCurrentPixmap->width );
    h = PVCurrentPixmap->height;
    dx = 1;
  } else {
    if( flags & PV_TOSCREEN )
      sp = PVDevice.screen;
    else
      sp = PVScreen;
    w = PVDevice.width;
    h = PVDevice.height;
    dx = PVDevice.deltax;
    dy = PVDevice.deltay;
  }

  if( ( x < w) && ( y < h ) ){
    if( flags & PV_DITHER ){
      c.color.r = ( c.color.r * 248 ) / 255;
      c.color.b = ( c.color.b * 248 ) / 255;
      c.color.g = ( c.color.g * 252 ) / 255;
      if( ( c.color.r & 7) > dith8[ x & 1 ][ y & 3 ] )
        c.color.r += 8;
      if( ( c.color.b & 7) > dith8[ x & 1 ][ y & 3 ] )
        c.color.b += 8;
      if( ( c.color.g & 3) > dith4[ x & 1 ][ y & 1 ] )
        c.color.g += 4;
    }

    switch( flags & PV_DRAWBLITFLAGS ){
     
      case PV_XOR:
        *( sp + ( dx * x ) + ( dy * y ) ) ^=
        ( ( ( c.color.b >> 3) << PVDevice.blueshift ) |
        ( ( c.color.r >> 3) << PVDevice.redshift ) |
        ( ( c.color.g >> 2 ) << PVDevice.greenshift ) );
      break;

      default:
        *( sp + ( dx * x ) + ( dy * y ) ) =
        ( ( ( c.color.b >> 3) << PVDevice.blueshift ) |
        ( ( c.color.r >> 3) << PVDevice.redshift ) |
        ( ( c.color.g >> 2 ) << PVDevice.greenshift ) );
      break;
    }

    if( !PVIDirty ) PVIDirty = !( flags & PV_DRAWTARGETFLAGS );
  }
}
  
void PVRect( WORD x1, WORD y1, WORD x2, WORD y2, PVColor c, DWORD flags ){
  WORD t, d, *p, *s, dx, dy, h, w;
  DWORD i, xn, yn, yo;

  if( flags & PV_TOPIXMAP ){
    s = PVCurrentPixmap->data;
    dy = ( w = PVCurrentPixmap->width );
    h = PVCurrentPixmap->height;
    dx = 1;
  } else {
    if( flags & PV_TOSCREEN )
      s = PVDevice.screen;
    else
      s = PVScreen;
    w = PVDevice.width;
    h = PVDevice.height;
    dx = PVDevice.deltax;
    dy = PVDevice.deltay;
  }

  if( x1 > x2 ){ t = x1; x1 = x2; x2 = t; }
  if( y1 > y2 ){ t = y1; y1 = y2; y2 = t; }

  if( x2 >= w ) x2 = w - 1;
  if( y2 >= h ) y2 = h - 1;
  if( ( x2 < w ) && ( y2 < h ) ){
      
    d =  ( ( ( c.color.b >> 3 ) << PVDevice.blueshift ) |
              ( ( c.color.r >> 3 ) << PVDevice.redshift ) |
              ( ( c.color.g >> 2 ) << PVDevice.greenshift ) );

    xn = 1 + x2 - x1;
    yn = 1 + y2 - y1;
    yo = dy - xn;
    p = s + ( x1 + dy * y1);

    switch( flags & PV_DRAWBLITFLAGS ){

      case PV_XOR:
        while( yn-- ){
          i = xn;
          while( i-- ) *( p++ ) ^= d;
          p += yo;
        }
      break;

      default:
        while( yn-- ){
          i = xn;
          while( i-- ) *( p++ ) = d;
          p += yo;
        }
      break;
    }

    if( !PVIDirty ) PVIDirty = !( flags & PV_DRAWTARGETFLAGS ); 
  }
}

void PVcls( PVColor c, DWORD flags ){
  PVRect( 0, 0, 0xffff, 0xffff, c, flags );
}

PVColor PVrgb( BYTE r, BYTE g, BYTE b ){
  PVColor tc;
  tc.color.r =  r;
  tc.color.g =  g;
  tc.color.b =  b;
  tc.color.a = 255;
  return tc;
}
 
void PVUpdate(){
  WORD *p = PVDevice.screen;
  WORD *q = PVScreen;
  DWORD a = ( PVDevice.deltay * PVDevice.height );

  while( a-- )
    *( p++ ) = *( q++ );
  PVIDirty = false;
}

void PVDontUpdate(){
  PVIDirty = false;
}

extern void PVSetErrorMessage( char *em ){
  PVErrorMessage = em;
}

/* BUGBUG fixme? unsafe, draws outside screen, sigsevs like a madman */
void PVAlphaLine( WORD x1, WORD y1, BYTE a1, WORD x2, WORD y2, BYTE a2, PVColor c, DWORD flags ){
  WORD *p;

  if( flags & PV_TOSCREEN ) 
    p = PVDevice.screen;
  else 
    p = PVScreen;

  PVIUABLine( x1, y1, (WORD)a1, x2, y2, (WORD)a2, c, p );
  if( !PVIDirty ) PVIDirty = !( flags & PV_DRAWTARGETFLAGS ); 
}


void PVLine( WORD x1, WORD y1, WORD x2, WORD y2, PVColor c, DWORD flags ){
  WORD *p;

  if( flags & PV_TOSCREEN ) 
    p = PVDevice.screen;
  else 
    p = PVScreen;

  PVIULine( x1, y1, x2, y2, c, p );
  if( !PVIDirty ) PVIDirty = !( flags & PV_DRAWTARGETFLAGS ); 
}


void PVSetGamma( double g ){
  PVIGamma = g;
  PVILoadAlphaPrime();
}


double PVGetGamma(){
  return PVIGamma;
}
