#include "pvisxx.H"
#include <cstdlib>
#include <ctime>

// the fire colors, 256 all together.
word* fcolors;
// the fire screen
byte* fscreen;
// the height to jump pixels by;
static const jheight = 5;

void Program::init( void ){
  srand( time( NULL ) );

  fcolors = new word[ 256 ];
  fscreen = new byte[ theScreen.width() * theScreen.height() ];
  // populate colors;
  Color c( 255, 0, 0 );
  for( size_t o = 1; o < 4; o++ ){
    for( size_t i = 0; i < 32; i++ ){
      c.green = i << 3;
      fcolors[ o * 64 + i ] = c.toword();
      c.green = ( 31 - i ) << 3;
      fcolors[ o * 64 + i + 32 ] = c.toword();
    }
  }
  for( size_t i = 0; i < 32; i++ ){
    c.green = i << 3;
    c.red = i << 3;
    fcolors[ i ] = c.toword();
    c.red = 255;
    c.green = ( 31 - i ) << 3;
    fcolors[ 32 + i ] = c.toword();
  }
  // fill fscreen.
  dword zcount = theScreen.width() * ( theScreen.height() - jheight );
  byte* zp = fscreen;
  word* sp = theScreen.data();
  while( zcount-- ){
    *zp++ = 0;
    *sp++ = fcolors[ 0 ];
  }
  zcount = theScreen.width() * jheight;
  while( zcount-- ){
    *zp++ = 255;
    *sp++ = fcolors[ 255 ];
  }
}



bool Program::tick( fpnum ){
  for( size_t c = 0; c < 100; c++ ){
    dword y = ( ( rand() % ( theScreen.height() - jheight ) ) + jheight ) * theScreen.width();
    dword x = rand() % ( theScreen.width() - 2 ) + 1;
    dword ofs = y + x;
    if( fscreen[ ofs ] >= 3 ){
      int nofs = ofs - ( theScreen.width() + 2 );
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 1 ];
      nofs++;
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 2 ];
      nofs++;
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 3 ];
      nofs++;
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 2 ];
      nofs++;
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 1 ];
      nofs -= ( theScreen.width() + 3 );
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 1 ];
      nofs++;
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 2 ];
      nofs++;
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 1 ];
      nofs -= ( theScreen.width() + 1 );
      theScreen.data()[ nofs ] = fcolors[ fscreen[ nofs ] = fscreen[ ofs ] - 1 ];
    }
  }
  return theInput.buttons;
}



void Program::close( void ){
  delete[] fscreen;
  delete[] fcolors;
}
