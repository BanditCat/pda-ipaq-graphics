/* Converts linefeeds to cr-lf pairrs */
#include <stdio.h>
#include <stdlib.h>

#define BUFSIZE 100

struct Node{ 
  Node* next;
  unsigned char data[ BUFSIZE ];
  size_t pos;
};

Node* begining = NULL;

void addchar( unsigned char );
void freenodes( void );
void writenodes( FILE* );

int main( int argc, char** argv ){
  if( argc != 2 ){
    printf( "Usage: %s [filename]\n", argv[ 0 ] );
    exit( 0 );
  }

  FILE* readp = fopen( argv[ 1 ], "rb" );
  if( readp == NULL ){
    printf( "Failed to open file for input.\n" );
    exit( 0 );
  }

  int c, cp = 0;
  while( ( c = fgetc( readp ) ) != EOF ){
    if( ( c == 10 ) && ( cp != 13 ) ){
      addchar( 13 );
      addchar( 10 );
    } else{
      addchar( c );
    }
    cp = c;
  }
  fclose( readp );

  FILE* writep = fopen( argv[ 1 ], "wb" );
  if( writep == NULL ){
    printf( "Failed to open file for output.\n" );
    exit( 0 );
  }

  writenodes( writep );
  freenodes();
}

void addchar( unsigned char c ){
  static Node* current = NULL;
  if( begining == NULL ){
    begining = (Node*)malloc( sizeof( Node ) );
    if( begining == NULL ){
      printf( "Failed to allocate memory.\n" );
      freenodes();
      exit( 0 );
    }
    current = begining;
    begining->next = NULL;
    begining->pos = 0;
  }
  if( current->pos == BUFSIZE ){
    Node* p = (Node*)malloc( sizeof( Node ) );
    if( p == NULL ){
      printf( "Failed to allocate memory.\n" );
      freenodes();
      exit( 0 );
    }
    current->next = p;
    current = p;
    p->next == NULL;
    p->pos = 0;
  }
  current->data[ current->pos++ ] = c;
}

void freenodes( void ){
  Node* p = begining;
  while( p != NULL ){
    Node* tp = p->next;
    free( p );
    p = tp;
  }
}

void writenodes( FILE* ptr ){
  Node* p = begining;
  while( p != NULL ){
    size_t c = fwrite( p->data, sizeof( unsigned char ), p->pos, ptr );
    if( c != p->pos ){
      printf( "Failed to write to file.\n" );
      freenodes();
      exit( 0 );
    }
    p = p->next;
  }
}

