#ifndef PVISXX_H
#define PVISXX_H

typedef unsigned char byte;
typedef unsigned short int  word;
typedef unsigned int dword;
typedef signed char sbyte;
typedef signed short int  sword;
typedef signed int sdword;
typedef float fpnum;

#include "context.H"

struct Input{
  byte penstatus;
  word penx;
  word peny;
  sword pendx;
  sword pendy;
  
  dword buttons;

  static const dword upheld = 0x00000001;
  static const dword upchanged = 0x00010000;
  static const dword downheld = 0x00000002;
  static const dword downchanged = 0x00020000;
  static const dword leftheld = 0x00000004;
  static const dword leftchanged = 0x00040000;
  static const dword rightheld = 0x00000008;
  static const dword rightchanged = 0x00080000;
  static const dword aheld = 0x00000010;
  static const dword achanged = 0x00100000;
  static const dword bheld = 0x00000020;
  static const dword bchanged = 0x00200000;
  static const dword cheld = 0x00000040;
  static const dword cchanged = 0x00400000;
  static const dword dheld = 0x00000080;
  static const dword dchanged = 0x00800000;

  static const dword penheld = 0x01;
  static const dword penchanged = 0x02;
};

struct Format{
  byte bpp;
 
  byte redshift, redbits, redloss, redmask;
  byte greenshift, greenbits, greenloss, greenmask;
  byte blueshift, bluebits, blueloss, bluemask;
};

class Screen : public Context{
public:
  word* data( void ){ return pdata; }
  size_t width( void ){ return pwidth; }
  size_t height( void ){ return pheight; }
  friend int PVInit( void );
private:
  size_t pwidth, pheight;
  word* pdata;
};

class Program{
public:
  void init( void );
  bool tick( fpnum );
  void close( void );
};

extern Input theInput;
extern Format theFormat;
extern Screen theScreen;

#endif

