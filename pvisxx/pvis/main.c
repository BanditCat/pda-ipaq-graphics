//current:
//figure mouse, make s. module

#include <windows.h>
#include <commctrl.h>
#include <aygshell.h>
#include <sipapi.h>

#include "pvi.h"
#include "gxi.h"
#include "resource.h"
#include "pvdbg.h"


#define MAX_LOADSTRING 100
#define MAX_ERRSTRING 256


// Global Variables:
HINSTANCE g_hInst;				
GXDisplayProperties gx_displayprop;
GXKeyList gx_keylist;
static SHACTIVATEINFO s_sai;
HWND g_hWnd;
BOOL inited = FALSE;

PVInputs PVInput = { 0, 0, 0, 0, 0, 0 };
PVDeviceInfo PVDevice;

// Forward declarations of functions included in this code module:
ATOM MyRegisterClass	(HINSTANCE, LPTSTR);
BOOL InitInstance	(HINSTANCE, int);
LRESULT CALLBACK	WndProc (HWND, UINT, WPARAM, LPARAM);

void PVIClean();
void PVICullInfo();


/* Entry point */
int WINAPI WinMain( HINSTANCE hInstance,
		  HINSTANCE hPrevInstance,
		  LPTSTR lpCmdLine,
		  int nCmdShow){
  MSG msg;
  WCHAR *emsg, ebuf[MAX_ERRSTRING];
  int status;
  DWORD oldtime, newtime;

  if( ( emsg = GXIInit() ) != NULL ){
    MessageBox( 0, emsg, L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
    exit(EXIT_SUCCESS);
  }

  if( atexit( PVIClean) ){
    MessageBox( 0, L"Failed to register exit function", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
    exit(EXIT_SUCCESS);
  }

  // Perform application initialization
  if ( !InitInstance( hInstance, nCmdShow ) ){
    ShowWindow( g_hWnd, SW_HIDE );
    MessageBox( 0, L"Unable to create window;", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
    exit(EXIT_SUCCESS);
  }

  PVICullInfo();

  if( PVIGetBuffer() ){
    ShowWindow( g_hWnd, SW_HIDE );
    MultiByteToWideChar( CP_ACP, 0, PVErrorMessage, -1, ebuf, MAX_ERRSTRING - 1 );
    MessageBox( 0, L"Failed to allocate screen buffer", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
    exit(EXIT_SUCCESS);
  }

  if( atexit( PVIRemoveBuffer) ){
    ShowWindow( g_hWnd, SW_HIDE );
    MessageBox( 0, L"Failed to register exit function", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
    exit(EXIT_SUCCESS);
  }

  if( PVIInit() == FALSE ){
    ShowWindow( g_hWnd, SW_HIDE );
    MessageBox( 0, L"Failed to initialize internal library facilities", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
    exit(EXIT_SUCCESS);
  }

  PVDBG( "Entering main message loop\n" );

  // Main message loop:
  while( 1 ){
    if ( PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ){
      if ( GetMessage( &msg, NULL, 0, 0 ) ){
        TranslateMessage( &msg );
        DispatchMessage( &msg );
      } else
        return msg.wParam;
    } else {
      PVDevice.screen = (WORD *)GXBeginDraw();
      if( PVDevice.screen == NULL ){
        ShowWindow( g_hWnd, SW_HIDE );
        MessageBox( g_hWnd, L"Failed to lock display", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
        exit( EXIT_SUCCESS );
      }
      oldtime = newtime;
      newtime = GetTickCount();

      if( !inited ){
        inited = TRUE;
        status = PVInit();
      }
      else
        status = PVTick( ( (double)( ( newtime < oldtime )?0:( newtime - oldtime ) ) ) / 1000.0 );
      PVInput.buttons &= 0x0000ffff;
      PVInput.penstatus &= 0x01;
      PVInput.pendx = ( PVInput.pendy = 0 );   
      PVIFlush();   
      GXEndDraw();
      switch( status ){
      
        case PV_OK:
          break;

        case PV_EXIT:
          return msg.wParam;
          break;

        case PV_ERROR:
          MultiByteToWideChar( CP_ACP, 0, PVErrorMessage, -1, ebuf, MAX_ERRSTRING - 1 );
          ShowWindow( g_hWnd, SW_HIDE );
          MessageBox( 0, ebuf, L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
          return msg.wParam;
          break;
      }
    }
  }
}

/* Registers the window class */
ATOM MyRegisterClass(HINSTANCE hInstance, LPTSTR szWindowClass)
{
  WNDCLASS wc;

  wc.style = CS_HREDRAW | CS_VREDRAW;
  wc.lpfnWndProc = (WNDPROC) WndProc;
  wc.cbClsExtra = 0;
  wc.cbWndExtra = 0;
  wc.hInstance = hInstance;
  wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_PICON));
  wc.hCursor = 0;
  wc.hbrBackground = (HBRUSH) GetStockObject(WHITE_BRUSH);
  wc.lpszMenuName = 0;
  wc.lpszClassName = szWindowClass;

  return RegisterClass(&wc);
}


//  Saves instance handle and creates main window
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
  HWND hWnd = NULL;
  TCHAR szTitle[MAX_LOADSTRING];			
  TCHAR szWindowClass[MAX_LOADSTRING];		
  int sx, sy;

  //Get screen size
  if ( !( sx = GetSystemMetrics( SM_CXSCREEN ) ) || !( sy = GetSystemMetrics( SM_CYSCREEN ) ) ){
    MessageBox(hWnd, L"Failed to retrieve system metrics", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
    return FALSE;
  }
  PVDBG( "Got system metrics: screen is %d by %d\n", sx, sy );
  

  g_hInst = hInstance;	
	
  LoadString(hInstance, IDS_APP_TITLE, szWindowClass, MAX_LOADSTRING);
  LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);

  //If it is already running, then focus on the window
  hWnd = FindWindow(szWindowClass, szTitle);	
  if (hWnd){
    SetForegroundWindow((HWND)((ULONG) hWnd | 0x00000001));
    return 0;
  } 

  MyRegisterClass(hInstance, szWindowClass);
	
  hWnd = CreateWindowEx( WS_EX_NOANIMATION | WS_EX_TOPMOST, szWindowClass, szTitle, WS_VISIBLE | WS_DLGFRAME, 0, 0, sx, sy, NULL, NULL, hInstance, NULL);
  if (!hWnd)	
    return FALSE;
	
  ShowWindow(hWnd, nCmdShow);
  UpdateWindow(hWnd);

  // Attempt to take over the screen
  if (GXOpenDisplay( hWnd, GX_FULLSCREEN) == 0)
    return FALSE;

  // Get display properties
  gx_displayprop = GXGetDisplayProperties();

  // Take over button handling
  GXOpenInput();

  // Get default buttons for up/down etc.
  gx_keylist = GXGetDefaultKeys(GX_NORMALKEYS);

  PVDBG( "Successfully initialized GAPI\n" );

  // Capture stylus input
  SetCapture( hWnd );
  
  /* Set global window handle */
  g_hWnd = hWnd;

  return TRUE;
}

 
//Processes messages for the main window.
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam){ 
  static int oldx, oldy; 

  switch (message){
    case WM_KEYDOWN:
      if( wParam == (unsigned) gx_keylist.vkUp ){
        if( !( PVInput.buttons & PV_BHUP ) )
          PVInput.buttons |= ( PV_BHUP | PV_BCUP );
        break;
      } else if( wParam == (unsigned) gx_keylist.vkDown ){
        if( !( PVInput.buttons & PV_BHDOWN ) )
          PVInput.buttons |= ( PV_BHDOWN | PV_BCDOWN );
        break;
      } else if( wParam == (unsigned) gx_keylist.vkLeft ){
        if( !( PVInput.buttons & PV_BHLEFT ) )
          PVInput.buttons |= ( PV_BHLEFT | PV_BCLEFT );
        break;
      } else if( wParam == (unsigned) gx_keylist.vkRight ){
        if( !( PVInput.buttons & PV_BHRIGHT ) )
          PVInput.buttons |= ( PV_BHRIGHT | PV_BCRIGHT );
        break;
      } else if( wParam == (unsigned) gx_keylist.vkA ){
        if( !( PVInput.buttons & PV_BHA ) )
          PVInput.buttons |= ( PV_BHA | PV_BCA );
        break;
      } else if( wParam == (unsigned) gx_keylist.vkB ){
        if( !( PVInput.buttons & PV_BHB ) )
          PVInput.buttons |= ( PV_BHB | PV_BCB );
        break;
      } else if( wParam == (unsigned) gx_keylist.vkC ){
        if( !( PVInput.buttons & PV_BHC ) )
          PVInput.buttons |= ( PV_BHC | PV_BCC );
        break;
      } else if( wParam == (unsigned) gx_keylist.vkStart ){
        if( !( PVInput.buttons & PV_BHD ) )
          PVInput.buttons |= ( PV_BHD | PV_BCD );
        break;
      } else
        break;
    case WM_KEYUP:
      if( wParam == (unsigned) gx_keylist.vkUp ){
        PVInput.buttons |= PV_BCUP;
        PVInput.buttons &= ~PV_BHUP;
        break;
      } else if( wParam == (unsigned) gx_keylist.vkDown ){
        PVInput.buttons |= PV_BCDOWN;
        PVInput.buttons &= ~PV_BHDOWN;
        break;
      } else if( wParam == (unsigned) gx_keylist.vkLeft ){
        PVInput.buttons |= PV_BCLEFT;
        PVInput.buttons &= ~PV_BHLEFT;
        break;
      } else if( wParam == (unsigned) gx_keylist.vkRight ){
        PVInput.buttons |= PV_BCRIGHT;
        PVInput.buttons &= ~PV_BHRIGHT;
        break;
      } else if( wParam == (unsigned) gx_keylist.vkA ){
        PVInput.buttons |= PV_BCA;
        PVInput.buttons &= ~PV_BHA;
        break;
      } else if( wParam == (unsigned) gx_keylist.vkB ){
        PVInput.buttons |= PV_BCB;
        PVInput.buttons &= ~PV_BHB;
        break;
      } else if( wParam == (unsigned) gx_keylist.vkC ){
        PVInput.buttons |= PV_BCC;
        PVInput.buttons &= ~PV_BHC;
        break;
      } else if( wParam == (unsigned) gx_keylist.vkStart ){
        PVInput.buttons |= PV_BCD;
        PVInput.buttons &= ~PV_BHD;
        break;
      } else
        break;
    case WM_LBUTTONDOWN:
       if( !( PVInput.penstatus & PV_PHELD ) ){
          PVInput.penx = ( oldx = LOWORD( lParam ) );
          PVInput.peny = ( oldy = HIWORD( lParam ) );
          PVInput.pendx = 0;
          PVInput.pendy = 0;
          PVInput.penstatus |= ( PV_PHELD | PV_PCHANGED );
        }
        break;
    case WM_LBUTTONUP:
       PVInput.penx = LOWORD( lParam );
       PVInput.peny = HIWORD( lParam );
       PVInput.pendx = ( LOWORD( lParam ) - oldx );
       PVInput.pendy = ( HIWORD( lParam ) - oldy  );
       PVInput.penstatus |= PV_PCHANGED;
       PVInput.penstatus &= ~PV_PHELD;
       break;
    case WM_MOUSEMOVE:
       oldx = PVInput.penx;
       oldy = PVInput.peny;
       PVInput.penx = LOWORD( lParam );
       PVInput.peny = HIWORD( lParam );
       PVInput.pendx = ( LOWORD( lParam ) - oldx );
       PVInput.pendy = ( HIWORD( lParam ) - oldy  );
       break;

    case WM_DESTROY:
       GXCloseInput();
       GXCloseDisplay();
       PostQuitMessage(0);
       break;

    case WM_KILLFOCUS:
       GXSuspend();
       break;

    case WM_SETFOCUS:
       GXResume();
       break;

    default:
       return DefWindowProc(hWnd, message, wParam, lParam);
   }
   return 0;
}


void PVIClean(){
  PVClose();
  PVIClose();

  if ( !ReleaseCapture() )
    MessageBox( 0, L"Failed to release stylus input", L"Warning", MB_OK | MB_ICONEXCLAMATION | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
}


/* Populates the PVDevice */
void PVICullInfo(){
  
  PVDevice.deltax = (WORD)( gx_displayprop.cbxPitch >> 1);
  PVDevice.deltay = (WORD)( gx_displayprop.cbyPitch >> 1);
  PVDevice.height = (WORD) gx_displayprop.cyHeight;
  PVDevice.width = (WORD) gx_displayprop.cxWidth;
  PVDevice.bpp = (BYTE) gx_displayprop.cBPP;
  PVDevice.inverted = (BOOL)( ( gx_displayprop.ffFormat & kfDirectInverted )?1:0 );

  if( !( gx_displayprop.ffFormat & kfDirect565 )  ||
      ( gx_displayprop.ffFormat & kfDirectInverted )  ||
      ( PVDevice.deltax != 1 ) ||
      ( PVDevice.deltay & 1 ) ||
      ( PVDevice.deltay != PVDevice.width ) ){
     ShowWindow( g_hWnd, SW_HIDE );
     MessageBox( g_hWnd, L"Unsupported display type", L"Fatal error", MB_OK | MB_ICONERROR | MB_APPLMODAL | MB_SETFOREGROUND | MB_TOPMOST );
     exit( EXIT_SUCCESS );
  }

  PVDevice.redbits = 5;
  PVDevice.greenbits = 6;
  PVDevice.bluebits = 5; 
  PVDevice.redshift = 11;
  PVDevice.greenshift = 5;
  PVDevice.blueshift = 0;
 
  PVDBG( "\nDevice information:\n" );
  PVDBG( "Delta in WORDs between horizontal pixels: %d\n", PVDevice.deltax );
  PVDBG( "Delta in WORDs between vertical pixels: %d\n", PVDevice.deltay );
  PVDBG( "Screen height: %d\n", PVDevice.height );
  PVDBG( "Screen width: %d\n", PVDevice.width );
  PVDBG( "Screen bitdepth: %d\n", PVDevice.bpp );
  PVDBG( "Screen %s inverted\n", PVDevice.inverted?"is":"is not" );
  PVDBG( "Red information: %d bits, bitshift is %d\n", PVDevice.redbits, PVDevice.redshift );
  PVDBG( "Blue information: %d bits, bitshift is %d\n", PVDevice.bluebits, PVDevice.blueshift );
  PVDBG( "Green information: %d bits, bitshift is %d\n", PVDevice.greenbits, PVDevice.greenshift );

  PVDBG( "\n" );
}
  




