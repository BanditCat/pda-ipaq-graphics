#ifndef PMP_H_INCLUDED
#define PMP_H_INCLUDED

/* Types */
struct PVPixmap {
  WORD height;
  WORD width;
  WORD *data;  
};

/* Globals */

/* Functions */
extern PVPixmap *PVCreatePixmap( WORD w, WORD h );
extern void PVDestroyPixmap( PVPixmap *p );
void PVSelectPixmap( PVPixmap *p );
void PVPut( WORD x, WORD y, PVPixmap pm, DWORD flags );
void PVPutRect( WORD sx1, WORD sy1, WORD sx2, WORD sy2, WORD dx1, WORD dy1, WORD dx2, WORD dy2, PVPixmap pm, DWORD flags );

#endif
