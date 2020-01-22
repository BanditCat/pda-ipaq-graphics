/* Internal PVis functions */
#include "pvi.h"
#include "td.h"

void PVILoadAlphaTable();

WORD *PVScreen;

WORD *PVIAlphaLookup = NULL;
DWORD *PVIAlphaPrime = NULL;
signed int PVIGraphLookup[ 1120 ];
double PVIGamma = 2.5;

void PVIFlush(){
  WORD *p = PVDevice.screen;
  WORD *q = PVScreen;
  DWORD a = ( PVDevice.deltay * PVDevice.height );

  if( PVIDirty ){
    while( a-- )
      *( p++ ) = *( q++ );
    PVIDirty = false;
  }
}

void PVIRemoveBuffer(){
  free( PVScreen );
}

BOOL PVIGetBuffer(){
  PVScreen = ( (WORD *) calloc( PVDevice.deltay * PVDevice.height, sizeof( WORD ) ) );
  return ( PVScreen == NULL )?TRUE:FALSE;
}


void PVILoadAlphaPrime(){
  DWORD a, b, c, d, g[ 1024 ];

  for( a = 0; a < 1024; a++ )
    g[ a ] = ( ( (DWORD)( ( pow( ( (double)a ) / 1023.0, 1.0 / PVIGamma ) ) * 31 ) ) << 16 );

  for( a = 0; a < 256; a++ ){
    for( b = 0; b < 32; b++ ){
      c = ( a * b * 1023 + 3952 ) / 7905;
      d = ( a * ( 31 - b ) * 1023 + 3952 ) / 7905;
      PVIAlphaPrime[ b + a * 64 + 32 ] = g[ c ];
      PVIAlphaPrime[ b + a * 64 ] = g[ d ];
      PVIAlphaPrime[ 32767 - ( b + a * 64 ) ] = g[ 1023 - c ];
      PVIAlphaPrime[ 32735 - ( b + a * 64 ) ] = g[ 1023 - d ];
    }
  }
    
}


void PVILoadAlphaTable(){
  signed int r, g, b, a;
  signed int rv, gv, bv;
  WORD *bp, rc, gc, bc;  
  
  bp = PVIAlphaLookup;

  for( a = 0; a < 32; a++ ){

    rv = ( a << 1 ) - 31;
    r = 32;
    rc = 0;
    while( r-- ){
  
      gv = ( a << 2 ) - 63;
      g = 64;
      gc = 0;
      while( g-- ){

        bv = ( a << 1 ) - 31;
        b = 32;
        bc = 0;
        while( b-- ){

         *( bp++ ) = rc | bc | gc;

         if( bv > 0 ){
           bc++;
           bv += ( a << 1 ) - 62;
         } else 
           bv += ( a << 1 );
       }

       if( gv > 0 ){
         gc += 32;
         gv += ( a << 2 ) - 126;
       } else
         gv += ( a << 2 );
      }

      if( rv > 0 ){
        rc += 2048;
        rv += ( a << 1 ) - 62;
      } else 
        rv += ( a << 1 );
    }
  }

}


BOOL PVIInit(){ 
  WORD i;

  if( ( PVIAlphaLookup = (WORD *)malloc( 0x00400000 ) ) == NULL ) return FALSE;
  if( ( PVIAlphaPrime = (DWORD *)malloc( 32768 * sizeof( DWORD ) ) ) == NULL ) return FALSE;
  if( ( PVTSortSpace = (DWORD *)malloc( PVT_MAXLINES ) ) == NULL ) return FALSE;

  PVILoadAlphaTable();
  PVILoadAlphaPrime();
  for( i = 0; i < 320; i++ ) PVIGraphLookup[ 320 + i ] = - ( PVIGraphLookup[ i ] = i * 240 ); 
  for( i = 0; i < 240; i++ ) PVIGraphLookup[ 880 + i ] = - ( PVIGraphLookup[ i + 640 ] = i );

  return TRUE;
}


void PVIClose(){
  if( PVIAlphaLookup != NULL ) free( (void *)PVIAlphaLookup );
  if( PVIAlphaPrime != NULL ) free( (void *)PVIAlphaPrime );
}

inline void PVIUABLine( WORD x1, WORD y1, WORD a1, WORD x2, WORD y2, WORD a2, PVColor pvc, WORD *scp ){
  WORD i, *p, *ip, *bp, *bip, co;
  signed int dx, dy, dv, du, dr, ir, iu, di;
  signed int da, av, au, ar, air, aiu, *ylp;
  DWORD *bapp, *eapp, *bdwp, *edwp;
  BOOL m;
  if( x2 > x1 )
    dx = x2 - x1;
  else
    dx = x1 - x2;
  if( y2 > y1 )
    dy = y2 - y1;
  else
    dy = y1 - y2;
  co = ( pvc.color.b >> 3 ) | ( ( pvc.color.g >> 2 ) << 5 ) |  ( ( pvc.color.r >> 3 ) << 11 );

  if( ( dx == 0 ) && ( dy == 0 ) ){
   i = ( ( a1 + a2 ) >> 4 );
   p = scp + x1 + PVIGraphLookup[ y1 ]; 
   *p = PVIAlphaLookup[ co + ( ( (DWORD)i ) << 16 ) ] + PVIAlphaLookup[ *p + ( ( (DWORD)( 31 ^ i ) ) << 16 ) ];
  } else if( dx > dy ){
    if( x1 > x2 ){
      i = x1; x1 = x2; x2 = i;
      i = y1; y1 = y2; y2 = i;
      i = a1; a1 = a2; a2 = i;
    }

    if( y2 > y1 ){
      di = 240;
      ylp = PVIGraphLookup;
    } else {
      di = -240;
      ylp = PVIGraphLookup + 320;
    }
    dy <<= 5;
    ir = dy / dx;
    iu = ir + 1;
    dy %= dx;
    dr = dy << 1;
    du = dr - ( dx << 1 );
    dv = dr - dx;

    if( a2 > a1 ){
      da = a2 - a1;
      air = ( ( da / dx ) << 6 );
      aiu = air + 64;
    } else {
      da = a1 - a2;
      air = - ( ( da / dx ) << 6 );
      aiu = air - 64;
    }
    da %= dx;
    ar = da << 1;
    au = ar - ( dx << 1 );
    av = ar - dx;

    i = 0;
    m = dx & 1;
    dx = ( dx - 1 ) >> 1;

    bp = scp + x1 + PVIGraphLookup[ y1 ]; 
    bip = scp + x2 + PVIGraphLookup[ y2 ]; 
    bapp = PVIAlphaPrime + ( a1 << 6 );
    eapp = PVIAlphaPrime + ( a2 << 6 );

    do{
      p = bp++ + ylp[ i >> 5 ];
      ip = bip-- - ylp[ i >> 5 ];
      bdwp = bapp + ( i & 31 );
      edwp = eapp + ( i & 31 );
      *p =  PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
      *ip =  PVIAlphaLookup[ co + *edwp ] + PVIAlphaLookup[ *ip + ( 0x001f0000 ^ *edwp ) ];
      p += di;
      ip -= di;
      bdwp += 32;
      edwp += 32;
      *p = PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
      *ip = PVIAlphaLookup[ co + *edwp ] + PVIAlphaLookup[ *ip + ( 0x001f0000 ^ *edwp ) ];
      if( dv > 0 ){
        i += iu;
        dv += du;
      } else {
        i += ir;
        dv += dr;
      } 
      if( av > 0 ){
        bapp += aiu;
        eapp -= aiu;
        av += au;
      } else {
        bapp += air;
        eapp -= air;
        av += ar;
      }
    } while( dx-- );
    if( !m ){
      p = bp + ylp[ i >> 5 ];
      bdwp = bapp + ( i & 31 );
      *p =  PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
      p += di;
      bdwp += 32;
      *p = PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
    } 
  } else {
    if( y1 > y2 ){
      i = x1; x1 = x2; x2 = i;
      i = y1; y1 = y2; y2 = i;
      i = a1; a1 = a2; a2 = i;
    }

    if( x2 > x1 ){
      di = 1;
      ylp = PVIGraphLookup + 640;
    } else {
      di = -1;
      ylp = PVIGraphLookup + 880;
    }
    dx <<= 5;
    ir = dx / dy;
    iu = ir + 1;
    dx %= dy;
    dr = dx << 1;
    du = dr - ( dy << 1 );
    dv = dr - dy;

    if( a2 > a1 ){
      da = a2 - a1;
      air = ( ( da / dy ) << 6 );
      aiu = air + 64;
    } else {
      da = a1 - a2;
      air = - ( ( da / dy ) << 6 );
      aiu = air - 64;
    }
    da %= dy;
    ar = da << 1;
    au = ar - ( dy << 1 );
    av = ar - dy;

    i = 0;
    m = dy & 1;
    dy = ( dy - 1 ) >> 1;

    bp = scp + x1 + PVIGraphLookup[ y1 ]; 
    bip = scp + x2 + PVIGraphLookup[ y2 ]; 
    bapp = PVIAlphaPrime + ( a1 << 6 );
    eapp = PVIAlphaPrime + ( a2 << 6 );

    do{
      p = bp + ylp[ i >> 5 ];
      ip = bip - ylp[ i >> 5 ];
      bp += 240;
      bip -= 240;
      bdwp = bapp + ( i & 31 );
      edwp = eapp + ( i & 31 );
      *p =  PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
      *ip =  PVIAlphaLookup[ co + *edwp ] + PVIAlphaLookup[ *ip + ( 0x001f0000 ^ *edwp ) ];
      p += di;
      ip -= di;
      bdwp += 32;
      edwp += 32;
      *p = PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
      *ip = PVIAlphaLookup[ co + *edwp ] + PVIAlphaLookup[ *ip + ( 0x001f0000 ^ *edwp ) ];
      if( dv > 0 ){
        i += iu;
        dv += du;
      } else {
        i += ir;
        dv += dr;
      } 
      if( av > 0 ){
        bapp += aiu;
        eapp -= aiu;
        av += au;
      } else {
        bapp += air;
        eapp -= air;
        av += ar;
      }
    } while( dy-- );
    if( !m ){
      p = bp + ylp[ i >> 5 ];
      bdwp = bapp + ( i & 31 );
      *p =  PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
      p += di;
      bdwp += 32;
      *p = PVIAlphaLookup[ co + *bdwp ] + PVIAlphaLookup[ *p + ( 0x001f0000 ^ *bdwp ) ];
    } 
  }
}


inline void PVIULine( WORD x1, WORD y1, WORD x2, WORD y2, PVColor pvc, WORD *scp ){
  signed int dv, di, iu, ir;
  DWORD dy, dx;
  WORD *bp, *ep, v, i;
  BOOL m;

  v = ( pvc.color.b >> 3 ) | ( ( pvc.color.g >> 2 ) << 5 ) |  ( ( pvc.color.r >> 3 ) << 11 );

  if( x1 > x2 )
    dx = x1 - x2;
  else
    dx = x2 - x1;

  if( y1 > y2 )
    dy = y1 - y2;
  else
    dy = y2 - y1;

  if( ( dx == 0 ) && ( dy == 0 ) ){
    *( scp + x1 + PVIGraphLookup[ y1 ] ) = v;
  } else if( dx > dy ){

    if( x1 > x2 ){
      i = x1;
      x1 = x2;
      x2 = i;
      i = y1;
      y1 = y2;
      y2 = i;
    } 

    if( y2 > y1 ) di = 240;
    else di = -240;
    ir = ( dy << 1 );
    dv = ir - dx;
    iu = dv - dx;   

    bp = scp + x1 + PVIGraphLookup[ y1 ];
    ep = scp + x2 + PVIGraphLookup[ y2 ];
    
    i = ( dx - 1 ) >> 1;
    m = ( dx & 1 );
    do{
      *( bp++ ) = ( *( ep-- ) = v );
      if( dv > 0 ){
        bp += di;
        ep -= di;
        dv += iu;
      } else
        dv += ir;
    } while( i-- );
    if( !m ){
      *bp = v;
    }

  } else {

    if( y1 > y2 ){
      i = x1;
      x1 = x2;
      x2 = i;
      i = y1;
      y1 = y2;
      y2 = i;
    } 

    if( x2 > x1 ) di = 1;
    else di = -1;
    ir = ( dx << 1 );
    dv = ir - dy;
    iu = dv - dy;   

    bp = scp + x1 + PVIGraphLookup[ y1 ] - 240;
    ep = scp + x2 + PVIGraphLookup[ y2 ] + 240;
    
    i = ( dy - 1 ) >> 1;
    m = ( dy & 1 );
    do{
      *( bp += 240 ) = ( *( ep -= 240 ) = v );
      if( dv > 0 ){
        bp += di;
        ep -= di;
        dv += iu;
      } else
        dv += ir;
    } while( i-- );
    if( !m ){
      *( bp + 240 ) = v;
    }

  }
}

inline WORD PVIGetColor( PVColor c ){
     return ( c.color.b >> 3 ) | ( ( c.color.g >> 2 ) << 5 ) |  ( ( c.color.r >> 3 ) << 11 );
}


