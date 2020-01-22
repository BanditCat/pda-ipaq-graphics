/* PVis pixmap functions */
#include "pv.h"
#include "pmp.h"

/* Globals */

/* Functions */
PVPixmap *PVCreatePixmap( WORD w, WORD h ){
  PVPixmap *p = (PVPixmap *)malloc( ( (DWORD)sizeof( PVPixmap ) ) + ( (DWORD)sizeof( WORD ) ) * ( (DWORD)h ) * ( (DWORD)w ) );
  if( p == NULL )
    return p;
  p->data = (WORD *)( p + 1 );
  p->width = w;
  p->height = h;
  return p;
}

void PVDestroyPixmap( PVPixmap *p ){
  if( p != NULL )
    free( (void *)p );
}

void PVSelectPixmap( PVPixmap *p ){
  if( p != NULL )
    PVCurrentPixmap = p;
}

void PVPut( WORD x, WORD y, PVPixmap pm, DWORD flags ){
  WORD *p, *s, dx, dy, h, w;
  WORD *pp = pm.data, pdx = 1, pdy = pm.width, ph = pm.height, pw = pm.width;
  DWORD i, xn, yn, yo, pyo;

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

  if( ( x < w ) && ( y < h ) ){
    if( ( x + pw ) > w )
      xn = w - x;
    else
      xn = pw;
    if( ( y + ph ) > h )
      yn = h - y;
    else
      yn = ph;
    pyo = pw - xn;   
    yo = w - xn;
    p = s + ( x + dy * y);

    switch( flags & PV_DRAWBLITFLAGS ){

      case PV_XOR:
        while( yn-- ){
          i = xn;
          while( i-- ) *( p++ ) ^= *( pp++ );
          p += yo;
          pp += pyo;
        }
      break;

      default:
        while( yn-- ){
         i = xn;
         while( i-- ) *( p++ ) = *( pp++ );
         p += yo;
         pp += pyo;
        }
      break;
    }

    if( !PVIDirty ) PVIDirty = !( flags & PV_DRAWTARGETFLAGS ); 
  }
}

void PVPutRect( WORD sx1, WORD sy1, WORD sx2, WORD sy2, WORD dx1, WORD dy1, WORD dx2, WORD dy2, PVPixmap pm, DWORD flags ){
  WORD *d, dw, dh, ddy;
  WORD *s, sw, sh, sdy;
  WORD i;
  DWORD x, y, xp, yp, mx, my, xnum, xden, ynum, yden;

  if( flags & PV_TOPIXMAP ){
    d = PVCurrentPixmap->data;
    ddy = ( dw = PVCurrentPixmap->width );
    dh = PVCurrentPixmap->height;
  } else {
    if( flags & PV_TOSCREEN )
      d = PVDevice.screen;
    else
      d = PVScreen;
    dw = PVDevice.width;
    dh = PVDevice.height;
    ddy = PVDevice.deltay;
  }
  s = pm.data;
  sh = pm.height;
  sdy = ( sw = pm.width );

  if( dx1 > dx2 ){ 
    i = dx1;
    dx1 = dx2;
    dx2 = i;
  }
  if( dy1 > dy2 ){ 
    i = dy1;
    dy1 = dy2;
    dy2 = i;
  }
  if( sx1 > sx2 ){ 
    i = sx1;
    sx1 = sx2;
    sx2 = i;
  }
  if( sy1 > sy2 ){ 
    i = sy1;
    sy1 = sy2;
    sy2 = i;
  }

  if( ( dx1 < dw ) && ( dy1 < dh ) && ( sx2 < sw ) && ( sy2 < sh ) ){
    if( dx2 > dw )
      mx = dw - dx1;
    else
      mx = 1 + dx2 - dx1;
    if( dy2 > dh )
      my = dh - dy1;
    else
      my = 1 + dy2 - dy1;
    xnum = sx2 - sx1;
    xden = 1 + dx2 - dx1;
    ynum = sy2 - sy1;
    yden = 1 + dy2 - dy1;
    d += ( dx1 + dy1 * ddy );
    s += ( sx1 + sy1 * sdy );

    for( y = 0; y < my; y++ ){
      yp = ( y * ynum ) / yden;
      for( x = 0; x < mx; x++ ){
        xp = ( x * xnum ) / xden;
        *( d + x + y * ddy ) = *( s + xp + yp * sdy );
      }
    }
  }
}




