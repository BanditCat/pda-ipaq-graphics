#include <stdio.h>
#include <math.h>

#include "pvis\pvdbg.h"
#include "pvis\pvi.h"
#include "pvis\pv.h"
#include "pvis\gxi.h"
#include "pvis\core.c"
#include "pvis\gxi.c"
#include "pvis\main.c"
#include "pvis\pvi.c"
#include "pvis\td.h"
#include "pvis\td.c"
#include "pvis\mat.c"
#include "pvis\pmp.h"
#include "pvis\pmp.c"

#include "pvisxx.H"


Input theInput;
Format theFormat;
Program theProgram;
Screen theScreen;

static const size_t screenwidth = 240;
static const size_t screenheight = 320;


int PVInit( void ){
  theFormat.bpp = 16;
  theFormat.redbits = 5; theFormat.redloss = 3;
  theFormat.redshift = PVDevice.redshift;
  theFormat.redmask = 31;
  theFormat.greenbits = 6; theFormat.greenloss = 2;
  theFormat.greenshift = PVDevice.greenshift; 
  theFormat.redmask = 63;
  theFormat.bluebits = 5; theFormat.blueloss = 3;
  theFormat.blueshift = PVDevice.blueshift; 
  theFormat.bluemask = 31;

  theScreen.pwidth = screenwidth;
  theScreen.pheight = screenheight;
  theScreen.pdata = PVDevice.screen;

  theInput.penstatus = PVInput.penstatus;
  theInput.penx = PVInput.penx;
  theInput.peny = PVInput.peny;
  theInput.pendx = PVInput.pendx;
  theInput.pendy = PVInput.pendy;
  theInput.buttons = PVInput.buttons;
  
  theProgram.init();
}

int PVTick( double delta ){
  theInput.penstatus = PVInput.penstatus;
  theInput.penx = PVInput.penx;
  theInput.peny = PVInput.peny;
  theInput.pendx = PVInput.pendx;
  theInput.pendy = PVInput.pendy;
  theInput.buttons = PVInput.buttons;

  if( theProgram.tick( delta ) )
    return PV_EXIT;
  else
    return PV_OK;
}

void PVClose( void ){
  theProgram.close();
}

