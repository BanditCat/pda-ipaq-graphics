#include "td.h"

/* loads an identity matrix */
void PVTLoadIdentity( PVTMatrix *m ){
  BYTE i, j = 3;
  float *p = m->m;
  *( p++ ) = 1;
  while( j-- ){
    i = 4;
    while( i-- ) *( p++ ) = 0;
    *( p++ ) = 1;
  }
}

/* Multiplies m by the specified projection matrix */
void PVTProject( PVTMatrix *m, float yfov, float aspect, float znear, float zfar ){
  PVTMatrix t;
  float *p = t.m;
  float ang = cos( yfov / 2 ) / sin( yfov / 2 );
  float zco = ( zfar + znear ) / ( znear - zfar );
  float wco = ( 2 * znear ) * ( zfar / ( znear - zfar ) );

  *( p++ ) = ang / aspect; *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = ang; *( p++ ) = 0; *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = zco; *( p++ ) = wco;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = -1; *( p++ ) = 0;
  PVTMultMatrix( t, m );
}


/* Multiplies m by the specified translation matrix */
void PVTTranslate( PVTMatrix *m, float x, float y, float z ){
  PVTMatrix t;
  float *p = t.m;  

  *( p++ ) = 1; *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = x;
  *( p++ ) = 0; *( p++ ) = 1; *( p++ ) = 0; *( p++ ) = y;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 1; *( p++ ) = z;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 1;
  PVTMultMatrix( t, m );

}


/* Multiplies m by the specified rotation matrix */
void PVTRotate( PVTMatrix *m, float x, float y, float z ){
  PVTMatrix t;
  float *p = t.m;  

  *( p++ ) = cos( z ); *( p++ ) = sin( z ); *( p++ ) = 0; *( p++ ) = 0;
  *( p++ ) = -sin( z ); *( p++ ) = cos( z ); *( p++ ) = 0; *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 1; *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 1;
  PVTMultMatrix( t, m );

  p = t.m;
  *( p++ ) = cos( y ); *( p++ ) = 0; *( p++ ) = sin( y ); *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = 1; *( p++ ) = 0; *( p++ ) = 0;
  *( p++ ) = -sin( y ); *( p++ ) = 0; *( p++ ) = cos( y ); *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 1;
  PVTMultMatrix( t, m );

  p = t.m;
  *( p++ ) = 1; *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = cos( x ); *( p++ ) = -sin( x ); *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = sin( x ); *( p++ ) = cos( x ); *( p++ ) = 0;
  *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 0; *( p++ ) = 1;
  PVTMultMatrix( t, m );

}


/* Multiplies m1 by m2 in such a fashion that the 
resultant matrix, which is stored in m2, is equivalant 
to applying m2, then m1. */
void PVTMultMatrix( PVTMatrix m1, PVTMatrix *m2 ){
  BYTE w, h;
  PVTMatrix t;
  for( w = 0; w < 4; w++ ){
    for( h = 0; h < 16; h += 4 )
      t.m[ w + h ] = m1.m[ h ] * m2->m[ w ] + m1.m[ h + 1 ] * m2->m[ w + 4 ] + m1.m[ h + 2 ] * m2->m[ w + 8 ] + m1.m[ h + 3 ] * m2->m[ w + 12 ];
  }
  w = 16;
  while( w-- ) m2->m[w] = t.m[w];
}


void PVTMultPoint( PVTMatrix m, PVTPoint *p ){
  BYTE i = 4;
  PVTPoint t;
  while( i-- )
    t.p[ i ] = m.m[ i * 4 ] * p->p[ 0 ] + m.m[ i * 4 + 1] * p->p[ 1 ] + m.m[ i * 4 + 2 ] * p->p[ 2 ] + m.m[ i * 4 + 3 ] * p->p[ 3 ];
  i = 4;
  while( i-- ) p->p[ i ] = t.p[ i ];
}


