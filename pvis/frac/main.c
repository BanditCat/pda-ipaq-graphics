#include "pv.h"
#include "pmp.h"


#define BAILOUT 128
#define MAXPICS 10


struct pic {
  WORD x, y;
  PVPixmap pm;
  WORD data[ 307200 ];
};


pic *pics = NULL;
DWORD bail = BAILOUT;
enum { drawing, selecting, zooming, idle } state;

WORD cpic = 0, mpic = 0;


PVColor frac( double x, double y );


int PVTick( double d ){
  WORD i;
  static WORD xb = 59, yb = 79;
  static WORD row = 479;  
  static double xc = -1.5, yc = -3, xs = 3, ys = 4, zl;

  if( PVInput.buttons ){ 
    if( ( PVInput.buttons & PV_BHB ) && ( PVInput.buttons & PV_BHDOWN ) )
      return PV_EXIT;
  }

  switch( state ){

    case drawing:
      for( i = 0; i < 639; i++ )
       PVPutPixel( row, i, 
                   frac( (double)row * xs / (double)( 479 ) + xc,
                         (double)i * ys / (double)( 639 ) + yc ),
                         PV_TOPIXMAP );
      PVRect( 239 - ( row >> 1 ), 149, 239 - ( row >> 1 ), 169, PVrgb( 255, 255, 255 ), 0 );
      if( !( row-- ) ){
        row = 479;
        PVPutRect( 0, 0, 479, 639, 0, 0, 239, 319, pics[ mpic ].pm, 0 );
        state = idle;
      }
    break;

    case selecting:
      PVRect( xb - 59, yb - 79, xb + 60, yb + 80, PVrgb( 255, 255, 255 ), PV_XOR );
      xb = PVInput.penx;
      yb = PVInput.peny;
      if( xb > 179 ) xb = 179;
      if( xb < 59 ) xb = 59;
      if( yb > 239 ) yb = 239;
      if( yb < 79 ) yb = 79;
      PVRect( xb - 59, yb - 79, xb + 60, yb + 80, PVrgb( 255, 255, 255 ), PV_XOR );
      if( PVInput.buttons ){ 
        if( ( PVInput.buttons & PV_BCUP ) && ( PVInput.buttons & PV_BHUP ) && ( mpic < MAXPICS ) ){
          xc += xs * (double)( xb - 59 ) / (double)240;
          yc += ys * (double)( yb - 79 ) / (double)320;
          xs /= 2;
          ys /= 2;
          pics[ mpic ].x = ( xb - 59 ) << 1;
          pics[ mpic ].y = ( yb - 79 ) << 1;
          mpic++;
          PVSelectPixmap( &( pics[ mpic ].pm ) );
          state = drawing;
          return PV_OK;
        } else if( ( PVInput.buttons & PV_BCA ) && ( PVInput.buttons & PV_BHA ) ){
          cpic = 0;
          zl = 0;
          state = zooming;
          return PV_OK;
        }
      } 
    break;

    case idle:
      if( PVInput.penstatus & PV_PHELD ){
        PVRect( xb - 59, yb - 79, xb + 60, yb + 80, PVrgb( 255, 255, 255 ), PV_XOR );
	PVDontUpdate();
        state = selecting;
        return PV_OK;
      } 
      if( ( PVInput.buttons & PV_BCA ) && ( PVInput.buttons & PV_BHA ) ){
        cpic = 0;
        zl = 0;
        state = zooming;
        return PV_OK;
      }
    break;

    case zooming:
      if( cpic >= mpic ){
  	PVPutRect( 0, 0, 479, 639, 0, 0, 239, 319, pics[ mpic ].pm, 0 );
        state = idle;
        return PV_OK;
      }
      if( zl >= 100 ){
        zl = 0;
        cpic++;
      }

      PVPutRect( 
	 (WORD)( ( pics[ cpic ].x * zl ) / 100 ), 
                 (WORD)( ( pics[ cpic ].y * zl ) / 100 ),
                 (WORD)( 479 - ( ( 240 - pics[ cpic ].x ) * zl ) / 100 ),
                 (WORD)( 639 - ( ( 320 - pics[ cpic ].y ) * zl ) / 100 ),
		 0, 0, 239, 319, pics[ cpic ].pm, PV_TOSCREEN );
    //double zlt = sqrt( zl ) + 1;
    zl += 1;
    break;

  }
     
  return PV_OK;
}
  

int PVInit(){
  int i;

  pics = (pic *)malloc( MAXPICS * sizeof( pic ) );
  if( pics == NULL ){
    PVSetErrorMessage( "Unable to allocate memory" );
    return PV_ERROR;
  }

  for( i = 0; i < MAXPICS; i++ ){
    pics[i].x = ( pics[i].y = 0 );
    pics[i].pm.height = 640;
    pics[i].pm.width = 480;
    pics[i].pm.data = pics[i].data;
 }

  PVSelectPixmap( &( pics[0].pm ) );

  state = drawing;
  return PV_OK; 
}


void PVClose(){
  if( pics != NULL )
    free( (void *)pics );
}


PVColor frac( double x, double y ){
  WORD c = 0;
  double r = y, i = x, t;
 
  while( ( fabs( r ) < 4 ) && ( fabs( i ) < 4 )  && ( c < bail ) ){
    t = y + r * r - i * i;
    i = 2 * r * i + x;
    r = t;
    c++;
  }
  if( c == bail )
    return PVrgb( 0, 0, 0 );
  else {
    c %= 96;
    if( c > 63 )
      return PVrgb( ( c - 64 ) << 3, 0, ( 31 - ( c - 64 ) ) << 3 );
    else if( c > 31 )
      return PVrgb( 0, ( 31 - ( c - 32 ) ) << 3, ( c - 32 ) << 3 );
    else
     return PVrgb( ( 31 - c ) << 3, c << 3, 0 );
  }
}
