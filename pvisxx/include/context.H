#ifndef CONTEXT_H
#define CONTEXT_H



struct Point{
  Point( void ){}
  Point( word ax, word ay ) : x( ax ), y( ay ){}
  word x, y;
};



struct Color{
  Color( void ){}
  Color( byte r, byte g, byte b ) : red( r ), green( g ),
			blue( b ){}
  word toword( void ) const;
  
  byte red, green, blue;
};



class Context{
public:
  virtual word* data( void ) = 0;
  virtual size_t width( void ) = 0;
  virtual size_t height( void ) = 0;

  void putpixel( const Point&, const Color& );
  void clear( const Color& );
};

#endif

