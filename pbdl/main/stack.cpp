template< class T > class Cowa{
public:
  Cowa( size_t s ) : sz( s ), rfs( 1 ), dt( new T[ s ] ),
	            cp( this ){}
  Cowa( const Cowa& c ) : sz( 0 ), rfs( 0 ),
	                      dt( NULL ), cp( &c )
		     { cp->rfs++; } //10
  ~Cowa( void ){ if( !--cp->rfs ) delete cp->dt; }
  Cowa& operator=( const Cowa& eq );
  const T& operator[]( size_t i ) const;

  void set( size_t i, const T& d );
  size_t size( void ) const{ return cp->sz; }

private:
  size_t sz, rfs;
  T* dt; //20
  Cowa< T >* cp;
};
template< class T >
Cowa< T >& Cowa< T >::operator=( const Cowa& eq ){ 
  if( !--cp->rfs ) delete cp->dt;
  ( cp = &eq ).rfs++;
  return *this;
}
template< class T >
void Cowa< T >::set( size_t i, const T& d ){
  if( cp->dt[ i ] == d )
    return;
  if( cp->rfs != 1 ){
    cp->rfs--;
    sz = cp->sz;
    dt = new T[ sz ];
    for( size_t j = 0; j < sz; j++ )
      dt[ j ] = cp->dt[ j ];
    cp = this;
  }
  cp->dt[ i ] = d;
}


template< class T > class Stack {
public:
  Stack( void ) : dt( new Cowa< T >( 1 ) ), sz( 0 ){}
  Stack( const Stack< T >& cp ) : 
     dt( new Cowa< T >( *cp.dt ) ), sz( cp.sz ){}
  ~Stack( void ){ delete dt; }

  size_t size( void ){ return dt->size(); }
  void push( const T& );
  T pop( void );
  T peek( void ) const;

  Stack& operator=( const Stack& );  
private:
  Cowa< T >* dt;
  size_t sz;
};
template< class T > 
void Stack< T >::push( const T& t ){
  if( sz == dt.size() ){
    Cowa< T >* a = new Cowa< T >( sz * 2 );
     for( size_t i = 0; i < sz; i++ )
       a->set( i, dt[ i ] );
     delete dt;
     dt = a;
    }
 dt->set( sz++, t );
}
template< class T > 
T Stack< T >::pop( void ){
  if( !sz )
    throw runtime_error( "Stack underflow" );
  return dt[ --sz ];
}
template< class T > 
T Stack< T >::peek( void ) const{
  return dt[ sz - 1 ];
}
template< class T > 
Stack< T >& Stack< T >::operator=( const Stack< T >& cp ){
  delete dt;
  dt = new Cowa< T >( cp.dt );
  sz = cp.sz;
}

