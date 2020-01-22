#ifndef TD_H_INCLUDED
#define TD_H_INCLUDED

#define PVT_MAXLINES 10000

struct PVTMatrix{
  float m[ 16 ];
};

struct PVTPoint{
  float p[ 4 ];
};

struct PVTObj{
  DWORD numpoints;
  DWORD numlines;
  PVTPoint *points;
  DWORD *lines;
  PVColor *colors;
};

PVTPoint PVTxyz( float x, float y, float z );

void PVTLoadIdentity( PVTMatrix *m );
void PVTProject( PVTMatrix *m, float yfov, float aspect, float znear, float zfar );
void PVTTranslate( PVTMatrix *m, float x, float y, float z );
void PVTRotate( PVTMatrix *m, float x, float y, float z );
void PVTMultMatrix( PVTMatrix m1, PVTMatrix *m2 );
void PVTMultPoint( PVTMatrix m, PVTPoint *p );

PVTObj *PVTCreateObj( DWORD np, DWORD nl );
void PVTDestroyObj( PVTObj *p );
void PVTDrawObj( PVTObj o, PVTMatrix m, DWORD flags );

#endif

