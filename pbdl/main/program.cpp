// Pbdl program src.

class IBody{
public:
  IBody( Instruction& c ) : body( &c ){}
  Instruction* body;
  size_t next;
  size_t branch;
  Stack< size_t > refs;
};

class Program{
public:
  Stack< IBody > body;
  size_t size( void ){ return body.size(); }
};
