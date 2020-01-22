// Pbdl instruction src.
#include <stream>

#define dword unsigned int

class Instruction{
public:
  Instruction( void ){}
  Instruction( const Instruction& c ) : index( c.index ){}
  virtual void print( ostream& ) const = 0;
  friend ostream& operator<<( ostream&, 		           const Instruction& );
  size_t index;
};
ostream& operator<<( ostream& o,
	                const Instruction& i ){
  o << i;
  return o;
}  


class Branch : public Instruction{
public:
  virtual bool test( dword arg ) = 0;
};
class Greater : public Branch{
public:
  Greater( dword t ) : value( t ){}
  bool test( dword arg ){ return arg > value; }
  void print( ostream& o ){ 
    o << "Branch if greater than " << value;
  }
  dword value;
};
class Less : public Branch{
public:
  Less( dword t ) : value( t ){}
  bool test( dword arg ){ return arg < value; }
  void print( void ){ 
    printf( "Branch if less than %d",  value );
  }
  dword value;
};


class Manipulate : public Instruction{
public:
  virtual dword map( dword arg ) = 0;
};
