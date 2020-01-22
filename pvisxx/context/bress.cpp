#include "pvisxx.H"



word Color::toword( void ) const{
  return ( ( red >> theFormat.redloss )
            << theFormat.redshift ) +
           ( ( green >> theFormat.greenloss )
            << theFormat.greenshift ) +
           ( ( blue >> theFormat.blueloss )
            << theFormat.blueshift );
}



void Context::putpixel( const Point& p, const Color& c ){
  if( ( p.x > width() ) || ( p.y > height() ) )
    return;
  *( data() + p.y * width() + p.x ) = c.toword();
}
void Context::clear( const Color& c ){
  word d = c.toword();
  dword w = width() * height();
  word* p = data();
  while( w-- )
    *p++ = d;
}

