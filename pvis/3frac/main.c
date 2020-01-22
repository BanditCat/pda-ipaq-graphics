/* I'd call myself banditcat, but I've been anti-alliased */
#include "pv.h"
#include "td.h"

#define RECURSE 3

PVTMatrix a, b;
double gam = 2.8;
PVTObj *ob;
DWORD df = PVT_NOAA;

int PVTick( double delta ){
  static float px = 0, py = 0, pz = 0, dr = 0, fov = 45.0;
  BYTE i;

  if( PVInput.buttons & PV_BHB ){
    return PV_EXIT;
  }

  if( ( PVInput.buttons & PV_BCA ) && ( PVInput.buttons & PV_BHA ) ){
    if( df ) df = 0;
    else df = PVT_NOAA;
  }

  if( ( PVInput.buttons & PV_BCC ) && ( PVInput.buttons & PV_BHC ) ){
    dr = ( dr == 1 )?0:1;
  }

  if( PVInput.buttons & PV_BHUP )
    fov += 0.007;

  if( PVInput.buttons & PV_BHDOWN )
    fov -= 0.007;

  if( PVInput.buttons & PV_BHLEFT ){
    gam += 0.1;
    PVSetGamma( gam );
  }

  if( PVInput.buttons & PV_BHRIGHT ){
    gam -= 0.1;
    PVSetGamma( gam );
  }

  px += ( (float)( PVInput.pendx ) ) / 100.0 + 0.2 * delta * dr;
  py += ( (float)( PVInput.pendy ) ) / 100.0 + .05 * delta * dr;
  pz += 0.67 * delta * dr;

  PVTLoadIdentity( &b );
  PVTLoadIdentity( &a );
  PVTTranslate( &a, 0, 0, -104 );
  PVTProject( &a, fov, 0.75, 74, 125 );
  PVTRotate( &b, py, px, pz );
  PVTMultMatrix( a, &b );

  PVcls( PVrgb( 0, 0, 0 ), 0 );
  PVTDrawObj( *ob, b, df );

  return PV_OK;
}


int PVInit(){ 
  DWORD i, c, n, m, lp, pp, cp;
  static float os[ 18 ] = { 1, 0, 0,  -1, 0, 0,  0, 1, 0,  0, -1, 0,  0, 0, 1,  0, 0, -1 };
  float osm;
  PVTPoint tp;

  c = 3;
  i = RECURSE;
  while( i-- ) c = c * 7;

  if( ( ob = PVTCreateObj( c << 1, c ) ) == NULL ){
    PVSetErrorMessage( "Couldn't create object" );
    return PV_ERROR;
  }

  ob->points[ 0 ] = PVTxyz( -1, 0, 0 ); ob->points[ 1 ] = PVTxyz( 1, 0, 0 );
  ob->points[ 2 ] = PVTxyz( 0, -1, 0 ); ob->points[ 3 ] = PVTxyz( 0, 1, 0 );
  ob->points[ 4 ] = PVTxyz( 0, 0, -1 ); ob->points[ 5 ] = PVTxyz( 0, 0, 1 );

  for( i = 0; i < 6; i++ )
    ob->lines[ i ] = i;  

  ob->colors[ 0 ] = PVrgb( 255, 255, 255 );
  ob->colors[ 1 ] = PVrgb( 255, 255, 255 );
  ob->colors[ 2 ] = PVrgb( 255, 255, 255 );

  osm = 2;
  n = 3;
  lp = 6;
  pp = 6;
  cp = 3;
  for( i = 0; i < RECURSE; i++ ){
    for( c = 0; c < 6; c++ ){
      for( m = 0; m < n; m++ ){
        tp = ob->points[ m * 2 ];
        tp.p[ 0 ] += os[ 3 * c + 0 ] * osm;
        tp.p[ 1 ]+= os[ 3 * c + 1 ] * osm;
        tp.p[ 2 ] += os[ 3 * c + 2 ] * osm;
        ob->lines[ lp++ ] = pp;
        ob->points[ pp++ ] = tp;

        tp = ob->points[ m * 2 + 1 ];
        tp.p[ 0 ] += os[ 3 * c + 0 ] * osm;
        tp.p[ 1 ] += os[ 3 * c + 1 ] * osm;
        tp.p[ 2 ] += os[ 3 * c + 2 ] * osm;
        ob->lines[ lp++ ] = pp;
        ob->points[ pp++ ] = tp;

        ob->colors[ cp++ ] = ob->colors[ m ];
      }
    }
    osm *= 3;
    n *= 7;
  }
  return PV_OK;
}


void PVClose(){
  PVTDestroyObj( ob );
}

