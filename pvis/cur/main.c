#include "pv.h"
#include "pmp.h"

enum { drawing, selecting, zooming, idle } state;
PVPixmap buf;

class Bress{
public:
  Bress( int ddi, int ddp, int v = 0 ) : 
	sgn( ( ( ddi > 0 )  ^ ( ddp > 0 ) ) ? //10
		true : 
		false ), 
	vl( v ),
	di( ( ddi < 0 ) ? -ddi : ddi ), 
	dp( ( ddp < 0 ) ? -ddp : ddp ),
	dd( dp % di ),
	da( sgn ? -( dp / di ) : ( dp / di ) ),
	dau( sgn ? ( da - 1 ) : ( da + 1 ) ),
	dpr( dd * 2 ), 
	dpu( dpr - di * 2 ), //20
	p( dpr - di ){}
  ~Bress( void ){}

  operator int( void ) const{ return vl; }
  int operator++( void );
  int operator++( int );
  int operator--( void );
  int operator--( int );
private:
  void inc( void ); //30
  void dec( void );
  bool sgn;
  int vl, di, dp, dd, da, dau;
  int dpr, dpu, p; 
};
inline int Bress::operator++( void ){ 
  inc();
  return vl;
} 
inline int Bress::operator++( int ){ 
  int r = vl;
  inc();
  return r;
} inline int Bress::operator--( void ){ 
  dec();
  return vl;
} 
inline int Bress::operator--( int ){ 
  int r = vl;
  dec();
  return r;
} 
void Bress::inc( void ){
if( p > 0 ){
    p += dpu;
    vl += dau;
  } else {
    p += dpr;
    vl += da;
  }
}
void Bress::dec( void ){
 if( ( p - dpu - dpr ) <= 0 ){ 
    p -= dpu;
    vl -= dau;
  } else {
    p -= dpr;
    vl -= da;
  }
}
struct Point{
  Point( int nx, int ny ) : x( nx ), y( ny ){}
  int x, y;
};

void Triangle( Point p1, Point p2, Point p3 ){
  static PVColor rc( 255, 0, 0 );
  static PVColor gc( 0, 255, 0 );
  static PVColor bc( 0, 0, 255 );
  PVPutPixel( p1.x, p1.y, rc, PV_TOPIXMAP );
  PVPutPixel( p2.x, p2.y, gc, PV_TOPIXMAP );
  PVPutPixel( p3.x, p3.y, bc, PV_TOPIXMAP );
}

int PVTick( double d ){
  if( PVInput.buttons & PV_BHC )
    exit( 0 );
  Point p1( 0, 0 );
  Point p2( 0, 0 );
  Point p3( 0, 0 );
  PVColor c( 255, 255, 255 );
  PVColor b( 0, 0, 0 );
  c.color.r = 255;
  PVcls( b, PV_TOPIXMAP );
  static WORD x, y;
  if( PVInput.buttons & PV_BHA ){
    p1.x = PVInput.penx;
    p1.y = PVInput.peny; 
  } else if( PVInput.buttons & PV_BHB ){
    p2.x = PVInput.penx;
    p2.y = PVInput.peny; 
  } else {
    p3.x = PVInput.penx;
    p3.y = PVInput.peny; 
  }
  Triangle( p1, p2, p3 );
  PVPutRect( 0, 0, 239, 319, 
	   0, 0, 239, 319, buf, PV_TOSCREEN );
}
  

int PVInit(){
  buf.width =  240;
  buf.height = 320;
  buf.data = new WORD[ 320 * 240 ];
  PVSelectPixmap( &buf );
  return PV_OK;
}


void PVClose(){
  delete buf.data;
}
