// Source for pdraw

#include <iostream>
#include <ctime>

#include "../bcjlib/bcj/list.H"

using namespace std;

template< class T > 
void Sort( T b, T e ){
  
  if( b == e )
    return;
  T pb( b++ );
  T pe = e;
  do{
    while( ( *e >= *pb ) && ( b != e ) )
      e--;
    while( ( *b < *pb ) && ( b != e ) )
      b++;
    if( b != e )
      b.swap( e );
  } while( b != e );
  if( *pb > *b ){
    pb.swap( b );
    Sort( pb, --b );
    if( e != pe )
      Sort( ++e, pe );
  } else
    Sort( ++pb, pe );
}

int main( int argc, char** argv ){
  
  static const int size = 10; 

  List< int > l;  

  srand( time( NULL ) );
  
  for( size_t j = 0; j < 300; j++ ){ 

    for( size_t i = 0; i < size; i++ )
     l.push( rand() % 100 );

    Sort( l.start(), l.end() );
 
    bool su = true;
    {
      List< int >::Iterator ib( l.start() );
      List< int >::Iterator ie( l.end() );
      do{ 
        List< int >::Iterator t( ib++ );
        if( *t > *ib )
          su = false; 
      }while( ib != ie );
    }
    cout << su;
    if( ( j % 10 ) == 9 )
      cout << endl; 
    l.empty();
  }
}
