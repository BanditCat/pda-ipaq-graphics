/* Internal pvis header */
#ifndef PVI_H_INCLUDED
#define PVI_H_INCLUDED

#include "pv.h"
#include "pmp.h"

/* Globals */
BOOL PVIDirty;
PVPixmap *PVCurrentPixmap = NULL;
char *PVErrorMessage = "Unknown error";
extern double PVIGamma;
DWORD *PVTSortSpace;

/* Functions */
void PVIFlush();
void PVIRemoveBuffer();
BOOL PVIGetBuffer();
BOOL PVIInit();
void PVIClose();
inline void PVIUABLine( WORD x1, WORD y1, WORD a1, WORD x2, WORD y2, WORD a2, PVColor pvc, WORD *scp );
inline void PVIULine( WORD x1, WORD y1, WORD x2, WORD y2, PVColor pvc, WORD *scp );
void PVILoadAlphaPrime();
inline WORD PVIGetColor( PVColor c );

#endif

