#include "td.h"

PVTPoint PVTxyz( float x, float y, float z ){
  PVTPoint r;
  r.p[ 0 ] = x;
  r.p[ 1 ] = y;
  r.p[ 2 ] = z;	
  r.p[ 3 ] = 1;
  return r;
}

PVTObj *PVTCreateObj( DWORD np, DWORD nl ){
  PVTObj *p;

  if( nl > PVT_MAXLINES ) return NULL;
  p = (PVTObj *)calloc( sizeof( PVTObj ) + np * sizeof( PVTPoint ) + nl * ( 2 * sizeof( DWORD ) + sizeof( PVColor ) ), 1 );

  if( p != NULL ){
    p->numpoints = np;
    p->numlines = nl;
    p->points = ( (PVTPoint *)( p + 1 ) );
    p->lines = ( (DWORD *)( p->points + np ) );
    p->colors = ( (PVColor *)( p->lines + nl * 2 ) );
  }

  return p;
}


void PVTDestroyObj( PVTObj *p ){
  if( p != NULL ) free( (void *)p );
}


void PVTDrawObj( PVTObj o, PVTMatrix m, DWORD flags ){
  DWORD c = o.numlines;
  WORD xb, xe, yb, ye, ab, ae, *scp;
  float *mp, *pp;
  float x1, y1, z1, w1;
  float x2, y2, z2, w2;

  if( flags & PV_TOSCREEN )
    scp = PVDevice.screen;
  else
    scp = PVScreen;

  while( c-- ){
    
     pp = o.points[ o.lines[ c << 1 ] ].p;
     mp = m.m;
     x1 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4;
     y1 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4;
     z1 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4;
     w1 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4; 

     pp = o.points[ o.lines[ ( c << 1 ) + 1 ] ].p;
     mp = m.m;
     x2 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4;
     y2 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4;
     z2 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4;
     w2 = ( mp[ 0 ] * pp[ 0 ] ) + ( mp[ 1 ] * pp[ 1 ] ) + ( mp[ 2 ] * pp[ 2 ] ) + ( mp[ 3 ] * pp[ 3 ] ); mp += 4; 

    xb = (WORD)( ( 1 + x1 / w1 ) * 119 );
    yb =  (WORD)( ( 1 + y1 / w1 ) * 159 );
    xe = (WORD)( ( 1 + x2 / w2 ) * 119 );
    ye =  (WORD)( ( 1 + y2 / w2 ) * 159 );

    if( flags & PVT_NOAA )
      PVIULine( xb, yb, xe, ye, o.colors[ c ], scp );
    else {
      ab = (WORD)( ( 1 - z1 / w1 ) * 127.5 );
      ae = (WORD)( ( 1 - z2 / w2 ) * 127.5 );
      PVIUABLine( xb, yb, ab, xe, ye, ae, o.colors[ c ], scp );
    }
  }
}

