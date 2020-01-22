#include "pv.h"

double gam = 2.5;

void gambars();

int PVTick(){
  char em[ 256 ];
  if( PVInput.buttons & PV_BHB ){
    sprintf( em, "Gamma was %f", gam );
    PVSetErrorMessage( em );
    return PV_ERROR;
  }
 
  if( PVInput.buttons & PV_BHUP )
    printf( "Gamma: %f\n", gam += 0.1 );

  if( PVInput.buttons & PV_BHDOWN )
    printf( "Gamma: %f\n", gam -= 0.1 );


  PVcls( PVrgb( 0, 0, 0 ), 0 );
  gambars();
  
  return PV_OK;
}


int PVInit(){ 

  return PV_OK;
}


void PVClose(){;}

void gambars(){
  int x, y;
  BYTE c1, c2;
  for( y = 0; y < 256; y++ ){
    c1 = (BYTE)( 255 * pow( (double)y / 255, 1 / gam ) );
    c2 = (BYTE)( 255 * pow( (double)( 255 - y ) / 255, 1 / gam ) );
    for( x = 0; x < 120; x +=2 ){
      PVPutPixel( x + ( y & 1 ), y, PVrgb( c1, c1, c1 ), 0 );
      PVPutPixel( x + 1 - ( y & 1 ), y, PVrgb( c2, c2, c2 ), 0 );
    }
  }
}