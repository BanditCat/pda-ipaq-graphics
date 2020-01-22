#include "gxi.h"
#include "pvdbg.h"

HINSTANCE GXHandle;

#define GXBeginDrawOrd 1
#define GXCloseDisplayOrd 2
#define GXCloseInputOrd 3
#define GXEndDrawOrd 4
#define GXGetDefaultKeysOrd 5
/* GXKeyList */
#define GXGetDisplayPropertiesOrd 6
/* GXDisplayProperties */
#define GXIsDisplayDRAMBufferOrd 7
#define GXOpenDisplayOrd 8
#define GXOpenInputOrd 9
#define GXResumeOrd 10
#define GXSetViewportOrd 11
#define GXSuspendOrd 12

int GetGXProc( int ord );
void FreeGX();

WCHAR *GXIInit(){
  FARPROC faddr;

  if( ( GXHandle = LoadLibrary( L"gx.dll" ) ) == NULL ){
    return L"Failed to load gx.dll";
  }

  if ( atexit( FreeGX ) != 0 ){
    FreeLibrary( GXHandle );
    return L"Failed to register exit function";
  }
  PVDBG( "Got handle for gx.dll\n" );

  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXOpenDisplayOrd ) ) == NULL )
    return L"Error getting process address for GXOpenDisplay" ;
  GXOpenDisplay = ( ( int (*)( HWND, DWORD ) ) faddr );
  PVDBG( "Got proccess address for GXOpenDisplay\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXCloseDisplayOrd ) ) == NULL )
    return L"Error getting process address for GXCloseDisplay" ;
  GXCloseDisplay = ( ( int (*)() ) faddr );
  PVDBG( "Got proccess address for GXCloseDisplay\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXBeginDrawOrd ) ) == NULL )
    return L"Error getting process address for GXBeginDraw" ;
  GXBeginDraw = ( ( void *(*)() ) faddr );
  PVDBG( "Got proccess address for GXBeginDraw\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXEndDrawOrd ) ) == NULL )
    return L"Error getting process address for GXEndDraw" ;
  GXEndDraw = ( ( int (*)() ) faddr );
  PVDBG( "Got proccess address for GXEndDraw\n" );

  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXOpenInputOrd) ) == NULL )
    return L"Error getting process address for GXOpenInput";
  GXOpenInput = ( ( int (*)() ) faddr );
  PVDBG( "Got proccess address for GXOpenInput\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXCloseInputOrd ) ) == NULL )
    return L"Error getting process address for GXCloseInput" ;
  GXCloseInput = ( ( int (*)() ) faddr );
  PVDBG( "Got proccess address for GXCloseInput\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXGetDisplayPropertiesOrd ) ) == NULL )
    return L"Error getting process address for GXGetDisplayProperties" ;
  GXGetDisplayProperties = ( ( GXDisplayProperties (*)() ) faddr );
  PVDBG( "Got proccess address for GXDisplayProperties\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXGetDefaultKeysOrd ) ) == NULL )
  return L"Error getting process address for GXGe4DefaultKeys" ;
  GXGetDefaultKeys = ( ( GXKeyList (*)( int ) ) faddr );
  PVDBG( "Got proccess address for GXGetDefaultKeys\n" );

  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXSuspendOrd) ) == NULL )
    return L"Error getting process address for GXSuspend";
  GXSuspend = ( ( int (*)() ) faddr );
  PVDBG( "Got proccess address for GXSuspend\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXResumeOrd ) ) == NULL )
    return L"Error getting process address for GXResume" ;
  GXResume = ( ( int (*)() ) faddr );
  PVDBG( "Got proccess address for GXResume\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXSetViewportOrd ) ) == NULL )
    return L"Error getting process address for GXSetViewport" ;
  GXSetViewport = ( ( int (*)( DWORD, DWORD, DWORD, DWORD ) ) faddr );
  PVDBG( "Got proccess address for GXSetViewport\n" );
  if( ( faddr = GetProcAddress( GXHandle, (const WCHAR*) GXIsDisplayDRAMBufferOrd ) ) == NULL )
    return L"Error getting process address for GXIsDisplayDRAMBuffer" ;
  GXIsDisplayDRAMBuffer = ( ( BOOL (*)() ) faddr );
  PVDBG( "Got proccess address for GXIsDisplayDRAMBuffer\n" );


  return NULL;
}

void FreeGX(){
  PVDBG( "Freeing gx.dll\n" );
  FreeLibrary( GXHandle );
}
