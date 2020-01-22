# 1 "/src/pvis/main/pvis.rc"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "/pgcc/fixincl.h" 1
# 2 "<command line>" 2
# 1 "/src/pvis/main/pvis.rc"
# 1 "/pgcc/include/commctrl.h" 1
# 25 "/pgcc/include/commctrl.h"
typedef LONG HRESULT;
# 97 "/pgcc/include/commctrl.h"
# 1 "/pgcc/include/prsht.h" 1
# 14 "/pgcc/include/prsht.h"
#pragma warning(disable: 4201) 
# 57 "/pgcc/include/prsht.h"
struct _PSP;
typedef struct _PSP FAR* HPROPSHEETPAGE;


struct _PROPSHEETPAGEA;
struct _PROPSHEETPAGEW;


typedef UINT (CALLBACK FAR * LPFNPSPCALLBACKA)(HWND hwnd, UINT uMsg, struct _PROPSHEETPAGEA FAR *ppsp);
typedef UINT (CALLBACK FAR * LPFNPSPCALLBACKW)(HWND hwnd, UINT uMsg, struct _PROPSHEETPAGEW FAR *ppsp);
# 91 "/pgcc/include/prsht.h"
typedef struct _PROPSHEETPAGEA {
        DWORD dwSize;
        DWORD dwFlags;
        HINSTANCE hInstance;
        union {
            LPCSTR pszTemplate;

            LPCDLGTEMPLATE pResource;



        } ;
        union {
            HICON hIcon;
            LPCSTR pszIcon;
        } ;
        LPCSTR pszTitle;
        DLGPROC pfnDlgProc;
        LPARAM lParam;
        LPFNPSPCALLBACKA pfnCallback;
        UINT FAR * pcRefParent;
} PROPSHEETPAGEA, FAR *LPPROPSHEETPAGEA;
typedef const PROPSHEETPAGEA FAR *LPCPROPSHEETPAGEA;

typedef struct _PROPSHEETPAGEW {
        DWORD dwSize;
        DWORD dwFlags;
        HINSTANCE hInstance;
        union {
            LPCWSTR pszTemplate;

            LPCDLGTEMPLATE pResource;



        };
        union {
            HICON hIcon;
            LPCWSTR pszIcon;
        };
        LPCWSTR pszTitle;
        DLGPROC pfnDlgProc;
        LPARAM lParam;
        LPFNPSPCALLBACKW pfnCallback;
        UINT FAR * pcRefParent;
} PROPSHEETPAGEW, FAR *LPPROPSHEETPAGEW;
typedef const PROPSHEETPAGEW FAR *LPCPROPSHEETPAGEW;
# 169 "/pgcc/include/prsht.h"
typedef int (CALLBACK *PFNPROPSHEETCALLBACK)(HWND, UINT, LPARAM);

typedef struct _PROPSHEETHEADERA {
        DWORD dwSize;
        DWORD dwFlags;
        HWND hwndParent;
        HINSTANCE hInstance;
        union {
            HICON hIcon;
            LPCSTR pszIcon;
        };
        LPCSTR pszCaption;


        UINT nPages;
        union {
            UINT nStartPage;
            LPCSTR pStartPage;
        };
        union {
            LPCPROPSHEETPAGEA ppsp;
            HPROPSHEETPAGE FAR *phpage;
        };
        PFNPROPSHEETCALLBACK pfnCallback;
} PROPSHEETHEADERA, FAR *LPPROPSHEETHEADERA;
typedef const PROPSHEETHEADERA FAR *LPCPROPSHEETHEADERA;

typedef struct _PROPSHEETHEADERW {
        DWORD dwSize;
        DWORD dwFlags;
        HWND hwndParent;
        HINSTANCE hInstance;
        union {
            HICON hIcon;
            LPCWSTR pszIcon;
        };
        LPCWSTR pszCaption;


        UINT nPages;
        union {
            UINT nStartPage;
            LPCWSTR pStartPage;
        };
        union {
            LPCPROPSHEETPAGEW ppsp;
            HPROPSHEETPAGE FAR *phpage;
        };
        PFNPROPSHEETCALLBACK pfnCallback;
} PROPSHEETHEADERW, FAR *LPPROPSHEETHEADERW;
typedef const PROPSHEETHEADERW FAR *LPCPROPSHEETHEADERW;
# 240 "/pgcc/include/prsht.h"
DECLSPEC_IMPORT HPROPSHEETPAGE WINAPI CreatePropertySheetPageA(LPCPROPSHEETPAGEA);
DECLSPEC_IMPORT HPROPSHEETPAGE WINAPI CreatePropertySheetPageW(LPCPROPSHEETPAGEW);
DECLSPEC_IMPORT BOOL WINAPI DestroyPropertySheetPage(HPROPSHEETPAGE);
DECLSPEC_IMPORT int WINAPI PropertySheetA(LPCPROPSHEETHEADERA);
DECLSPEC_IMPORT int WINAPI PropertySheetW(LPCPROPSHEETHEADERW);
# 256 "/pgcc/include/prsht.h"
typedef BOOL (CALLBACK FAR * LPFNADDPROPSHEETPAGE)(HPROPSHEETPAGE, LPARAM);
typedef BOOL (CALLBACK FAR * LPFNADDPROPSHEETPAGES)(LPVOID, LPFNADDPROPSHEETPAGE, LPARAM);


typedef struct _PSHNOTIFY
{
    NMHDR hdr;
    LPARAM lParam;
} PSHNOTIFY, FAR *LPPSHNOTIFY;
# 98 "/pgcc/include/commctrl.h" 2
# 117 "/pgcc/include/commctrl.h"
DECLSPEC_IMPORT void WINAPI InitCommonControls(void);


typedef struct tagINITCOMMONCONTROLSEX {
    DWORD dwSize;
    DWORD dwICC;
} INITCOMMONCONTROLSEX, *LPINITCOMMONCONTROLSEX;
# 141 "/pgcc/include/commctrl.h"
DECLSPEC_IMPORT BOOL WINAPI InitCommonControlsEx(LPINITCOMMONCONTROLSEX);
# 187 "/pgcc/include/commctrl.h"
typedef struct tagNMMOUSE {
    NMHDR hdr;
    DWORD dwItemSpec;
    DWORD dwItemData;
    POINT pt;
} NMMOUSE, FAR* LPNMMOUSE;

typedef NMMOUSE NMCLICK;
typedef LPNMMOUSE LPNMCLICK;



typedef struct tagNMKEY
{
    NMHDR hdr;
    WORD wVKey;
    UINT flags;
} NMKEY, FAR *LPNMKEY;
# 319 "/pgcc/include/commctrl.h"
typedef struct tagNMCUSTOMDRAWINFO
{
    NMHDR hdr;
    DWORD dwDrawStage;
    HDC hdc;
    RECT rc;
    DWORD dwItemSpec;
    UINT uItemState;
    LPARAM lItemlParam;
} NMCUSTOMDRAW, FAR * LPNMCUSTOMDRAW;





typedef struct tagNMTTCUSTOMDRAW
{
    NMCUSTOMDRAW nmcd;
    UINT uDrawFlags;
} NMTTCUSTOMDRAW, FAR * LPNMTTCUSTOMDRAW;
# 350 "/pgcc/include/commctrl.h"
struct _IMAGELIST;
typedef struct _IMAGELIST NEAR* HIMAGELIST;


typedef struct _IMAGELISTDRAWPARAMS {
    DWORD cbSize;
    HIMAGELIST himl;
    int i;
    HDC hdcDst;
    int x;
    int y;
    int cx;
    int cy;
    int xBitmap;
    int yBitmap;
    COLORREF rgbBk;
    COLORREF rgbFg;
    UINT fStyle;
    DWORD dwRop;
} IMAGELISTDRAWPARAMS, FAR * LPIMAGELISTDRAWPARAMS;
# 378 "/pgcc/include/commctrl.h"
DECLSPEC_IMPORT HIMAGELIST WINAPI ImageList_Create(int cx, int cy, UINT flags, int cInitial, int cGrow);
DECLSPEC_IMPORT BOOL WINAPI ImageList_Destroy(HIMAGELIST himl);
DECLSPEC_IMPORT int WINAPI ImageList_GetImageCount(HIMAGELIST himl);

DECLSPEC_IMPORT BOOL WINAPI ImageList_SetImageCount(HIMAGELIST himl, UINT uNewCount);

DECLSPEC_IMPORT int WINAPI ImageList_Add(HIMAGELIST himl, HBITMAP hbmImage, HBITMAP hbmMask);
DECLSPEC_IMPORT int WINAPI ImageList_ReplaceIcon(HIMAGELIST himl, int i, HICON hicon);
DECLSPEC_IMPORT COLORREF WINAPI ImageList_SetBkColor(HIMAGELIST himl, COLORREF clrBk);
DECLSPEC_IMPORT COLORREF WINAPI ImageList_GetBkColor(HIMAGELIST himl);
DECLSPEC_IMPORT BOOL WINAPI ImageList_SetOverlayImage(HIMAGELIST himl, int iImage, int iOverlay);
# 409 "/pgcc/include/commctrl.h"
DECLSPEC_IMPORT BOOL WINAPI ImageList_Draw(HIMAGELIST himl, int i, HDC hdcDst, int x, int y, UINT fStyle);




DECLSPEC_IMPORT BOOL WINAPI ImageList_Replace(HIMAGELIST himl, int i, HBITMAP hbmImage, HBITMAP hbmMask);
DECLSPEC_IMPORT int WINAPI ImageList_AddMasked(HIMAGELIST himl, HBITMAP hbmImage, COLORREF crMask);
DECLSPEC_IMPORT BOOL WINAPI ImageList_DrawEx(HIMAGELIST himl, int i, HDC hdcDst, int x, int y, int dx, int dy, COLORREF rgbBk, COLORREF rgbFg, UINT fStyle);

DECLSPEC_IMPORT BOOL WINAPI ImageList_DrawIndirect(IMAGELISTDRAWPARAMS* pimldp);

DECLSPEC_IMPORT BOOL WINAPI ImageList_Remove(HIMAGELIST himl, int i);
DECLSPEC_IMPORT HICON WINAPI ImageList_GetIcon(HIMAGELIST himl, int i, UINT flags);
# 435 "/pgcc/include/commctrl.h"
DECLSPEC_IMPORT HIMAGELIST WINAPI ImageList_LoadImage(HINSTANCE hi, LPCTSTR lpbmp, int cx, int cGrow, COLORREF crMask, UINT uType, UINT uFlags);





DECLSPEC_IMPORT BOOL WINAPI ImageList_Copy(HIMAGELIST himlDst, int iDst, HIMAGELIST himlSrc, int iSrc, UINT uFlags);


DECLSPEC_IMPORT BOOL WINAPI ImageList_BeginDrag(HIMAGELIST himlTrack, int iTrack, int dxHotspot, int dyHotspot);
DECLSPEC_IMPORT void WINAPI ImageList_EndDrag();
DECLSPEC_IMPORT BOOL WINAPI ImageList_DragEnter(HWND hwndLock, int x, int y);
DECLSPEC_IMPORT BOOL WINAPI ImageList_DragLeave(HWND hwndLock);
DECLSPEC_IMPORT BOOL WINAPI ImageList_DragMove(int x, int y);
DECLSPEC_IMPORT BOOL WINAPI ImageList_SetDragCursorImage(HIMAGELIST himlDrag, int iDrag, int dxHotspot, int dyHotspot);

DECLSPEC_IMPORT BOOL WINAPI ImageList_DragShowNolock(BOOL fShow);
DECLSPEC_IMPORT HIMAGELIST WINAPI ImageList_GetDragImage(POINT FAR* ppt,POINT FAR* pptHotspot);





typedef struct _IMAGEINFO
{
    HBITMAP hbmImage;
    HBITMAP hbmMask;
    int Unused1;
    int Unused2;
    RECT rcImage;
} IMAGEINFO, FAR *LPIMAGEINFO;

DECLSPEC_IMPORT BOOL WINAPI ImageList_GetIconSize(HIMAGELIST himl, int FAR *cx, int FAR *cy);
DECLSPEC_IMPORT BOOL WINAPI ImageList_SetIconSize(HIMAGELIST himl, int cx, int cy);
DECLSPEC_IMPORT BOOL WINAPI ImageList_GetImageInfo(HIMAGELIST himl, int i, IMAGEINFO FAR* pImageInfo);
DECLSPEC_IMPORT HIMAGELIST WINAPI ImageList_Merge(HIMAGELIST himl1, int i1, HIMAGELIST himl2, int i2, int dx, int dy);

DECLSPEC_IMPORT HIMAGELIST WINAPI ImageList_Duplicate(HIMAGELIST himl);



HBITMAP CreateColorBitmap(int cx, int cy);
HBITMAP CreateMonoBitmap(int cx, int cy);
void WINAPI ImageList_CopyDitherImage (HIMAGELIST himlDest, WORD iDst, int xDst, int yDst, HIMAGELIST himlSrc,
        int iSrc, UINT fStyle);
# 528 "/pgcc/include/commctrl.h"
typedef struct _HD_ITEMA
{
    UINT mask;
    int cxy;
    LPSTR pszText;
    HBITMAP hbm;
    int cchTextMax;
    int fmt;
    LPARAM lParam;

    int iImage;
    int iOrder;

} HDITEMA, FAR * LPHDITEMA;


typedef struct _HD_ITEMW
{
    UINT mask;
    int cxy;
    LPWSTR pszText;
    HBITMAP hbm;
    int cchTextMax;
    int fmt;
    LPARAM lParam;

    int iImage;
    int iOrder;

} HDITEMW, FAR * LPHDITEMW;
# 648 "/pgcc/include/commctrl.h"
typedef struct _HD_LAYOUT
{
    RECT FAR* prc;
    WINDOWPOS FAR* pwpos;
} HDLAYOUT, FAR *LPHDLAYOUT;
# 675 "/pgcc/include/commctrl.h"
typedef struct _HD_HITTESTINFO
{
    POINT pt;
    UINT flags;
    int iItem;
} HDHITTESTINFO, FAR *LPHDHITTESTINFO;
# 794 "/pgcc/include/commctrl.h"
typedef struct tagNMHEADERA
{
    NMHDR hdr;
    int iItem;
    int iButton;
    HDITEMA FAR* pitem;
} NMHEADERA, FAR* LPNMHEADERA;


typedef struct tagNMHEADERW
{
    NMHDR hdr;
    int iItem;
    int iButton;
    HDITEMW FAR* pitem;
} NMHEADERW, FAR* LPNMHEADERW;
# 819 "/pgcc/include/commctrl.h"
typedef struct tagNMHDDISPINFOW
{
    NMHDR hdr;
    int iItem;
    UINT mask;
    LPWSTR pszText;
    int cchTextMax;
    int iImage;
    LPARAM lParam;
} NMHDDISPINFOW, FAR* LPNMHDDISPINFOW;

typedef struct tagNMHDDISPINFOA
{
    NMHDR hdr;
    int iItem;
    UINT mask;
    LPSTR pszText;
    int cchTextMax;
    int iImage;
    LPARAM lParam;
} NMHDDISPINFOA, FAR* LPNMHDDISPINFOA;
# 934 "/pgcc/include/commctrl.h"
typedef struct _TBBUTTON {
    int iBitmap;
    int idCommand;
    BYTE fsState;
    BYTE fsStyle;

    BYTE bReserved[2];

    DWORD dwData;
    int iString;
} TBBUTTON, NEAR* PTBBUTTON, FAR* LPTBBUTTON;
typedef const TBBUTTON FAR* LPCTBBUTTON;

DECLSPEC_IMPORT HWND WINAPI CreateToolbarEx(HWND hwnd, DWORD ws, UINT wID, int nBitmaps,
                        HINSTANCE hBMInst, UINT wBMID, LPCTBBUTTON lpButtons,
                        int iNumButtons, int dxButton, int dyButton,
                        int dxBitmap, int dyBitmap, UINT uStructSize);
# 1014 "/pgcc/include/commctrl.h"
typedef struct tagTBADDBITMAP {
        HINSTANCE hInst;
        UINT nID;
} TBADDBITMAP, *LPTBADDBITMAP;
# 1121 "/pgcc/include/commctrl.h"
typedef struct {
    HINSTANCE hInstOld;
    UINT nIDOld;
    HINSTANCE hInstNew;
    UINT nIDNew;
    int nButtons;
} TBREPLACEBITMAP, *LPTBREPLACEBITMAP;
# 1144 "/pgcc/include/commctrl.h"
typedef struct {
    UINT cbSize;
    DWORD dwMask;
    int idCommand;
    int iImage;
    BYTE fsState;
    BYTE fsStyle;
    WORD cx;
    DWORD lParam;
    LPSTR pszText;
    int cchText;
} TBBUTTONINFOA, *LPTBBUTTONINFOA;

typedef struct {
    UINT cbSize;
    DWORD dwMask;
    int idCommand;
    int iImage;
    BYTE fsState;
    BYTE fsStyle;
    WORD cx;
    DWORD lParam;
    LPWSTR pszText;
    int cchText;
} TBBUTTONINFOW, *LPTBBUTTONINFOW;
# 1248 "/pgcc/include/commctrl.h"
typedef struct tagNMTOOLBARA {

    NMHDR hdr;

    int iItem;
    TBBUTTON tbButton;
    int cchText;
    LPSTR pszText;
} NMTOOLBARA, FAR* LPNMTOOLBARA;


typedef struct tagNMTOOLBARW {

    NMHDR hdr;

    int iItem;
    TBBUTTON tbButton;
    int cchText;
    LPWSTR pszText;
} NMTOOLBARW, FAR* LPNMTOOLBARW;
# 1322 "/pgcc/include/commctrl.h"
typedef struct tagREBARINFO
{
    UINT cbSize;
    UINT fMask;

    HIMAGELIST himl;



} REBARINFO, FAR *LPREBARINFO;
# 1361 "/pgcc/include/commctrl.h"
typedef struct tagREBARBANDINFOA
{
    UINT cbSize;
    UINT fMask;
    UINT fStyle;
    COLORREF clrFore;
    COLORREF clrBack;
    LPSTR lpText;
    UINT cch;
    int iImage;
    HWND hwndChild;
    UINT cxMinChild;
    UINT cyMinChild;
    UINT cx;
    HBITMAP hbmBack;
    UINT wID;

    UINT cyChild;
    UINT cyMaxChild;
    UINT cyIntegral;
    UINT cxIdeal;
    LPARAM lParam;

} REBARBANDINFOA, FAR *LPREBARBANDINFOA;
typedef REBARBANDINFOA CONST FAR *LPCREBARBANDINFOA;

typedef struct tagREBARBANDINFOW
{
    UINT cbSize;
    UINT fMask;
    UINT fStyle;
    COLORREF clrFore;
    COLORREF clrBack;
    LPWSTR lpText;
    UINT cch;
    int iImage;
    HWND hwndChild;
    UINT cxMinChild;
    UINT cyMinChild;
    UINT cx;
    HBITMAP hbmBack;
    UINT wID;

    UINT cyChild;
    UINT cyMaxChild;
    UINT cyIntegral;
    UINT cxIdeal;
    LPARAM lParam;

} REBARBANDINFOW, FAR *LPREBARBANDINFOW;
typedef REBARBANDINFOW CONST FAR *LPCREBARBANDINFOW;
# 1497 "/pgcc/include/commctrl.h"
typedef struct tagNMREBAR
{
        NMHDR hdr;
        UINT uBand;
        UINT wID;
        UINT cyChild;
        UINT cyBand;
} NMREBAR, *LPNMREBAR;

typedef struct tagNMRBAUTOSIZE
{
        NMHDR hdr;
        BOOL fChanged;
        RECT rcTarget;
        RECT rcActual;
} NMRBAUTOSIZE, *LPNMRBAUTOSIZE;






typedef struct _RB_HITTESTINFO
{
    POINT pt;
    UINT flags;
    int iBand;
} RBHITTESTINFO, FAR *LPRBHITTESTINFO;
# 1539 "/pgcc/include/commctrl.h"
typedef struct tagCOMMANDBANDSRESTOREINFO
{
    UINT cbSize;
    UINT wID;
    UINT fStyle;
    UINT cxRestored;
    BOOL fMaximized;
} COMMANDBANDSRESTOREINFO, *LPCOMMANDBANDSRESTOREINFO;
typedef COMMANDBANDSRESTOREINFO CONST *LPCCOMMANDBANDSRESTOREINFO;

DECLSPEC_IMPORT HWND WINAPI CommandBar_Create(HINSTANCE hInst, HWND hwndParent, int idCmdBar);
DECLSPEC_IMPORT BOOL WINAPI CommandBar_Show(HWND hwndCB, BOOL fShow);
DECLSPEC_IMPORT int WINAPI CommandBar_AddBitmap(HWND hwndCB, HINSTANCE hInst, int idBitmap,
                                                                  int iNumImages, int iImageWidth,
                                                                  int iImageHeight);
DECLSPEC_IMPORT HWND WINAPI CommandBar_InsertComboBox(HWND hwndCB, HINSTANCE hInstance,
                                                                           int iWidth, UINT dwStyle,
                                                                           WORD idComboBox, WORD iButton);
DECLSPEC_IMPORT BOOL WINAPI CommandBar_InsertMenubar(HWND hwndCB, HINSTANCE hInst,
                                                                          WORD idMenu, WORD iButton);
DECLSPEC_IMPORT BOOL WINAPI CommandBar_InsertMenubarEx(HWND hwndCB,
                                                               HINSTANCE hinst,
                                                               LPTSTR pszMenu,
                                                               WORD iButton);
DECLSPEC_IMPORT BOOL WINAPI CommandBar_DrawMenuBar(HWND hwndCB,
                                                                      WORD iButton);
DECLSPEC_IMPORT HMENU WINAPI CommandBar_GetMenu(HWND hwndCB, WORD iButton);
DECLSPEC_IMPORT BOOL WINAPI CommandBar_AddAdornments(HWND hwndCB,
                                                                                                         DWORD dwFlags,
                                                                                                         DWORD dwReserved);
DECLSPEC_IMPORT int WINAPI CommandBar_Height(HWND hwndCB);
DECLSPEC_IMPORT BOOL WINAPI IsCommandBarMessage(HWND hwndCB, LPMSG lpMsg);


DECLSPEC_IMPORT HWND WINAPI CommandBands_Create(HINSTANCE hinst,
                                               HWND hwndParent,
                                               UINT wID,
                                               DWORD dwStyles,
                                               HIMAGELIST himl);
DECLSPEC_IMPORT BOOL WINAPI CommandBands_AddBands(HWND hwndCmdBands,
                                                 HINSTANCE hinst,
                                                 UINT cBands,
                                                 LPREBARBANDINFOW prbbi);
DECLSPEC_IMPORT HWND WINAPI CommandBands_GetCommandBar(HWND hwndCmdBands, UINT uBand);
DECLSPEC_IMPORT BOOL WINAPI CommandBands_AddAdornments(HWND hwndCmdBands,
                                                      HINSTANCE hinst,
                                                      DWORD dwFlags,
                                                      LPREBARBANDINFOW prbbi);
DECLSPEC_IMPORT BOOL WINAPI CommandBands_Show(HWND hwndCmdBands, BOOL fShow);
DECLSPEC_IMPORT BOOL WINAPI CommandBands_GetRestoreInformation(HWND hwndCmdBands,
                                               UINT uBand,
                                               LPCOMMANDBANDSRESTOREINFO pcbri);
# 1632 "/pgcc/include/commctrl.h"
DECLSPEC_IMPORT void WINAPI DrawStatusTextA(HDC hDC, LPRECT lprc, LPCSTR pszText, UINT uFlags);
DECLSPEC_IMPORT void WINAPI DrawStatusTextW(HDC hDC, LPRECT lprc, LPCWSTR pszText, UINT uFlags);

DECLSPEC_IMPORT HWND WINAPI CreateStatusWindowA(LONG style, LPCSTR lpszText, HWND hwndParent, UINT wID);
DECLSPEC_IMPORT HWND WINAPI CreateStatusWindowW(LONG style, LPCWSTR lpszText, HWND hwndParent, UINT wID);
# 1813 "/pgcc/include/commctrl.h"
typedef struct _UDACCEL {
    UINT nSec;
    UINT nInc;
} UDACCEL, FAR *LPUDACCEL;
# 1854 "/pgcc/include/commctrl.h"
DECLSPEC_IMPORT HWND WINAPI CreateUpDownControl(DWORD dwStyle, int x, int y, int cx, int cy,
                                HWND hParent, int nID, HINSTANCE hInst,
                                HWND hBuddy,
                                int nUpper, int nLower, int nPos);
# 1867 "/pgcc/include/commctrl.h"
typedef struct _NM_UPDOWN
{
    NMHDR hdr;
    int iPos;
    int iDelta;
} NMUPDOWN, FAR *LPNMUPDOWN;
# 1912 "/pgcc/include/commctrl.h"
typedef struct
{
   int iLow;
   int iHigh;
} PBRANGE, *PPBRANGE;
# 2054 "/pgcc/include/commctrl.h"
typedef struct tagLVITEMA
{
    UINT mask;
    int iItem;
    int iSubItem;
    UINT state;
    UINT stateMask;
    LPSTR pszText;
    int cchTextMax;
    int iImage;
    LPARAM lParam;

    int iIndent;

} LVITEMA, FAR* LPLVITEMA;

typedef struct tagLVITEMW
{
    UINT mask;
    int iItem;
    int iSubItem;
    UINT state;
    UINT stateMask;
    LPWSTR pszText;
    int cchTextMax;
    int iImage;
    LPARAM lParam;

    int iIndent;

} LVITEMW, FAR* LPLVITEMW;
# 2196 "/pgcc/include/commctrl.h"
typedef struct tagLVFINDINFOA
{
    UINT flags;
    LPCSTR psz;
    LPARAM lParam;
    POINT pt;
    UINT vkDirection;
} LVFINDINFOA, FAR* LPFINDINFOA;

typedef struct tagLVFINDINFOW
{
    UINT flags;
    LPCWSTR psz;
    LPARAM lParam;
    POINT pt;
    UINT vkDirection;
} LVFINDINFOW, FAR* LPFINDINFOW;
# 2283 "/pgcc/include/commctrl.h"
typedef struct tagLVHITTESTINFO
{
    POINT pt;
    UINT flags;
    int iItem;

    int iSubItem;

} LVHITTESTINFO, FAR* LPLVHITTESTINFO;
# 2353 "/pgcc/include/commctrl.h"
typedef struct tagLVCOLUMNA
{
    UINT mask;
    int fmt;
    int cx;
    LPSTR pszText;
    int cchTextMax;
    int iSubItem;

    int iImage;
    int iOrder;

} LVCOLUMNA, FAR* LPLVCOLUMNA;

typedef struct tagLVCOLUMNW
{
    UINT mask;
    int fmt;
    int cx;
    LPWSTR pszText;
    int cchTextMax;
    int iSubItem;

    int iImage;
    int iOrder;

} LVCOLUMNW, FAR* LPLVCOLUMNW;
# 2589 "/pgcc/include/commctrl.h"
typedef int (CALLBACK *PFNLVCOMPARE)(LPARAM, LPARAM, LPARAM);
# 2697 "/pgcc/include/commctrl.h"
typedef struct tagNMLISTVIEW
{
    NMHDR hdr;
    int iItem;
    int iSubItem;
    UINT uNewState;
    UINT uOldState;
    UINT uChanged;
    POINT ptAction;
    LPARAM lParam;
} NMLISTVIEW, FAR *LPNMLISTVIEW;



typedef struct tagNMLVCUSTOMDRAW
{
    NMCUSTOMDRAW nmcd;
    COLORREF clrText;
    COLORREF clrTextBk;

    int iSubItem;

} NMLVCUSTOMDRAW, *LPNMLVCUSTOMDRAW;

typedef struct tagNMLVCACHEHINT
{
    NMHDR hdr;
    int iFrom;
    int iTo;
} NMLVCACHEHINT, FAR *LPNMLVCACHEHINT;





typedef struct tagNMLVFINDITEM
{
    NMHDR hdr;
    int iStart;
    LVFINDINFOW lvfi;
} NMLVFINDITEM, FAR *LPNMLVFINDITEM;





typedef struct tagNMLVODSTATECHANGE
{
    NMHDR hdr;
    int iFrom;
    int iTo;
    UINT uNewState;
    UINT uOldState;
} NMLVODSTATECHANGE, FAR *LPNMLVODSTATECHANGE;
# 2821 "/pgcc/include/commctrl.h"
typedef struct tagLVDISPINFO {
    NMHDR hdr;
    LVITEMA item;
} NMLVDISPINFOA, FAR *LPNMLVDISPINFOA;

typedef struct tagLVDISPINFOW {
    NMHDR hdr;
    LVITEMW item;
} NMLVDISPINFOW, FAR * LPNMLVDISPINFOW;
# 2846 "/pgcc/include/commctrl.h"
typedef struct tagLVKEYDOWN
{
    NMHDR hdr;
    WORD wVKey;
    UINT flags;
} NMLVKEYDOWN, FAR *LPNMLVKEYDOWN;
# 2899 "/pgcc/include/commctrl.h"
typedef struct _TREEITEM FAR* HTREEITEM;
# 2943 "/pgcc/include/commctrl.h"
typedef struct tagTVITEMA {
    UINT mask;
    HTREEITEM hItem;
    UINT state;
    UINT stateMask;
    LPSTR pszText;
    int cchTextMax;
    int iImage;
    int iSelectedImage;
    int cChildren;
    LPARAM lParam;
} TVITEMA, FAR *LPTVITEMA;

typedef struct tagTVITEMW {
    UINT mask;
    HTREEITEM hItem;
    UINT state;
    UINT stateMask;
    LPWSTR pszText;
    int cchTextMax;
    int iImage;
    int iSelectedImage;
    int cChildren;
    LPARAM lParam;
} TVITEMW, FAR *LPTVITEMW;
# 3000 "/pgcc/include/commctrl.h"
typedef struct tagTVINSERTSTRUCTA {
    HTREEITEM hParent;
    HTREEITEM hInsertAfter;
    TVITEMA item;
} TVINSERTSTRUCTA, FAR *LPTVINSERTSTRUCTA;

typedef struct tagTVINSERTSTRUCTW {
    HTREEITEM hParent;
    HTREEITEM hInsertAfter;
    TVITEMW item;
} TVINSERTSTRUCTW, FAR *LPTVINSERTSTRUCTW;
# 3189 "/pgcc/include/commctrl.h"
typedef struct tagTVHITTESTINFO {
    POINT pt;
    UINT flags;
    HTREEITEM hItem;
} TVHITTESTINFO, FAR *LPTVHITTESTINFO;
# 3254 "/pgcc/include/commctrl.h"
typedef int (CALLBACK *PFNTVCOMPARE)(LPARAM lParam1, LPARAM lParam2, LPARAM lParamSort);
# 3265 "/pgcc/include/commctrl.h"
typedef struct tagTVSORTCB
{
        HTREEITEM hParent;
        PFNTVCOMPARE lpfnCompare;
        LPARAM lParam;
} TVSORTCB, FAR *LPTVSORTCB;
# 3290 "/pgcc/include/commctrl.h"
typedef struct tagNMTREEVIEWA {
    NMHDR hdr;
    UINT action;
    TVITEMA itemOld;
    TVITEMA itemNew;
    POINT ptDrag;
} NMTREEVIEWA, FAR *LPNMTREEVIEWA;


typedef struct tagNMTREEVIEWW {
    NMHDR hdr;
    UINT action;
    TVITEMW itemOld;
    TVITEMW itemNew;
    POINT ptDrag;
} NMTREEVIEWW, FAR *LPNMTREEVIEWW;
# 3345 "/pgcc/include/commctrl.h"
typedef struct tagTVDISPINFOA {
    NMHDR hdr;
    TVITEMA item;
} NMTVDISPINFOA, FAR *LPNMTVDISPINFOA;

typedef struct tagTVDISPINFOW {
    NMHDR hdr;
    TVITEMW item;
} NMTVDISPINFOW, FAR *LPNMTVDISPINFOW;
# 3387 "/pgcc/include/commctrl.h"
typedef struct tagTVKEYDOWN {
    NMHDR hdr;
    WORD wVKey;
    UINT flags;
} NMTVKEYDOWN, FAR *LPNMTVKEYDOWN;
# 3421 "/pgcc/include/commctrl.h"
typedef struct tagNMTVCUSTOMDRAW
{
    NMCUSTOMDRAW nmcd;
    COLORREF clrText;
    COLORREF clrTextBk;
} NMTVCUSTOMDRAW, *LPNMTVCUSTOMDRAW;
# 3531 "/pgcc/include/commctrl.h"
typedef struct tagTCITEMHEADERA
{
    UINT mask;
    UINT lpReserved1;
    UINT lpReserved2;
    LPSTR pszText;
    int cchTextMax;
    int iImage;
} TCITEMHEADERA, FAR *LPTCITEMHEADERA;

typedef struct tagTCITEMHEADERW
{
    UINT mask;
    UINT lpReserved1;
    UINT lpReserved2;
    LPWSTR pszText;
    int cchTextMax;
    int iImage;
} TCITEMHEADERW, FAR *LPTCITEMHEADERW;
# 3571 "/pgcc/include/commctrl.h"
typedef struct tagTCITEMA
{
    UINT mask;

    DWORD dwState;
    DWORD dwStateMask;




    LPSTR pszText;
    int cchTextMax;
    int iImage;

    LPARAM lParam;
} TCITEMA, FAR *LPTCITEMA;

typedef struct tagTCITEMW
{
    UINT mask;

    DWORD dwState;
    DWORD dwStateMask;




    LPWSTR pszText;
    int cchTextMax;
    int iImage;

    LPARAM lParam;
} TCITEMW, FAR *LPTCITEMW;
# 3692 "/pgcc/include/commctrl.h"
typedef struct tagTCHITTESTINFO
{
    POINT pt;
    UINT flags;
} TCHITTESTINFO, FAR * LPTCHITTESTINFO;
# 3776 "/pgcc/include/commctrl.h"
typedef struct tagTCKEYDOWN
{
    NMHDR hdr;
    WORD wVKey;
    UINT flags;
} NMTCKEYDOWN;
# 3805 "/pgcc/include/commctrl.h"
typedef DWORD MONTHDAYSTATE, FAR * LPMONTHDAYSTATE;
# 3900 "/pgcc/include/commctrl.h"
typedef struct {
        UINT cbSize;
        POINT pt;

        UINT uHit;
        SYSTEMTIME st;
} MCHITTESTINFO, *PMCHITTESTINFO;
# 3984 "/pgcc/include/commctrl.h"
typedef struct tagNMSELCHANGE
{
    NMHDR nmhdr;

    SYSTEMTIME stSelStart;
    SYSTEMTIME stSelEnd;
} NMSELCHANGE, FAR * LPNMSELCHANGE;
# 4001 "/pgcc/include/commctrl.h"
typedef struct tagNMDAYSTATE
{
    NMHDR nmhdr;

    SYSTEMTIME stStart;
    int cDayState;

    LPMONTHDAYSTATE prgDayState;
} NMDAYSTATE, FAR * LPNMDAYSTATE;





typedef NMSELCHANGE NMSELECT, FAR * LPNMSELECT;
# 4136 "/pgcc/include/commctrl.h"
typedef struct tagNMDATETIMECHANGE
{
    NMHDR nmhdr;
    DWORD dwFlags;
    SYSTEMTIME st;
} NMDATETIMECHANGE, FAR * LPNMDATETIMECHANGE;



typedef struct tagNMDATETIMESTRINGA
{
    NMHDR nmhdr;
    LPCSTR pszUserString;
    SYSTEMTIME st;
    DWORD dwFlags;
} NMDATETIMESTRINGA, FAR * LPNMDATETIMESTRINGA;

typedef struct tagNMDATETIMESTRINGW
{
    NMHDR nmhdr;
    LPCWSTR pszUserString;
    SYSTEMTIME st;
    DWORD dwFlags;
} NMDATETIMESTRINGW, FAR * LPNMDATETIMESTRINGW;
# 4174 "/pgcc/include/commctrl.h"
typedef struct tagNMDATETIMEWMKEYDOWNA
{
    NMHDR nmhdr;
    int nVirtKey;
    LPCSTR pszFormat;
    SYSTEMTIME st;
} NMDATETIMEWMKEYDOWNA, FAR * LPNMDATETIMEWMKEYDOWNA;

typedef struct tagNMDATETIMEWMKEYDOWNW
{
    NMHDR nmhdr;
    int nVirtKey;
    LPCWSTR pszFormat;
    SYSTEMTIME st;
} NMDATETIMEWMKEYDOWNW, FAR * LPNMDATETIMEWMKEYDOWNW;
# 4203 "/pgcc/include/commctrl.h"
typedef struct tagNMDATETIMEFORMATA
{
    NMHDR nmhdr;
    LPCSTR pszFormat;
    SYSTEMTIME st;
    LPCSTR pszDisplay;
    CHAR szDisplay[64];
} NMDATETIMEFORMATA, FAR * LPNMDATETIMEFORMATA;

typedef struct tagNMDATETIMEFORMATW
{
    NMHDR nmhdr;
    LPCWSTR pszFormat;
    SYSTEMTIME st;
    LPCWSTR pszDisplay;
    WCHAR szDisplay[64];
} NMDATETIMEFORMATW, FAR * LPNMDATETIMEFORMATW;
# 4234 "/pgcc/include/commctrl.h"
typedef struct tagNMDATETIMEFORMATQUERYA
{
    NMHDR nmhdr;
    LPCSTR pszFormat;
    SIZE szMax;
} NMDATETIMEFORMATQUERYA, FAR * LPNMDATETIMEFORMATQUERYA;

typedef struct tagNMDATETIMEFORMATQUERYW
{
    NMHDR nmhdr;
    LPCWSTR pszFormat;
    SIZE szMax;
} NMDATETIMEFORMATQUERYW, FAR * LPNMDATETIMEFORMATQUERYW;
# 2 "/src/pvis/main/pvis.rc" 2
# 1 "/pgcc/include/winuser.h" 1
# 17 "/pgcc/include/winuser.h"
# 1 "/pgcc/include/windef.h" 1
# 23 "/pgcc/include/windef.h"
 typedef unsigned long ULONG;
 typedef ULONG *PULONG;
 typedef unsigned short USHORT;
 typedef USHORT *PUSHORT;
 typedef unsigned char UCHAR;
 typedef UCHAR *PUCHAR;
 typedef char *PSZ;
# 89 "/pgcc/include/windef.h"
typedef unsigned long DWORD;
typedef short BOOL;
typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef float FLOAT;
typedef FLOAT *PFLOAT;
typedef BOOL *PBOOL;
typedef BOOL *LPBOOL;
typedef BYTE *PBYTE;
typedef BYTE *LPBYTE;
typedef int *PINT;
typedef int *LPINT;
typedef WORD *PWORD;
typedef WORD *LPWORD;
typedef long *LPLONG;
typedef DWORD *PDWORD;
typedef DWORD *LPDWORD;
typedef short *LPSHORT;
typedef void *LPVOID;
typedef const void *LPCVOID;

typedef int INT;
typedef unsigned int UINT;
typedef unsigned int *PUINT;


# 1 "/pgcc/include/winnt.h" 1
# 26 "/pgcc/include/winnt.h"
 typedef __builtin_size_t size_t;






# 1 "/pgcc/include/ctype.h" 1
# 20 "/pgcc/include/ctype.h"
   typedef unsigned short wchar_t;





 typedef wchar_t wint_t;
 typedef wchar_t wctype_t;



extern const unsigned short _ctype[];
extern const unsigned short *_pctype;
extern const wctype_t *_pwctype;
# 45 "/pgcc/include/ctype.h"
 int iswctype(wint_t, wctype_t);
 wchar_t towupper(wchar_t);
 wchar_t towlower(wchar_t);

 int _isctype(int, int);
# 34 "/pgcc/include/winnt.h" 2
# 54 "/pgcc/include/winnt.h"
# 1 "/pgcc/include/basetsd.h" 1
# 24 "/pgcc/include/basetsd.h"
typedef int LONG32, *PLONG32;
typedef int INT32, *PINT32;
typedef unsigned int ULONG32, *PULONG32;
typedef unsigned int DWORD32, *PDWORD32;
typedef unsigned int UINT32, *PUINT32;
typedef int INT_PTR, *PINT_PTR;
typedef unsigned int UINT_PTR, *PUINT_PTR;
typedef long LONG_PTR, *PLONG_PTR;
typedef unsigned long ULONG_PTR, *PULONG_PTR;
typedef unsigned short UHALF_PTR, *PUHALF_PTR;
typedef short HALF_PTR, *PHALF_PTR;
# 55 "/pgcc/include/basetsd.h"
typedef ULONG_PTR SIZE_T, *PSIZE_T;
typedef LONG_PTR SSIZE_T, *PSSIZE_T;
typedef ULONG_PTR DWORD_PTR, *PDWORD_PTR;
typedef long long LONG64, *PLONG64;
typedef long long INT64, *PINT64;
typedef unsigned long long ULONG64, *PULONG64;
typedef unsigned long long DWORD64, *PDWORD64;
typedef unsigned long long UINT64, *PUINT64;
# 55 "/pgcc/include/winnt.h" 2



typedef void *PVOID;
typedef void *PVOID64;







 typedef char CHAR;
 typedef short SHORT;
 typedef long LONG;


typedef wchar_t WCHAR;
typedef WCHAR *PWCHAR;
typedef WCHAR *LPWCH, *PWCH;
typedef const WCHAR *LPCWCH, *PCWCH;
typedef WCHAR *NWPSTR;
typedef WCHAR *LPWSTR, *PWSTR;
typedef const WCHAR *LPCWSTR, *PCWSTR;
typedef CHAR *PCHAR;
typedef CHAR *LPCH, *PCH;
typedef const CHAR *LPCCH, *PCCH;
typedef CHAR *NPSTR;
typedef CHAR *LPSTR, *PSTR;
typedef const CHAR *LPCSTR, *PCSTR;



  typedef WCHAR TCHAR, *PTCHAR;
  typedef WCHAR TBYTE, *PTBYTE;
  typedef wchar_t _TCHAR;
  typedef wchar_t _TSCHAR;
  typedef wchar_t _TUCHAR;
  typedef wchar_t _TXCHAR;
  typedef wint_t _TINT;



 typedef LPWSTR LPTCH, PTCH;
 typedef LPWSTR PTSTR, LPTSTR;
 typedef LPCWSTR PCTSTR, LPCTSTR;
 typedef LPWSTR LP;
# 118 "/pgcc/include/winnt.h"
typedef SHORT *PSHORT;
typedef LONG *PLONG;

typedef void *HANDLE;

typedef HANDLE *PHANDLE;

typedef BYTE FCHAR;
typedef WORD FSHORT;
typedef DWORD FLONG;
# 153 "/pgcc/include/winnt.h"
typedef char CCHAR;
typedef DWORD LCID;

typedef PDWORD PLCID;
typedef WORD LANGID;






typedef struct _FLOAT128 {
    long long LowPart;
    long long HighPart;
} FLOAT128;

typedef FLOAT128 *PFLOAT128;


typedef long long LONGLONG;
typedef unsigned long long ULONGLONG;

typedef LONGLONG *PLONGLONG;
typedef ULONGLONG *PULONGLONG;

typedef LONGLONG USN;

typedef union _LARGE_INTEGER {
    struct {
        DWORD LowPart;
        LONG HighPart;
    };
    struct {
        DWORD LowPart;
        LONG HighPart;
    } u;
    LONGLONG QuadPart;
} LARGE_INTEGER;

typedef LARGE_INTEGER *PLARGE_INTEGER;

typedef union _ULARGE_INTEGER {
    struct {
        DWORD LowPart;
        DWORD HighPart;
    };
    struct {
        DWORD LowPart;
        DWORD HighPart;
    } u;
    ULONGLONG QuadPart;
} ULARGE_INTEGER;
typedef ULARGE_INTEGER *PULARGE_INTEGER;

typedef struct _LUID {
    DWORD LowPart;
    LONG HighPart;
} LUID, *PLUID;


typedef ULONGLONG DWORDLONG;
typedef DWORDLONG *PDWORDLONG;
# 225 "/pgcc/include/winnt.h"
typedef BYTE BOOLEAN;
typedef BOOLEAN *PBOOLEAN;

typedef struct _LIST_ENTRY {
   struct _LIST_ENTRY *Flink;
   struct _LIST_ENTRY *Blink;
} LIST_ENTRY, *PLIST_ENTRY, * PRLIST_ENTRY;

typedef struct _SINGLE_LIST_ENTRY {
    struct _SINGLE_LIST_ENTRY *Next;
} SINGLE_LIST_ENTRY, *PSINGLE_LIST_ENTRY;



 typedef struct _GUID {
    DWORD Data1;
    WORD Data2;
    WORD Data3;
    BYTE Data4[8];
 } GUID;




 typedef struct _OBJECTID {
    GUID Lineage;
    DWORD Uniquifier;
 } OBJECTID;
# 533 "/pgcc/include/winnt.h"
 typedef struct _CONTEXT {
    ULONG ContextFlags;

    ULONG R0;
    ULONG R1;
    ULONG R2;
    ULONG R3;
    ULONG R4;
    ULONG R5;
    ULONG R6;
    ULONG R7;
    ULONG R8;
    ULONG R9;
    ULONG R10;
    ULONG R11;
    ULONG R12;

    ULONG Sp;
    ULONG Lr;
    ULONG Pc;
    ULONG Psr;
 } CONTEXT;
 typedef CONTEXT *PCONTEXT;
# 574 "/pgcc/include/winnt.h"
typedef struct _EXCEPTION_RECORD {
    DWORD ExceptionCode;
    DWORD ExceptionFlags;
    struct _EXCEPTION_RECORD *ExceptionRecord;
    PVOID ExceptionAddress;
    DWORD NumberParameters;
    ULONG_PTR ExceptionInformation[15];
} EXCEPTION_RECORD;
typedef EXCEPTION_RECORD *PEXCEPTION_RECORD;

typedef struct _EXCEPTION_POINTERS {
    PEXCEPTION_RECORD ExceptionRecord;
    PCONTEXT ContextRecord;
} EXCEPTION_POINTERS, *PEXCEPTION_POINTERS;

typedef PVOID PACCESS_TOKEN;
typedef PVOID PSECURITY_DESCRIPTOR;
typedef PVOID PSID;
typedef DWORD ACCESS_MASK;
typedef ACCESS_MASK *PACCESS_MASK;
# 613 "/pgcc/include/winnt.h"
typedef struct _GENERIC_MAPPING {
    ACCESS_MASK GenericRead;
    ACCESS_MASK GenericWrite;
    ACCESS_MASK GenericExecute;
    ACCESS_MASK GenericAll;
} GENERIC_MAPPING;
typedef GENERIC_MAPPING *PGENERIC_MAPPING;

# 1 "/pgcc/include/pshpack4.h" 1
# 30 "/pgcc/include/pshpack4.h"
#pragma pack(4)
# 622 "/pgcc/include/winnt.h" 2

typedef struct _LUID_AND_ATTRIBUTES {
    LUID Luid;
    DWORD Attributes;
    } LUID_AND_ATTRIBUTES, * PLUID_AND_ATTRIBUTES;
typedef LUID_AND_ATTRIBUTES LUID_AND_ATTRIBUTES_ARRAY[1];
typedef LUID_AND_ATTRIBUTES_ARRAY *PLUID_AND_ATTRIBUTES_ARRAY;

# 1 "/pgcc/include/poppack.h" 1
# 34 "/pgcc/include/poppack.h"
#pragma pack()
# 631 "/pgcc/include/winnt.h" 2



 typedef struct _SID_IDENTIFIER_AUTHORITY {
    BYTE Value[6];
 } SID_IDENTIFIER_AUTHORITY, *PSID_IDENTIFIER_AUTHORITY;





 typedef struct _SID {
   BYTE Revision;
   BYTE SubAuthorityCount;
   SID_IDENTIFIER_AUTHORITY IdentifierAuthority;
   DWORD SubAuthority[1];
 } SID, *PISID;






typedef enum _SID_NAME_USE {
    SidTypeUser = 1,
    SidTypeGroup,
    SidTypeDomain,
    SidTypeAlias,
    SidTypeWellKnownGroup,
    SidTypeDeletedAccount,
    SidTypeInvalid,
    SidTypeUnknown,
    SidTypeComputer
} SID_NAME_USE, *PSID_NAME_USE;

typedef struct _SID_AND_ATTRIBUTES {
    PSID Sid;
    DWORD Attributes;
    } SID_AND_ATTRIBUTES, * PSID_AND_ATTRIBUTES;

typedef SID_AND_ATTRIBUTES SID_AND_ATTRIBUTES_ARRAY[1];
typedef SID_AND_ATTRIBUTES_ARRAY *PSID_AND_ATTRIBUTES_ARRAY;
# 745 "/pgcc/include/winnt.h"
typedef struct _ACL {
    BYTE AclRevision;
    BYTE Sbz1;
    WORD AclSize;
    WORD AceCount;
    WORD Sbz2;
} ACL;
typedef ACL *PACL;

typedef struct _ACE_HEADER {
    BYTE AceType;
    BYTE AceFlags;
    WORD AceSize;
} ACE_HEADER;
typedef ACE_HEADER *PACE_HEADER;
# 786 "/pgcc/include/winnt.h"
typedef struct _ACCESS_ALLOWED_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} ACCESS_ALLOWED_ACE;
typedef ACCESS_ALLOWED_ACE *PACCESS_ALLOWED_ACE;

typedef struct _ACCESS_DENIED_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} ACCESS_DENIED_ACE;
typedef ACCESS_DENIED_ACE *PACCESS_DENIED_ACE;

typedef struct _SYSTEM_AUDIT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} SYSTEM_AUDIT_ACE;
typedef SYSTEM_AUDIT_ACE *PSYSTEM_AUDIT_ACE;

typedef struct _SYSTEM_ALARM_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} SYSTEM_ALARM_ACE;
typedef SYSTEM_ALARM_ACE *PSYSTEM_ALARM_ACE;

typedef struct _ACCESS_ALLOWED_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} ACCESS_ALLOWED_OBJECT_ACE, *PACCESS_ALLOWED_OBJECT_ACE;

typedef struct _ACCESS_DENIED_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} ACCESS_DENIED_OBJECT_ACE, *PACCESS_DENIED_OBJECT_ACE;

typedef struct _SYSTEM_AUDIT_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} SYSTEM_AUDIT_OBJECT_ACE, *PSYSTEM_AUDIT_OBJECT_ACE;

typedef struct _SYSTEM_ALARM_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} SYSTEM_ALARM_OBJECT_ACE, *PSYSTEM_ALARM_OBJECT_ACE;




typedef enum _ACL_INFORMATION_CLASS {
    AclRevisionInformation = 1,
    AclSizeInformation
} ACL_INFORMATION_CLASS;

typedef struct _ACL_REVISION_INFORMATION {
    DWORD AclRevision;
} ACL_REVISION_INFORMATION;
typedef ACL_REVISION_INFORMATION *PACL_REVISION_INFORMATION;

typedef struct _ACL_SIZE_INFORMATION {
    DWORD AceCount;
    DWORD AclBytesInUse;
    DWORD AclBytesFree;
} ACL_SIZE_INFORMATION;
typedef ACL_SIZE_INFORMATION *PACL_SIZE_INFORMATION;





typedef WORD SECURITY_DESCRIPTOR_CONTROL, *PSECURITY_DESCRIPTOR_CONTROL;
# 890 "/pgcc/include/winnt.h"
typedef struct _SECURITY_DESCRIPTOR_RELATIVE {
    BYTE Revision;
    BYTE Sbz1;
    SECURITY_DESCRIPTOR_CONTROL Control;
    DWORD Owner;
    DWORD Group;
    DWORD Sacl;
    DWORD Dacl;
    } SECURITY_DESCRIPTOR_RELATIVE, *PISECURITY_DESCRIPTOR_RELATIVE;

typedef struct _SECURITY_DESCRIPTOR {
   BYTE Revision;
   BYTE Sbz1;
   SECURITY_DESCRIPTOR_CONTROL Control;
   PSID Owner;
   PSID Group;
   PACL Sacl;
   PACL Dacl;

   } SECURITY_DESCRIPTOR, *PISECURITY_DESCRIPTOR;

typedef struct _OBJECT_TYPE_LIST {
    WORD Level;
    WORD Sbz;
    GUID *ObjectType;
} OBJECT_TYPE_LIST, *POBJECT_TYPE_LIST;






typedef enum _AUDIT_EVENT_TYPE {
    AuditEventObjectAccess,
    AuditEventDirectoryServiceAccess
} AUDIT_EVENT_TYPE, *PAUDIT_EVENT_TYPE;
# 937 "/pgcc/include/winnt.h"
typedef struct _PRIVILEGE_SET {
    DWORD PrivilegeCount;
    DWORD Control;
    LUID_AND_ATTRIBUTES Privilege[1];
    } PRIVILEGE_SET, * PPRIVILEGE_SET;
# 968 "/pgcc/include/winnt.h"
typedef enum _SECURITY_IMPERSONATION_LEVEL {
    SecurityAnonymous,
    SecurityIdentification,
    SecurityImpersonation,
    SecurityDelegation
} SECURITY_IMPERSONATION_LEVEL, * PSECURITY_IMPERSONATION_LEVEL;
# 1008 "/pgcc/include/winnt.h"
typedef enum _TOKEN_TYPE {
    TokenPrimary = 1,
    TokenImpersonation
    } TOKEN_TYPE;
typedef TOKEN_TYPE *PTOKEN_TYPE;

typedef enum _TOKEN_INFORMATION_CLASS {
    TokenUser = 1,
    TokenGroups,
    TokenPrivileges,
    TokenOwner,
    TokenPrimaryGroup,
    TokenDefaultDacl,
    TokenSource,
    TokenType,
    TokenImpersonationLevel,
    TokenStatistics,
    TokenRestrictedSids,
    TokenSessionId
} TOKEN_INFORMATION_CLASS, *PTOKEN_INFORMATION_CLASS;

typedef struct _TOKEN_USER {
    SID_AND_ATTRIBUTES User;
} TOKEN_USER, *PTOKEN_USER;

typedef struct _TOKEN_GROUPS {
    DWORD GroupCount;
    SID_AND_ATTRIBUTES Groups[1];
} TOKEN_GROUPS, *PTOKEN_GROUPS;

typedef struct _TOKEN_PRIVILEGES {
    DWORD PrivilegeCount;
    LUID_AND_ATTRIBUTES Privileges[1];
} TOKEN_PRIVILEGES, *PTOKEN_PRIVILEGES;

typedef struct _TOKEN_OWNER {
    PSID Owner;
} TOKEN_OWNER, *PTOKEN_OWNER;

typedef struct _TOKEN_PRIMARY_GROUP {
    PSID PrimaryGroup;
} TOKEN_PRIMARY_GROUP, *PTOKEN_PRIMARY_GROUP;

typedef struct _TOKEN_DEFAULT_DACL {
    PACL DefaultDacl;
} TOKEN_DEFAULT_DACL, *PTOKEN_DEFAULT_DACL;



typedef struct _TOKEN_SOURCE {
    CHAR SourceName[8];
    LUID SourceIdentifier;
} TOKEN_SOURCE, *PTOKEN_SOURCE;

typedef struct _TOKEN_STATISTICS {
    LUID TokenId;
    LUID AuthenticationId;
    LARGE_INTEGER ExpirationTime;
    TOKEN_TYPE TokenType;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    DWORD DynamicCharged;
    DWORD DynamicAvailable;
    DWORD GroupCount;
    DWORD PrivilegeCount;
    LUID ModifiedId;
} TOKEN_STATISTICS, *PTOKEN_STATISTICS;

typedef struct _TOKEN_CONTROL {
    LUID TokenId;
    LUID AuthenticationId;
    LUID ModifiedId;
    TOKEN_SOURCE TokenSource;
    } TOKEN_CONTROL, *PTOKEN_CONTROL;




typedef BOOLEAN SECURITY_CONTEXT_TRACKING_MODE,
                    * PSECURITY_CONTEXT_TRACKING_MODE;

typedef struct _SECURITY_QUALITY_OF_SERVICE {
    DWORD Length;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    SECURITY_CONTEXT_TRACKING_MODE ContextTrackingMode;
    BOOLEAN EffectiveOnly;
    } SECURITY_QUALITY_OF_SERVICE, * PSECURITY_QUALITY_OF_SERVICE;

typedef struct _SE_IMPERSONATION_STATE {
    PACCESS_TOKEN Token;
    BOOLEAN CopyOnOpen;
    BOOLEAN EffectiveOnly;
    SECURITY_IMPERSONATION_LEVEL Level;
} SE_IMPERSONATION_STATE, *PSE_IMPERSONATION_STATE;


typedef DWORD SECURITY_INFORMATION, *PSECURITY_INFORMATION;
# 1144 "/pgcc/include/winnt.h"
typedef struct _NT_TIB {
    struct _EXCEPTION_REGISTRATION_RECORD *ExceptionList;
    PVOID StackBase;
    PVOID StackLimit;
    PVOID SubSystemTib;
    union {
        PVOID FiberData;
        DWORD Version;
    };
    PVOID ArbitraryUserPointer;
    struct _NT_TIB *Self;
} NT_TIB;
typedef NT_TIB *PNT_TIB;
# 1165 "/pgcc/include/winnt.h"
typedef struct _QUOTA_LIMITS {
    SIZE_T PagedPoolLimit;
    SIZE_T NonPagedPoolLimit;
    SIZE_T MinimumWorkingSetSize;
    SIZE_T MaximumWorkingSetSize;
    SIZE_T PagefileLimit;
    LARGE_INTEGER TimeLimit;
} QUOTA_LIMITS;
typedef QUOTA_LIMITS *PQUOTA_LIMITS;

typedef struct _JOBOBJECT_BASIC_ACCOUNTING_INFORMATION {
    LARGE_INTEGER TotalUserTime;
    LARGE_INTEGER TotalKernelTime;
    LARGE_INTEGER ThisPeriodTotalUserTime;
    LARGE_INTEGER ThisPeriodTotalKernelTime;
    DWORD TotalPageFaultCount;
    DWORD TotalProcesses;
    DWORD ActiveProcesses;
    DWORD TotalTerminatedProcesses;
} JOBOBJECT_BASIC_ACCOUNTING_INFORMATION, *PJOBOBJECT_BASIC_ACCOUNTING_INFORMATION;

typedef struct _JOBOBJECT_BASIC_LIMIT_INFORMATION {
    LARGE_INTEGER PerProcessUserTimeLimit;
    LARGE_INTEGER PerJobUserTimeLimit;
    DWORD LimitFlags;
    SIZE_T MinimumWorkingSetSize;
    SIZE_T MaximumWorkingSetSize;
    DWORD ActiveProcessLimit;
    DWORD Affinity;
    DWORD PriorityClass;
    DWORD SchedulingClass;
} JOBOBJECT_BASIC_LIMIT_INFORMATION, *PJOBOBJECT_BASIC_LIMIT_INFORMATION;

typedef struct _JOBOBJECT_BASIC_PROCESS_ID_LIST {
    DWORD NumberOfAssignedProcesses;
    DWORD NumberOfProcessIdsInList;
    ULONG_PTR ProcessIdList[1];
} JOBOBJECT_BASIC_PROCESS_ID_LIST, *PJOBOBJECT_BASIC_PROCESS_ID_LIST;

typedef struct _JOBOBJECT_BASIC_UI_RESTRICTIONS {
    DWORD UIRestrictionsClass;
} JOBOBJECT_BASIC_UI_RESTRICTIONS, *PJOBOBJECT_BASIC_UI_RESTRICTIONS;

typedef struct _JOBOBJECT_SECURITY_LIMIT_INFORMATION {
    DWORD SecurityLimitFlags ;
    HANDLE JobToken ;
    PTOKEN_GROUPS SidsToDisable ;
    PTOKEN_PRIVILEGES PrivilegesToDelete ;
    PTOKEN_GROUPS RestrictedSids ;
} JOBOBJECT_SECURITY_LIMIT_INFORMATION, *PJOBOBJECT_SECURITY_LIMIT_INFORMATION ;

typedef struct _JOBOBJECT_END_OF_JOB_TIME_INFORMATION {
    DWORD EndOfJobTimeAction;
} JOBOBJECT_END_OF_JOB_TIME_INFORMATION, *PJOBOBJECT_END_OF_JOB_TIME_INFORMATION;

typedef struct _JOBOBJECT_ASSOCIATE_COMPLETION_PORT {
    PVOID CompletionKey;
    HANDLE CompletionPort;
} JOBOBJECT_ASSOCIATE_COMPLETION_PORT, *PJOBOBJECT_ASSOCIATE_COMPLETION_PORT;
# 1259 "/pgcc/include/winnt.h"
typedef enum _JOBOBJECTINFOCLASS {
    JobObjectBasicAccountingInformation = 1,
    JobObjectBasicLimitInformation,
    JobObjectBasicProcessIdList,
    JobObjectBasicUIRestrictions,
    JobObjectSecurityLimitInformation,
    JobObjectEndOfJobTimeInformation,
    JobObjectAssociateCompletionPortInformation,
    MaxJobObjectInfoClass
    } JOBOBJECTINFOCLASS;
# 1328 "/pgcc/include/winnt.h"
typedef struct _MEMORY_BASIC_INFORMATION {
    PVOID BaseAddress;
    PVOID AllocationBase;
    DWORD AllocationProtect;
    SIZE_T RegionSize;
    DWORD State;
    DWORD Protect;
    DWORD Type;
} MEMORY_BASIC_INFORMATION, *PMEMORY_BASIC_INFORMATION;

typedef struct _MEMORY_BASIC_INFORMATION_VLM {
    union {
        PVOID64 BaseAddress;
        ULONGLONG BaseAddressAsUlongLong;
    };
    union {
        PVOID64 AllocationBase;
        ULONGLONG AllocationBaseAsUlongLong;
    };
    ULONGLONG RegionSize;
    DWORD AllocationProtect;
    DWORD State;
    DWORD Protect;
    DWORD Type;
} MEMORY_BASIC_INFORMATION_VLM, *PMEMORY_BASIC_INFORMATION_VLM;
# 1473 "/pgcc/include/winnt.h"
typedef struct _FILE_NOTIFY_INFORMATION {
    DWORD NextEntryOffset;
    DWORD Action;
    DWORD FileNameLength;
    WCHAR FileName[1];
} FILE_NOTIFY_INFORMATION, *PFILE_NOTIFY_INFORMATION;

typedef union _FILE_SEGMENT_ELEMENT {
    PVOID64 Buffer;
    ULONGLONG Alignment;
}FILE_SEGMENT_ELEMENT, *PFILE_SEGMENT_ELEMENT;

typedef struct _REPARSE_DATA_BUFFER {
    DWORD ReparseTag;
    WORD ReparseDataLength;
    WORD Reserved;
    union {
        struct {
            WORD SubstituteNameOffset;
            WORD SubstituteNameLength;
            WORD PrintNameOffset;
            WORD PrintNameLength;
            WCHAR PathBuffer[1];
        } SymbolicLinkReparseBuffer;
        struct {
            WORD SubstituteNameOffset;
            WORD SubstituteNameLength;
            WORD PrintNameOffset;
            WORD PrintNameLength;
            WCHAR PathBuffer[1];
        } MountPointReparseBuffer;
        struct {
            BYTE DataBuffer[1];
        } GenericReparseBuffer;
    };
} REPARSE_DATA_BUFFER, *PREPARSE_DATA_BUFFER;



typedef struct _REPARSE_GUID_DATA_BUFFER {
    DWORD ReparseTag;
    WORD ReparseDataLength;
    WORD Reserved;
    GUID ReparseGuid;
    struct {
        BYTE DataBuffer[1];
    } GenericReparseBuffer;
} REPARSE_GUID_DATA_BUFFER, *PREPARSE_GUID_DATA_BUFFER;



typedef struct _REPARSE_POINT_INFORMATION {
    WORD ReparseDataLength;
    WORD UnparsedNameLength;
} REPARSE_POINT_INFORMATION, *PREPARSE_POINT_INFORMATION;
# 1569 "/pgcc/include/winnt.h"
typedef DWORD EXECUTION_STATE;

typedef enum {
    LT_DONT_CARE,
    LT_LOWEST_LATENCY
} LATENCY_TIME;

typedef struct _POWER_DEVICE_TIMEOUTS {
    DWORD ConservationIdleTime;
    DWORD PerformanceIdleTime;
} POWER_DEVICE_TIMEOUTS, *PPOWER_DEVICE_TIMEOUTS;

# 1 "/pgcc/include/pshpack4.h" 1
# 30 "/pgcc/include/pshpack4.h"
#pragma pack(4)
# 1582 "/pgcc/include/winnt.h" 2





# 1 "/pgcc/include/pshpack2.h" 1
# 30 "/pgcc/include/pshpack2.h"
#pragma pack(2)
# 1588 "/pgcc/include/winnt.h" 2

typedef struct _IMAGE_DOS_HEADER {
    WORD e_magic;
    WORD e_cblp;
    WORD e_cp;
    WORD e_crlc;
    WORD e_cparhdr;
    WORD e_minalloc;
    WORD e_maxalloc;
    WORD e_ss;
    WORD e_sp;
    WORD e_csum;
    WORD e_ip;
    WORD e_cs;
    WORD e_lfarlc;
    WORD e_ovno;
    WORD e_res[4];
    WORD e_oemid;
    WORD e_oeminfo;
    WORD e_res2[10];
    LONG e_lfanew;
  } IMAGE_DOS_HEADER, *PIMAGE_DOS_HEADER;

typedef struct _IMAGE_OS2_HEADER {
    WORD ne_magic;
    CHAR ne_ver;
    CHAR ne_rev;
    WORD ne_enttab;
    WORD ne_cbenttab;
    LONG ne_crc;
    WORD ne_flags;
    WORD ne_autodata;
    WORD ne_heap;
    WORD ne_stack;
    LONG ne_csip;
    LONG ne_sssp;
    WORD ne_cseg;
    WORD ne_cmod;
    WORD ne_cbnrestab;
    WORD ne_segtab;
    WORD ne_rsrctab;
    WORD ne_restab;
    WORD ne_modtab;
    WORD ne_imptab;
    LONG ne_nrestab;
    WORD ne_cmovent;
    WORD ne_align;
    WORD ne_cres;
    BYTE ne_exetyp;
    BYTE ne_flagsothers;
    WORD ne_pretthunks;
    WORD ne_psegrefbytes;
    WORD ne_swaparea;
    WORD ne_expver;
  } IMAGE_OS2_HEADER, *PIMAGE_OS2_HEADER;

typedef struct _IMAGE_VXD_HEADER {
    WORD e32_magic;
    BYTE e32_border;
    BYTE e32_worder;
    DWORD e32_level;
    WORD e32_cpu;
    WORD e32_os;
    DWORD e32_ver;
    DWORD e32_mflags;
    DWORD e32_mpages;
    DWORD e32_startobj;
    DWORD e32_eip;
    DWORD e32_stackobj;
    DWORD e32_esp;
    DWORD e32_pagesize;
    DWORD e32_lastpagesize;
    DWORD e32_fixupsize;
    DWORD e32_fixupsum;
    DWORD e32_ldrsize;
    DWORD e32_ldrsum;
    DWORD e32_objtab;
    DWORD e32_objcnt;
    DWORD e32_objmap;
    DWORD e32_itermap;
    DWORD e32_rsrctab;
    DWORD e32_rsrccnt;
    DWORD e32_restab;
    DWORD e32_enttab;
    DWORD e32_dirtab;
    DWORD e32_dircnt;
    DWORD e32_fpagetab;
    DWORD e32_frectab;
    DWORD e32_impmod;
    DWORD e32_impmodcnt;
    DWORD e32_impproc;
    DWORD e32_pagesum;
    DWORD e32_datapage;
    DWORD e32_preload;
    DWORD e32_nrestab;
    DWORD e32_cbnrestab;
    DWORD e32_nressum;
    DWORD e32_autodata;
    DWORD e32_debuginfo;
    DWORD e32_debuglen;
    DWORD e32_instpreload;
    DWORD e32_instdemand;
    DWORD e32_heapsize;
    BYTE e32_res3[12];
    DWORD e32_winresoff;
    DWORD e32_winreslen;
    WORD e32_devid;
    WORD e32_ddkver;
  } IMAGE_VXD_HEADER, *PIMAGE_VXD_HEADER;

# 1 "/pgcc/include/poppack.h" 1
# 34 "/pgcc/include/poppack.h"
#pragma pack()
# 1699 "/pgcc/include/winnt.h" 2

typedef struct _IMAGE_FILE_HEADER {
    WORD Machine;
    WORD NumberOfSections;
    DWORD TimeDateStamp;
    DWORD PointerToSymbolTable;
    DWORD NumberOfSymbols;
    WORD SizeOfOptionalHeader;
    WORD Characteristics;
} IMAGE_FILE_HEADER, *PIMAGE_FILE_HEADER;
# 1748 "/pgcc/include/winnt.h"
typedef struct _IMAGE_DATA_DIRECTORY {
    DWORD VirtualAddress;
    DWORD Size;
} IMAGE_DATA_DIRECTORY, *PIMAGE_DATA_DIRECTORY;



typedef struct _IMAGE_OPTIONAL_HEADER {
    WORD Magic;
    BYTE MajorLinkerVersion;
    BYTE MinorLinkerVersion;
    DWORD SizeOfCode;
    DWORD SizeOfInitializedData;
    DWORD SizeOfUninitializedData;
    DWORD AddressOfEntryPoint;
    DWORD BaseOfCode;
    DWORD BaseOfData;
    DWORD ImageBase;
    DWORD SectionAlignment;
    DWORD FileAlignment;
    WORD MajorOperatingSystemVersion;
    WORD MinorOperatingSystemVersion;
    WORD MajorImageVersion;
    WORD MinorImageVersion;
    WORD MajorSubsystemVersion;
    WORD MinorSubsystemVersion;
    DWORD Win32VersionValue;
    DWORD SizeOfImage;
    DWORD SizeOfHeaders;
    DWORD CheckSum;
    WORD Subsystem;
    WORD DllCharacteristics;
    DWORD SizeOfStackReserve;
    DWORD SizeOfStackCommit;
    DWORD SizeOfHeapReserve;
    DWORD SizeOfHeapCommit;
    DWORD LoaderFlags;
    DWORD NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[16];
} IMAGE_OPTIONAL_HEADER32, *PIMAGE_OPTIONAL_HEADER32;

typedef struct _IMAGE_ROM_OPTIONAL_HEADER {
    WORD Magic;
    BYTE MajorLinkerVersion;
    BYTE MinorLinkerVersion;
    DWORD SizeOfCode;
    DWORD SizeOfInitializedData;
    DWORD SizeOfUninitializedData;
    DWORD AddressOfEntryPoint;
    DWORD BaseOfCode;
    DWORD BaseOfData;
    DWORD BaseOfBss;
    DWORD GprMask;
    DWORD CprMask[4];
    DWORD GpValue;
} IMAGE_ROM_OPTIONAL_HEADER, *PIMAGE_ROM_OPTIONAL_HEADER;

typedef struct _IMAGE_OPTIONAL_HEADER64 {
    WORD Magic;
    BYTE MajorLinkerVersion;
    BYTE MinorLinkerVersion;
    DWORD SizeOfCode;
    DWORD SizeOfInitializedData;
    DWORD SizeOfUninitializedData;
    DWORD AddressOfEntryPoint;
    DWORD BaseOfCode;
    ULONGLONG ImageBase;
    DWORD SectionAlignment;
    DWORD FileAlignment;
    WORD MajorOperatingSystemVersion;
    WORD MinorOperatingSystemVersion;
    WORD MajorImageVersion;
    WORD MinorImageVersion;
    WORD MajorSubsystemVersion;
    WORD MinorSubsystemVersion;
    DWORD Win32VersionValue;
    DWORD SizeOfImage;
    DWORD SizeOfHeaders;
    DWORD CheckSum;
    WORD Subsystem;
    WORD DllCharacteristics;
    ULONGLONG SizeOfStackReserve;
    ULONGLONG SizeOfStackCommit;
    ULONGLONG SizeOfHeapReserve;
    ULONGLONG SizeOfHeapCommit;
    DWORD LoaderFlags;
    DWORD NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[16];
} IMAGE_OPTIONAL_HEADER64, *PIMAGE_OPTIONAL_HEADER64;
# 1847 "/pgcc/include/winnt.h"
typedef IMAGE_OPTIONAL_HEADER32 IMAGE_OPTIONAL_HEADER;
typedef PIMAGE_OPTIONAL_HEADER32 PIMAGE_OPTIONAL_HEADER;



typedef struct _IMAGE_NT_HEADERS64 {
    DWORD Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER64 OptionalHeader;
} IMAGE_NT_HEADERS64, *PIMAGE_NT_HEADERS64;

typedef struct _IMAGE_NT_HEADERS {
    DWORD Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER32 OptionalHeader;
} IMAGE_NT_HEADERS32, *PIMAGE_NT_HEADERS32;

typedef struct _IMAGE_ROM_HEADERS {
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_ROM_OPTIONAL_HEADER OptionalHeader;
} IMAGE_ROM_HEADERS, *PIMAGE_ROM_HEADERS;
# 1880 "/pgcc/include/winnt.h"
typedef IMAGE_NT_HEADERS32 IMAGE_NT_HEADERS;
typedef PIMAGE_NT_HEADERS32 PIMAGE_NT_HEADERS;
# 1913 "/pgcc/include/winnt.h"
typedef struct _IMAGE_SECTION_HEADER {
    BYTE Name[8];
    union {
            DWORD PhysicalAddress;
            DWORD VirtualSize;
    } Misc;
    DWORD VirtualAddress;
    DWORD SizeOfRawData;
    DWORD PointerToRawData;
    DWORD PointerToRelocations;
    DWORD PointerToLinenumbers;
    WORD NumberOfRelocations;
    WORD NumberOfLinenumbers;
    DWORD Characteristics;
} IMAGE_SECTION_HEADER, *PIMAGE_SECTION_HEADER;
# 1970 "/pgcc/include/winnt.h"
# 1 "/pgcc/include/pshpack2.h" 1
# 30 "/pgcc/include/pshpack2.h"
#pragma pack(2)
# 1971 "/pgcc/include/winnt.h" 2

typedef struct _IMAGE_SYMBOL {
    union {
        BYTE ShortName[8];
        struct {
            DWORD Short;
            DWORD Long;
        } Name;
        PBYTE LongName[2];
    } N;
    DWORD Value;
    SHORT SectionNumber;
    WORD Type;
    BYTE StorageClass;
    BYTE NumberOfAuxSymbols;
} IMAGE_SYMBOL;
typedef IMAGE_SYMBOL *PIMAGE_SYMBOL;
# 2073 "/pgcc/include/winnt.h"
typedef union _IMAGE_AUX_SYMBOL {
    struct {
        DWORD TagIndex;
        union {
            struct {
                WORD Linenumber;
                WORD Size;
            } LnSz;
           DWORD TotalSize;
        } Misc;
        union {
            struct {
                DWORD PointerToLinenumber;
                DWORD PointerToNextFunction;
            } Function;
            struct {
                WORD Dimension[4];
            } Array;
        } FcnAry;
        WORD TvIndex;
    } Sym;
    struct {
        BYTE Name[18];
    } File;
    struct {
        DWORD Length;
        WORD NumberOfRelocations;
        WORD NumberOfLinenumbers;
        DWORD CheckSum;
        SHORT Number;
        BYTE Selection;
    } Section;
} IMAGE_AUX_SYMBOL;
typedef IMAGE_AUX_SYMBOL *PIMAGE_AUX_SYMBOL;
# 2122 "/pgcc/include/winnt.h"
typedef struct _IMAGE_RELOCATION {
    union {
        DWORD VirtualAddress;
        DWORD RelocCount;
    };
    DWORD SymbolTableIndex;
    WORD Type;
} IMAGE_RELOCATION;
typedef IMAGE_RELOCATION *PIMAGE_RELOCATION;
# 2297 "/pgcc/include/winnt.h"
typedef struct _IMAGE_LINENUMBER {
    union {
        DWORD SymbolTableIndex;
        DWORD VirtualAddress;
    } Type;
    WORD Linenumber;
} IMAGE_LINENUMBER;
typedef IMAGE_LINENUMBER *PIMAGE_LINENUMBER;



# 1 "/pgcc/include/poppack.h" 1
# 34 "/pgcc/include/poppack.h"
#pragma pack()
# 2309 "/pgcc/include/winnt.h" 2

typedef struct _IMAGE_BASE_RELOCATION {
    DWORD VirtualAddress;
    DWORD SizeOfBlock;

} IMAGE_BASE_RELOCATION;
typedef IMAGE_BASE_RELOCATION * PIMAGE_BASE_RELOCATION;
# 2339 "/pgcc/include/winnt.h"
typedef struct _IMAGE_ARCHIVE_MEMBER_HEADER {
    BYTE Name[16];
    BYTE Date[12];
    BYTE UserID[6];
    BYTE GroupID[6];
    BYTE Mode[8];
    BYTE Size[10];
    BYTE EndHeader[2];
} IMAGE_ARCHIVE_MEMBER_HEADER, *PIMAGE_ARCHIVE_MEMBER_HEADER;



typedef struct _IMAGE_EXPORT_DIRECTORY {
    DWORD Characteristics;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    DWORD Name;
    DWORD Base;
    DWORD NumberOfFunctions;
    DWORD NumberOfNames;
    DWORD AddressOfFunctions;
    DWORD AddressOfNames;
    DWORD AddressOfNameOrdinals;
} IMAGE_EXPORT_DIRECTORY, *PIMAGE_EXPORT_DIRECTORY;

typedef struct _IMAGE_IMPORT_BY_NAME {
    WORD Hint;
    BYTE Name[1];
} IMAGE_IMPORT_BY_NAME, *PIMAGE_IMPORT_BY_NAME;

# 1 "/pgcc/include/pshpack8.h" 1
# 30 "/pgcc/include/pshpack8.h"
#pragma pack(8)
# 2371 "/pgcc/include/winnt.h" 2

typedef struct _IMAGE_THUNK_DATA64 {
    union {
        PBYTE ForwarderString;
        PDWORD Function;
        ULONGLONG Ordinal;
        PIMAGE_IMPORT_BY_NAME AddressOfData;
    } u1;
} IMAGE_THUNK_DATA64;
typedef IMAGE_THUNK_DATA64 * PIMAGE_THUNK_DATA64;

# 1 "/pgcc/include/poppack.h" 1
# 34 "/pgcc/include/poppack.h"
#pragma pack()
# 2383 "/pgcc/include/winnt.h" 2

typedef struct _IMAGE_THUNK_DATA32 {
    union {
        PBYTE ForwarderString;
        PDWORD Function;
        DWORD Ordinal;
        PIMAGE_IMPORT_BY_NAME AddressOfData;
    } u1;
} IMAGE_THUNK_DATA32;
typedef IMAGE_THUNK_DATA32 * PIMAGE_THUNK_DATA32;
# 2401 "/pgcc/include/winnt.h"
typedef void
( *PIMAGE_TLS_CALLBACK) (
    PVOID DllHandle,
    DWORD Reason,
    PVOID Reserved
    );

typedef struct _IMAGE_TLS_DIRECTORY64 {
    ULONGLONG StartAddressOfRawData;
    ULONGLONG EndAddressOfRawData;
    PDWORD AddressOfIndex;
    PIMAGE_TLS_CALLBACK *AddressOfCallBacks;
    DWORD SizeOfZeroFill;
    DWORD Characteristics;
} IMAGE_TLS_DIRECTORY64;
typedef IMAGE_TLS_DIRECTORY64 * PIMAGE_TLS_DIRECTORY64;

typedef struct _IMAGE_TLS_DIRECTORY32 {
    DWORD StartAddressOfRawData;
    DWORD EndAddressOfRawData;
    PDWORD AddressOfIndex;
    PIMAGE_TLS_CALLBACK *AddressOfCallBacks;
    DWORD SizeOfZeroFill;
    DWORD Characteristics;
} IMAGE_TLS_DIRECTORY32;
typedef IMAGE_TLS_DIRECTORY32 * PIMAGE_TLS_DIRECTORY32;



typedef IMAGE_THUNK_DATA32 IMAGE_THUNK_DATA;
typedef PIMAGE_THUNK_DATA32 PIMAGE_THUNK_DATA;

typedef IMAGE_TLS_DIRECTORY32 IMAGE_TLS_DIRECTORY;
typedef PIMAGE_TLS_DIRECTORY32 PIMAGE_TLS_DIRECTORY;

typedef struct _IMAGE_IMPORT_DESCRIPTOR {
    union {
        DWORD Characteristics;
        DWORD OriginalFirstThunk;
    };
    DWORD TimeDateStamp;




    DWORD ForwarderChain;
    DWORD Name;
    DWORD FirstThunk;
} IMAGE_IMPORT_DESCRIPTOR;
typedef IMAGE_IMPORT_DESCRIPTOR *PIMAGE_IMPORT_DESCRIPTOR;

typedef struct _IMAGE_BOUND_IMPORT_DESCRIPTOR {
    DWORD TimeDateStamp;
    WORD OffsetModuleName;
    WORD NumberOfModuleForwarderRefs;
} IMAGE_BOUND_IMPORT_DESCRIPTOR, *PIMAGE_BOUND_IMPORT_DESCRIPTOR;

typedef struct _IMAGE_BOUND_FORWARDER_REF {
    DWORD TimeDateStamp;
    WORD OffsetModuleName;
    WORD Reserved;
} IMAGE_BOUND_FORWARDER_REF, *PIMAGE_BOUND_FORWARDER_REF;



typedef struct _IMAGE_STUB_DIRECTORY {
    DWORD SecondaryImportAddressTable;
    WORD ExpectedISA[2];
    DWORD StubAddressTable[2];
} IMAGE_STUB_DIRECTORY, *PIMAGE_STUB_DIRECTORY;





typedef struct _IMAGE_RESOURCE_DIRECTORY {
    DWORD Characteristics;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    WORD NumberOfNamedEntries;
    WORD NumberOfIdEntries;
} IMAGE_RESOURCE_DIRECTORY, *PIMAGE_RESOURCE_DIRECTORY;




typedef struct _IMAGE_RESOURCE_DIRECTORY_ENTRY {
    union {
        struct {
            DWORD NameOffset:31;
            DWORD NameIsString:1;
        };
        DWORD Name;
        WORD Id;
    };
    union {
        DWORD OffsetToData;
        struct {
            DWORD OffsetToDirectory:31;
            DWORD DataIsDirectory:1;
        };
    };
} IMAGE_RESOURCE_DIRECTORY_ENTRY, *PIMAGE_RESOURCE_DIRECTORY_ENTRY;

typedef struct _IMAGE_RESOURCE_DIRECTORY_STRING {
    WORD Length;
    CHAR NameString[ 1 ];
} IMAGE_RESOURCE_DIRECTORY_STRING, *PIMAGE_RESOURCE_DIRECTORY_STRING;

typedef struct _IMAGE_RESOURCE_DIR_STRING_U {
    WORD Length;
    WCHAR NameString[ 1 ];
} IMAGE_RESOURCE_DIR_STRING_U, *PIMAGE_RESOURCE_DIR_STRING_U;

typedef struct _IMAGE_RESOURCE_DATA_ENTRY {
    DWORD OffsetToData;
    DWORD Size;
    DWORD CodePage;
    DWORD Reserved;
} IMAGE_RESOURCE_DATA_ENTRY, *PIMAGE_RESOURCE_DATA_ENTRY;

typedef struct {
    DWORD Characteristics;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    DWORD GlobalFlagsClear;
    DWORD GlobalFlagsSet;
    DWORD CriticalSectionDefaultTimeout;
    DWORD DeCommitFreeBlockThreshold;
    DWORD DeCommitTotalFreeThreshold;
    DWORD LockPrefixTable;
    DWORD MaximumAllocationSize;
    DWORD VirtualMemoryThreshold;
    DWORD ProcessHeapFlags;
    DWORD ProcessAffinityMask;
    WORD CSDVersion;
    WORD Reserved1;
    DWORD EditList;
    DWORD Reserved[ 1 ];
} IMAGE_LOAD_CONFIG_DIRECTORY32, *PIMAGE_LOAD_CONFIG_DIRECTORY32;

typedef struct {
    DWORD Characteristics;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    DWORD GlobalFlagsClear;
    DWORD GlobalFlagsSet;
    DWORD CriticalSectionDefaultTimeout;
    DWORD DeCommitFreeBlockThreshold;
    DWORD DeCommitTotalFreeThreshold;
    ULONGLONG LockPrefixTable;
    DWORD MaximumAllocationSize;
    DWORD VirtualMemoryThreshold;
    DWORD ProcessHeapFlags;
    DWORD ProcessAffinityMask;
    WORD CSDVersion;
    WORD Reserved1;
    ULONGLONG EditList;
    DWORD Reserved[ 1 ];
} IMAGE_LOAD_CONFIG_DIRECTORY64, *PIMAGE_LOAD_CONFIG_DIRECTORY64;

typedef IMAGE_LOAD_CONFIG_DIRECTORY32 IMAGE_LOAD_CONFIG_DIRECTORY;
typedef PIMAGE_LOAD_CONFIG_DIRECTORY32 PIMAGE_LOAD_CONFIG_DIRECTORY;

typedef struct _IMAGE_IA64_RUNTIME_FUNCTION_ENTRY {
    DWORD BeginAddress;
    DWORD EndAddress;
    DWORD UnwindInfoAddress;
} IMAGE_IA64_RUNTIME_FUNCTION_ENTRY, *PIMAGE_IA64_RUNTIME_FUNCTION_ENTRY;

typedef struct _IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY {
    DWORD BeginAddress;
    DWORD EndAddress;
    DWORD ExceptionHandler;
    DWORD HandlerData;
    DWORD PrologEndAddress;
} IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY, *PIMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY;

typedef struct _IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY {
    ULONGLONG BeginAddress;
    ULONGLONG EndAddress;
    ULONGLONG ExceptionHandler;
    ULONGLONG HandlerData;
    ULONGLONG PrologEndAddress;
} IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY, *PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY;

typedef IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY IMAGE_AXP64_RUNTIME_FUNCTION_ENTRY;
typedef PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY PIMAGE_AXP64_RUNTIME_FUNCTION_ENTRY;

typedef struct _IMAGE_CE_RUNTIME_FUNCTION_ENTRY {
    DWORD FuncStart;
    DWORD PrologLen : 8;
    DWORD FuncLen : 22;
    DWORD ThirtyTwoBit : 1;
    DWORD ExceptionFlag : 1;
} IMAGE_CE_RUNTIME_FUNCTION_ENTRY, * PIMAGE_CE_RUNTIME_FUNCTION_ENTRY;

typedef IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY IMAGE_RUNTIME_FUNCTION_ENTRY;
typedef PIMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY PIMAGE_RUNTIME_FUNCTION_ENTRY;

typedef struct _IMAGE_DEBUG_DIRECTORY {
    DWORD Characteristics;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    DWORD Type;
    DWORD SizeOfData;
    DWORD AddressOfRawData;
    DWORD PointerToRawData;
} IMAGE_DEBUG_DIRECTORY, *PIMAGE_DEBUG_DIRECTORY;
# 2627 "/pgcc/include/winnt.h"
typedef struct _IMAGE_COFF_SYMBOLS_HEADER {
    DWORD NumberOfSymbols;
    DWORD LvaToFirstSymbol;
    DWORD NumberOfLinenumbers;
    DWORD LvaToFirstLinenumber;
    DWORD RvaToFirstByteOfCode;
    DWORD RvaToLastByteOfCode;
    DWORD RvaToFirstByteOfData;
    DWORD RvaToLastByteOfData;
} IMAGE_COFF_SYMBOLS_HEADER, *PIMAGE_COFF_SYMBOLS_HEADER;






typedef struct _FPO_DATA {
    DWORD ulOffStart;
    DWORD cbProcSize;
    DWORD cdwLocals;
    WORD cdwParams;
    WORD cbProlog : 8;
    WORD cbRegs : 3;
    WORD fHasSEH : 1;
    WORD fUseBP : 1;
    WORD reserved : 1;
    WORD cbFrame : 2;
} FPO_DATA, *PFPO_DATA;




typedef struct _IMAGE_DEBUG_MISC {
    DWORD DataType;
    DWORD Length;

    BOOLEAN Unicode;
    BYTE Reserved[ 3 ];
    BYTE Data[ 1 ];
} IMAGE_DEBUG_MISC, *PIMAGE_DEBUG_MISC;

typedef struct _IMAGE_FUNCTION_ENTRY {
    DWORD StartingAddress;
    DWORD EndingAddress;
    DWORD EndOfPrologue;
} IMAGE_FUNCTION_ENTRY, *PIMAGE_FUNCTION_ENTRY;

typedef struct _IMAGE_FUNCTION_ENTRY64 {
    ULONGLONG StartingAddress;
    ULONGLONG EndingAddress;
    ULONGLONG EndOfPrologue;
} IMAGE_FUNCTION_ENTRY64, *PIMAGE_FUNCTION_ENTRY64;

typedef struct _IMAGE_SEPARATE_DEBUG_HEADER {
    WORD Signature;
    WORD Flags;
    WORD Machine;
    WORD Characteristics;
    DWORD TimeDateStamp;
    DWORD CheckSum;
    DWORD ImageBase;
    DWORD SizeOfImage;
    DWORD NumberOfSections;
    DWORD ExportedNamesSize;
    DWORD DebugDirectorySize;
    DWORD SectionAlignment;
    DWORD Reserved[2];
} IMAGE_SEPARATE_DEBUG_HEADER, *PIMAGE_SEPARATE_DEBUG_HEADER;






typedef struct _ImageArchitectureHeader {
    unsigned int AmaskValue: 1;

    int :7;
    unsigned int AmaskShift: 8;
    int :16;
    DWORD FirstEntryRVA;
} IMAGE_ARCHITECTURE_HEADER, *PIMAGE_ARCHITECTURE_HEADER;

typedef struct _ImageArchitectureEntry {
    DWORD FixupInstRVA;
    DWORD NewInst;
} IMAGE_ARCHITECTURE_ENTRY, *PIMAGE_ARCHITECTURE_ENTRY;

# 1 "/pgcc/include/poppack.h" 1
# 34 "/pgcc/include/poppack.h"
#pragma pack()
# 2716 "/pgcc/include/winnt.h" 2



typedef struct IMPORT_OBJECT_HEADER {
    WORD Sig1;
    WORD Sig2;
    WORD Version;
    WORD Machine;
    DWORD TimeDateStamp;
    DWORD SizeOfData;

    union {
        WORD Ordinal;
        WORD Hint;
    };

    WORD Type : 2;
    WORD NameType : 3;
    WORD Reserved : 11;
} IMPORT_OBJECT_HEADER;

typedef enum IMPORT_OBJECT_TYPE
{
    IMPORT_OBJECT_CODE = 0,
    IMPORT_OBJECT_DATA = 1,
    IMPORT_OBJECT_CONST = 2,
} IMPORT_OBJECT_TYPE;

typedef enum IMPORT_OBJECT_NAME_TYPE
{
    IMPORT_OBJECT_ORDINAL = 0,
    IMPORT_OBJECT_NAME = 1,
    IMPORT_OBJECT_NAME_NO_PREFIX = 2,
    IMPORT_OBJECT_NAME_UNDECORATE = 3,

} IMPORT_OBJECT_NAME_TYPE;


# 1 "/pgcc/include/string.h" 1
# 25 "/pgcc/include/string.h"
 wchar_t * wcscat(wchar_t *, const wchar_t *);
 wchar_t * wcschr(const wchar_t *, wchar_t);
 int wcscmp(const wchar_t *, const wchar_t *);
 wchar_t * wcscpy(wchar_t *, const wchar_t *);
 size_t wcscspn(const wchar_t *, const wchar_t *);
 size_t wcslen(const wchar_t *);
 size_t mbstowcs(wchar_t *wcstr, const char *mbstr, size_t count);
 size_t wcstombs(char *mbstr, const wchar_t *wcstr, size_t count);
 wchar_t * wcsncat(wchar_t *, const wchar_t *, size_t);
 int wcsncmp(const wchar_t *, const wchar_t *, size_t);
 wchar_t * wcsncpy(wchar_t *, const wchar_t *, size_t);
 wchar_t * wcspbrk(const wchar_t *, const wchar_t *);
 wchar_t * wcsrchr(const wchar_t *, wchar_t);
 size_t wcsspn(const wchar_t *, const wchar_t *);
 wchar_t * wcsstr(const wchar_t *, const wchar_t *);
 wchar_t * wcstok(wchar_t *, const wchar_t *);
 wchar_t * _wcsdup(const wchar_t *);
 int _wcsicmp(const wchar_t *, const wchar_t *);
 int _wcsnicmp(const wchar_t *, const wchar_t *, size_t);
 wchar_t * _wcsnset(wchar_t *, wchar_t, size_t);
 wchar_t * _wcsrev(wchar_t *);
 wchar_t * _wcsset(wchar_t *, wchar_t);
 wchar_t * _wcslwr(wchar_t *);
 wchar_t * _wcsupr(wchar_t *);
# 59 "/pgcc/include/string.h"
size_t strlen(const char *);
int strcmp(const char *, const char *);
char * strcat(char *, const char *);
char * strcpy(char *, const char *);
 char * strchr(const char *, int);
 size_t strcspn(const char *, const char *);
 char * strncat(char *, const char *, size_t);
 int strncmp(const char *, const char *, size_t);
 char * strncpy(char *, const char *, size_t);
 char * strstr(const char *, const char *);
 char * strtok(char *, const char *);

 int _stricmp(const char *, const char *);

 int _strnicmp(const char *, const char *, size_t);
 char * strpbrk(const char *, const char *);
 char * strrchr(const char *, int);
 size_t strspn(const char *, const char *);
 char * _strdup(const char *);
 char * _strnset(char *, int, size_t);
 char * _strrev(char *);
char * _strset(char *, int);
 char * _strlwr(char *);
 char * _strupr(char *);
# 2755 "/pgcc/include/winnt.h" 2
# 2795 "/pgcc/include/winnt.h"

SIZE_T

RtlCompareMemory (
    const void *Source1,
    const void *Source2,
    SIZE_T Length
    );
# 2814 "/pgcc/include/winnt.h"
typedef struct _MESSAGE_RESOURCE_ENTRY {
    WORD Length;
    WORD Flags;
    BYTE Text[ 1 ];
} MESSAGE_RESOURCE_ENTRY, *PMESSAGE_RESOURCE_ENTRY;



typedef struct _MESSAGE_RESOURCE_BLOCK {
    DWORD LowId;
    DWORD HighId;
    DWORD OffsetToEntries;
} MESSAGE_RESOURCE_BLOCK, *PMESSAGE_RESOURCE_BLOCK;

typedef struct _MESSAGE_RESOURCE_DATA {
    DWORD NumberOfBlocks;
    MESSAGE_RESOURCE_BLOCK Blocks[ 1 ];
} MESSAGE_RESOURCE_DATA, *PMESSAGE_RESOURCE_DATA;

typedef struct _RTL_CRITICAL_SECTION_DEBUG {
    WORD Type;
    WORD CreatorBackTraceIndex;
    struct _RTL_CRITICAL_SECTION *CriticalSection;
    LIST_ENTRY ProcessLocksList;
    DWORD EntryCount;
    DWORD ContentionCount;
    DWORD Spare[ 2 ];
} RTL_CRITICAL_SECTION_DEBUG, *PRTL_CRITICAL_SECTION_DEBUG, RTL_RESOURCE_DEBUG, *PRTL_RESOURCE_DEBUG;




typedef struct _RTL_CRITICAL_SECTION {
    PRTL_CRITICAL_SECTION_DEBUG DebugInfo;

    LONG LockCount;
    LONG RecursionCount;
    HANDLE OwningThread;
    HANDLE LockSemaphore;
    DWORD SpinCount;
} RTL_CRITICAL_SECTION, *PRTL_CRITICAL_SECTION;
# 2866 "/pgcc/include/winnt.h"
typedef void ( * WAITORTIMERCALLBACKFUNC) (PVOID, BOOLEAN );
typedef void ( * WORKERCALLBACKFUNC) (PVOID );
# 2894 "/pgcc/include/winnt.h"
typedef struct _EVENTLOGRECORD {
    DWORD Length;
    DWORD Reserved;
    DWORD RecordNumber;
    DWORD TimeGenerated;
    DWORD TimeWritten;
    DWORD EventID;
    WORD EventType;
    WORD NumStrings;
    WORD EventCategory;
    WORD ReservedFlags;
    DWORD ClosingRecordNumber;
    DWORD StringOffset;
    DWORD UserSidLength;
    DWORD UserSidOffset;
    DWORD DataLength;
    DWORD DataOffset;
} EVENTLOGRECORD, *PEVENTLOGRECORD;



typedef struct _EVENTSFORLOGFILE{
        DWORD ulSize;
    WCHAR szLogicalLogFile[256];
    DWORD ulNumRecords;
        EVENTLOGRECORD pEventLogRecords[];
} EVENTSFORLOGFILE, *PEVENTSFORLOGFILE;

typedef struct _PACKEDEVENTINFO{
    DWORD ulSize;
    DWORD ulNumEventsForLogFile;
    DWORD ulOffsets[];
} PACKEDEVENTINFO, *PPACKEDEVENTINFO;
# 3044 "/pgcc/include/winnt.h"
typedef enum _CM_SERVICE_NODE_TYPE {
    DriverType = 0x00000001,
    FileSystemType = 0x00000002,
    Win32ServiceOwnProcess = 0x00000010,
    Win32ServiceShareProcess = 0x00000020,
    AdapterType = 0x00000004,
    RecognizerType = 0x00000008
} SERVICE_NODE_TYPE;

typedef enum _CM_SERVICE_LOAD_TYPE {
    BootLoad = 0x00000000,
    SystemLoad = 0x00000001,
    AutoLoad = 0x00000002,
    DemandLoad = 0x00000003,
    DisableLoad = 0x00000004
} SERVICE_LOAD_TYPE;

typedef enum _CM_ERROR_CONTROL_TYPE {
    IgnoreError = 0x00000000,
    NormalError = 0x00000001,
    SevereError = 0x00000002,
    CriticalError = 0x00000003
} SERVICE_ERROR_TYPE;




typedef struct _TAPE_ERASE {
    DWORD Type;
    BOOLEAN Immediate;
} TAPE_ERASE, *PTAPE_ERASE;
# 3083 "/pgcc/include/winnt.h"
typedef struct _TAPE_PREPARE {
    DWORD Operation;
    BOOLEAN Immediate;
} TAPE_PREPARE, *PTAPE_PREPARE;






typedef struct _TAPE_WRITE_MARKS {
    DWORD Type;
    DWORD Count;
    BOOLEAN Immediate;
} TAPE_WRITE_MARKS, *PTAPE_WRITE_MARKS;





typedef struct _TAPE_GET_POSITION {
    DWORD Type;
    DWORD Partition;
    LARGE_INTEGER Offset;
} TAPE_GET_POSITION, *PTAPE_GET_POSITION;
# 3120 "/pgcc/include/winnt.h"
typedef struct _TAPE_SET_POSITION {
    DWORD Method;
    DWORD Partition;
    LARGE_INTEGER Offset;
    BOOLEAN Immediate;
} TAPE_SET_POSITION, *PTAPE_SET_POSITION;
# 3184 "/pgcc/include/winnt.h"
typedef struct _TAPE_GET_DRIVE_PARAMETERS {
    BOOLEAN ECC;
    BOOLEAN Compression;
    BOOLEAN DataPadding;
    BOOLEAN ReportSetmarks;
    DWORD DefaultBlockSize;
    DWORD MaximumBlockSize;
    DWORD MinimumBlockSize;
    DWORD MaximumPartitionCount;
    DWORD FeaturesLow;
    DWORD FeaturesHigh;
    DWORD EOTWarningZoneSize;
} TAPE_GET_DRIVE_PARAMETERS, *PTAPE_GET_DRIVE_PARAMETERS;

typedef struct _TAPE_SET_DRIVE_PARAMETERS {
    BOOLEAN ECC;
    BOOLEAN Compression;
    BOOLEAN DataPadding;
    BOOLEAN ReportSetmarks;
    DWORD EOTWarningZoneSize;
} TAPE_SET_DRIVE_PARAMETERS, *PTAPE_SET_DRIVE_PARAMETERS;

typedef struct _TAPE_GET_MEDIA_PARAMETERS {
    LARGE_INTEGER Capacity;
    LARGE_INTEGER Remaining;
    DWORD BlockSize;
    DWORD PartitionCount;
    BOOLEAN WriteProtected;
} TAPE_GET_MEDIA_PARAMETERS, *PTAPE_GET_MEDIA_PARAMETERS;

typedef struct _TAPE_SET_MEDIA_PARAMETERS {
    DWORD BlockSize;
} TAPE_SET_MEDIA_PARAMETERS, *PTAPE_SET_MEDIA_PARAMETERS;





typedef struct _TAPE_CREATE_PARTITION {
    DWORD Method;
    DWORD Count;
    DWORD Size;
} TAPE_CREATE_PARTITION, *PTAPE_CREATE_PARTITION;
# 116 "/pgcc/include/windef.h" 2


typedef UINT_PTR WPARAM;
typedef LONG_PTR LPARAM;
typedef LONG_PTR LRESULT;
# 138 "/pgcc/include/windef.h"
struct HWND__ { int unused; }; typedef struct HWND__ *HWND;
struct HHOOK__ { int unused; }; typedef struct HHOOK__ *HHOOK;
struct HEVENT__ { int unused; }; typedef struct HEVENT__ *HEVENT;

typedef WORD ATOM;

typedef HANDLE *SPHANDLE;
typedef HANDLE *LPHANDLE;
typedef HANDLE HGLOBAL;
typedef HANDLE HLOCAL;
typedef HANDLE GLOBALHANDLE;
typedef HANDLE LOCALHANDLE;

typedef int ( *FARPROC)();
typedef int ( *NEARPROC)();
typedef int ( *PROC)();

typedef void * HGDIOBJ;
struct HKEY__ { int unused; }; typedef struct HKEY__ *HKEY;
typedef HKEY *PHKEY;
struct HACCEL__ { int unused; }; typedef struct HACCEL__ *HACCEL;
struct HBITMAP__ { int unused; }; typedef struct HBITMAP__ *HBITMAP;
struct HBRUSH__ { int unused; }; typedef struct HBRUSH__ *HBRUSH;
struct HCOLORSPACE__ { int unused; }; typedef struct HCOLORSPACE__ *HCOLORSPACE;
struct HDC__ { int unused; }; typedef struct HDC__ *HDC;
struct HGLRC__ { int unused; }; typedef struct HGLRC__ *HGLRC;
struct HDESK__ { int unused; }; typedef struct HDESK__ *HDESK;
struct HENHMETAFILE__ { int unused; }; typedef struct HENHMETAFILE__ *HENHMETAFILE;
struct HFONT__ { int unused; }; typedef struct HFONT__ *HFONT;
struct HICON__ { int unused; }; typedef struct HICON__ *HICON;
struct HMENU__ { int unused; }; typedef struct HMENU__ *HMENU;
struct HMETAFILE__ { int unused; }; typedef struct HMETAFILE__ *HMETAFILE;
struct HINSTANCE__ { int unused; }; typedef struct HINSTANCE__ *HINSTANCE;
typedef HINSTANCE HMODULE;
struct HPALETTE__ { int unused; }; typedef struct HPALETTE__ *HPALETTE;
struct HPEN__ { int unused; }; typedef struct HPEN__ *HPEN;
struct HRGN__ { int unused; }; typedef struct HRGN__ *HRGN;
struct HRSRC__ { int unused; }; typedef struct HRSRC__ *HRSRC;
struct HSTR__ { int unused; }; typedef struct HSTR__ *HSTR;
struct HTASK__ { int unused; }; typedef struct HTASK__ *HTASK;
struct HWINSTA__ { int unused; }; typedef struct HWINSTA__ *HWINSTA;
struct HKL__ { int unused; }; typedef struct HKL__ *HKL;
struct HMONITOR__ { int unused; }; typedef struct HMONITOR__ *HMONITOR;
struct HWINEVENTHOOK__ { int unused; }; typedef struct HWINEVENTHOOK__ *HWINEVENTHOOK;
typedef int HFILE;
typedef HICON HCURSOR;
typedef DWORD COLORREF;
typedef DWORD *LPCOLORREF;



typedef struct tagRECT
{
    LONG left;
    LONG top;
    LONG right;
    LONG bottom;
} RECT, *PRECT, *NPRECT, *LPRECT;
typedef const RECT * LPCRECT;

typedef struct _RECTL
{
    LONG left;
    LONG top;
    LONG right;
    LONG bottom;
} RECTL, *PRECTL, *LPRECTL;
typedef const RECTL * LPCRECTL;

typedef struct tagPOINT
{
    LONG x;
    LONG y;
} POINT, *PPOINT, *NPPOINT, *LPPOINT;

typedef struct _POINTL
{
    LONG x;
    LONG y;
} POINTL, *PPOINTL;

typedef struct tagSIZE
{
    LONG cx;
    LONG cy;
} SIZE, *PSIZE, *LPSIZE;

typedef SIZE SIZEL;
typedef SIZE *PSIZEL, *LPSIZEL;

typedef struct tagPOINTS
{
    SHORT x;
    SHORT y;
} POINTS, *PPOINTS, *LPPOINTS;
# 18 "/pgcc/include/winuser.h" 2
# 1 "/pgcc/include/mmsystem.h" 1
# 18 "/pgcc/include/mmsystem.h"
# 1 "/pgcc/include/pshpack1.h" 1
# 30 "/pgcc/include/pshpack1.h"
#pragma pack(1)
# 19 "/pgcc/include/mmsystem.h" 2
# 51 "/pgcc/include/mmsystem.h"
typedef UINT MMVERSION;

typedef UINT MMRESULT;




typedef UINT *LPUINT;



typedef struct mmtime_tag
{
    UINT wType;
    union
    {
    DWORD ms;
    DWORD sample;
    DWORD cb;
    DWORD ticks;


    struct
    {
        BYTE hour;
        BYTE min;
        BYTE sec;
        BYTE frame;
        BYTE fps;
        BYTE dummy;

        BYTE pad[2];

    } smpte;


    struct
    {
        DWORD songptrpos;
    } midi;
    } u;
} MMTIME, *PMMTIME, *NPMMTIME, *LPMMTIME;
# 190 "/pgcc/include/mmsystem.h"
typedef void ( DRVCALLBACK)(HANDLE hdrvr, UINT uMsg, DWORD dwUser, DWORD dw1, DWORD dw2);

typedef DRVCALLBACK *LPDRVCALLBACK;
typedef DRVCALLBACK *PDRVCALLBACK;




BOOL sndPlaySoundW( LPCWSTR lpszSoundName, UINT fuSound );






BOOL PlaySoundA( LPCSTR pszSound, HMODULE hmod, DWORD fdwSound);
BOOL PlaySoundW(LPCWSTR pszSound, HMODULE hmod, DWORD fdwSound);
# 257 "/pgcc/include/mmsystem.h"
typedef HANDLE HDRVR;
typedef HANDLE HMMIO;
# 278 "/pgcc/include/mmsystem.h"
struct HWAVE__ { int unused; }; typedef struct HWAVE__ *HWAVE;
struct HWAVEIN__ { int unused; }; typedef struct HWAVEIN__ *HWAVEIN;
struct HWAVEOUT__ { int unused; }; typedef struct HWAVEOUT__ *HWAVEOUT;

typedef HWAVEIN *LPHWAVEIN;
typedef HWAVEOUT *LPHWAVEOUT;
typedef DRVCALLBACK WAVECALLBACK;
typedef WAVECALLBACK *LPWAVECALLBACK;
# 309 "/pgcc/include/mmsystem.h"
typedef struct {
    WORD wFormatTag;
    WORD nChannels;
    DWORD nSamplesPerSec;
    DWORD nAvgBytesPerSec;
    WORD nBlockAlign;
} WAVEFORMAT;
typedef WAVEFORMAT *PWAVEFORMAT;
typedef WAVEFORMAT *NPWAVEFORMAT;
typedef WAVEFORMAT *LPWAVEFORMAT;
typedef const WAVEFORMAT *LPCWAVEFORMAT;







typedef struct tagPCMWAVEFORMAT {
    WAVEFORMAT wf;
    WORD wBitsPerSample;
} PCMWAVEFORMAT;
typedef PCMWAVEFORMAT *PPCMWAVEFORMAT;
typedef PCMWAVEFORMAT *NPPCMWAVEFORMAT;
typedef PCMWAVEFORMAT *LPPCMWAVEFORMAT;



typedef struct wavehdr_tag {
    LPSTR lpData;
    DWORD dwBufferLength;
    DWORD dwBytesRecorded;
    DWORD dwUser;
    DWORD dwFlags;
    DWORD dwLoops;
    struct wavehdr_tag *lpNext;
    DWORD reserved;
} WAVEHDR, *PWAVEHDR, *NPWAVEHDR, *LPWAVEHDR;
# 356 "/pgcc/include/mmsystem.h"
typedef struct tagWAVEOUTCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[32];
    DWORD dwFormats;
    WORD wChannels;
    WORD wReserved1;
    DWORD dwSupport;
} WAVEOUTCAPS, *PWAVEOUTCAPS, *NPWAVEOUTCAPS, *LPWAVEOUTCAPS;
# 378 "/pgcc/include/mmsystem.h"
typedef struct tagWAVEINCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[32];
    DWORD dwFormats;
    WORD wChannels;
    WORD wReserved1;
} WAVEINCAPS, *PWAVEINCAPS, *NPWAVEINCAPS, *LPWAVEINCAPS;
# 412 "/pgcc/include/mmsystem.h"
typedef struct tWAVEFORMATEX
{
    WORD wFormatTag;
    WORD nChannels;
    DWORD nSamplesPerSec;
    DWORD nAvgBytesPerSec;
    WORD nBlockAlign;
    WORD wBitsPerSample;
    WORD cbSize;

} WAVEFORMATEX, *PWAVEFORMATEX, *NPWAVEFORMATEX, *LPWAVEFORMATEX;
typedef const WAVEFORMATEX *LPCWAVEFORMATEX;





UINT waveOutGetNumDevs(void);
MMRESULT waveOutGetDevCaps(UINT uDeviceID, LPWAVEOUTCAPS pwoc, UINT cbwoc);
MMRESULT waveOutGetVolume(HWAVEOUT hwo, LPDWORD pdwVolume);
MMRESULT waveOutSetVolume(HWAVEOUT hwo, DWORD dwVolume);
MMRESULT waveOutGetErrorText(MMRESULT mmrError, LPTSTR pszText, UINT cchText);
MMRESULT waveOutClose(HWAVEOUT hwo);
MMRESULT waveOutPrepareHeader(HWAVEOUT hwo, LPWAVEHDR pwh, UINT cbwh);
MMRESULT waveOutUnprepareHeader(HWAVEOUT hwo, LPWAVEHDR pwh, UINT cbwh);
MMRESULT waveOutWrite(HWAVEOUT hwo, LPWAVEHDR pwh, UINT cbwh);
MMRESULT waveOutPause(HWAVEOUT hwo);
MMRESULT waveOutRestart(HWAVEOUT hwo);
MMRESULT waveOutReset(HWAVEOUT hwo);
MMRESULT waveOutBreakLoop(HWAVEOUT hwo);
MMRESULT waveOutGetPosition(HWAVEOUT hwo, LPMMTIME pmmt, UINT cbmmt);
MMRESULT waveOutGetPitch(HWAVEOUT hwo, LPDWORD pdwPitch);
MMRESULT waveOutSetPitch(HWAVEOUT hwo, DWORD dwPitch);
MMRESULT waveOutGetPlaybackRate(HWAVEOUT hwo, LPDWORD pdwRate);
MMRESULT waveOutSetPlaybackRate(HWAVEOUT hwo, DWORD dwRate);
MMRESULT waveOutGetID(HWAVEOUT hwo, LPUINT puDeviceID);
MMRESULT waveOutMessage(HWAVEOUT hwo, UINT uMsg, DWORD dw1, DWORD dw2);
MMRESULT waveOutOpen(LPHWAVEOUT phwo, UINT uDeviceID,
    LPCWAVEFORMATEX pwfx, DWORD dwCallback, DWORD dwInstance, DWORD fdwOpen);


UINT waveInGetNumDevs(void);
MMRESULT waveInGetDevCaps(UINT uDeviceID, LPWAVEINCAPS pwic, UINT cbwic);
MMRESULT waveInGetErrorText(MMRESULT mmrError, LPTSTR pszText, UINT cchText);
MMRESULT waveInClose(HWAVEIN hwi);
MMRESULT waveInPrepareHeader(HWAVEIN hwi, LPWAVEHDR pwh, UINT cbwh);
MMRESULT waveInUnprepareHeader(HWAVEIN hwi, LPWAVEHDR pwh, UINT cbwh);
MMRESULT waveInAddBuffer(HWAVEIN hwi, LPWAVEHDR pwh, UINT cbwh);
MMRESULT waveInStart(HWAVEIN hwi);
MMRESULT waveInStop(HWAVEIN hwi);
MMRESULT waveInReset(HWAVEIN hwi);
MMRESULT waveInGetPosition(HWAVEIN hwi, LPMMTIME pmmt, UINT cbmmt);
MMRESULT waveInGetID(HWAVEIN hwi, LPUINT puDeviceID);
MMRESULT waveInMessage(HWAVEIN hwi, UINT uMsg, DWORD dw1, DWORD dw2);
MMRESULT waveInOpen(LPHWAVEIN phwi, UINT uDeviceID,
    LPCWAVEFORMATEX pwfx, DWORD dwCallback, DWORD dwInstance, DWORD fdwOpen);
# 479 "/pgcc/include/mmsystem.h"
# 1 "/pgcc/include/poppack.h" 1
# 34 "/pgcc/include/poppack.h"
#pragma pack()
# 480 "/pgcc/include/mmsystem.h" 2
# 19 "/pgcc/include/winuser.h" 2


typedef struct tagMSG {
    HWND hwnd;
    UINT message;
    WPARAM wParam;
    LPARAM lParam;
    DWORD time;
    POINT pt;
} MSG, *PMSG, *NPMSG, *LPMSG;
# 63 "/pgcc/include/winuser.h"
typedef LRESULT (* WNDPROC)(HWND, UINT, WPARAM, LPARAM);

typedef BOOL (* DLGPROC)(HWND, UINT, WPARAM, LPARAM);


typedef void (* TIMERPROC)(HWND, UINT, UINT, DWORD);



typedef struct tagWNDCLASSA {
    UINT style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    LPCSTR lpszMenuName;
    LPCSTR lpszClassName;
} WNDCLASSA, *PWNDCLASSA, *LPWNDCLASSA;

typedef struct tagWNDCLASSW {
    UINT style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    LPCWSTR lpszMenuName;
    LPCWSTR lpszClassName;
} WNDCLASSW, *PWNDCLASSW, *LPWNDCLASSW;

typedef WNDCLASSW WNDCLASS;
typedef PWNDCLASSW PWNDCLASS;
typedef LPWNDCLASSW LPWNDCLASS;
# 456 "/pgcc/include/winuser.h"
WINUSERAPI BOOL DrawFrameControl(HDC, LPRECT, UINT, UINT);
# 519 "/pgcc/include/winuser.h"
WINUSERAPI
UINT

RegisterWindowMessageA(
    LPCSTR lpString);
WINUSERAPI
UINT

RegisterWindowMessageW(
    LPCWSTR lpString);







typedef struct tagCREATESTRUCTA {
    LPVOID lpCreateParams;
    HINSTANCE hInstance;
    HMENU hMenu;
    HWND hwndParent;
    int cy;
    int cx;
    int y;
    int x;
    LONG style;
    LPCSTR lpszName;
    LPCSTR lpszClass;
    DWORD dwExStyle;
} CREATESTRUCTA, *PCREATESTRUCTA, *LPCREATESTRUCTA;

typedef struct tagCREATESTRUCTW {
    LPVOID lpCreateParams;
    HINSTANCE hInstance;
    HMENU hMenu;
    HWND hwndParent;
    int cy;
    int cx;
    int y;
    int x;
    LONG style;
    LPCWSTR lpszName;
    LPCWSTR lpszClass;
    DWORD dwExStyle;
} CREATESTRUCTW, *PCREATESTRUCTW, *LPCREATESTRUCTW;

typedef CREATESTRUCTW CREATESTRUCT;
typedef LPCREATESTRUCTW LPCREATESTRUCT;
typedef PCREATESTRUCTW PCREATESTRUCT;



typedef struct tagSTYLESTRUCT
{
    DWORD styleOld;
    DWORD styleNew;
} STYLESTRUCT, * LPSTYLESTRUCT;

typedef void * HDWP;




typedef struct tagWINDOWPOS {
    HWND hwnd;
    HWND hwndInsertAfter;
    int x;
    int y;
    int cx;
    int cy;
    UINT flags;
} WINDOWPOS, *LPWINDOWPOS, *PWINDOWPOS;
# 617 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

PostMessageA(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
WINUSERAPI
BOOL

PostMessageW(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
# 641 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

PostThreadMessageA(
    DWORD idThread,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
WINUSERAPI
BOOL

PostThreadMessageW(
    DWORD idThread,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);






void

PostQuitMessage(
    int nExitCode
    );


WINUSERAPI
LRESULT

SendMessageA(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
WINUSERAPI
LRESULT

SendMessageW(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);







WINUSERAPI
BOOL

SendNotifyMessageA(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
WINUSERAPI
BOOL

SendNotifyMessageW(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);







WINUSERAPI
BOOL

InSendMessage(
        void);

WINUSERAPI
DWORD

GetQueueStatus(
        UINT flags);


WINUSERAPI
BOOL

GetMessageA(
    LPMSG lpMsg,
    HWND hWnd ,
    UINT wMsgFilterMin,
    UINT wMsgFilterMax);
WINUSERAPI
BOOL

GetMessageW(
    LPMSG lpMsg,
    HWND hWnd ,
    UINT wMsgFilterMin,
    UINT wMsgFilterMax);
# 753 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

PeekMessageW(
    PMSG pMsg,
    HWND hWnd ,
    UINT wMsgFilterMin,
    UINT wMsgFilterMax,
    UINT wRemoveMsg);
WINUSERAPI
BOOL

PeekMessageA(
    PMSG pMsg,
    HWND hWnd ,
    UINT wMsgFilterMin,
    UINT wMsgFilterMax,
    UINT wRemoveMsg);
# 786 "/pgcc/include/winuser.h"
BOOL

TranslateMessage(
    const MSG *pMsg
    );


WINUSERAPI
LONG

DispatchMessageA(
    const MSG *lpMsg);
WINUSERAPI
LONG

DispatchMessageW(
    const MSG *lpMsg);






DWORD

GetMessagePos(
        void
        );






UINT

GetMessageSource(
        void
        );

WINUSERAPI
DWORD

MsgWaitForMultipleObjectsEx(
    DWORD nCount,
    LPHANDLE pHandles,
    DWORD dwMilliseconds,
    DWORD dwWakeMask,
    DWORD dwFlags);
# 890 "/pgcc/include/winuser.h"
HWND

GetCapture(
    void);

HWND

SetCapture(
    HWND hWnd);

BOOL

ReleaseCapture(
    void);




BOOL

MoveWindow(
    HWND hWnd,
    int X,
    int Y,
    int nWidth,
    int nHeight,
    BOOL bRepaint);

int

SetWindowRgn (
    HWND hwnd,
        HRGN hrgn,
        BOOL bRedraw
    );

int

GetWindowRgn (
    HWND hwnd,
        HRGN hrgn
    );

BOOL

SetWindowPos (
    HWND hwnd,
    HWND hwndInsertAfter,
    int x,
    int y,
    int dx,
    int dy,
    UINT fuFlags
    );

BOOL

GetWindowRect (
    HWND hwnd,
    LPRECT prc
    );

int

GetWindowTextLengthA(
    HWND hWnd);

int

GetWindowTextLengthW(
    HWND hWnd);






BOOL

GetClientRect (
    HWND hwnd,
    LPRECT prc
    );

BOOL

AdjustWindowRectEx (
    LPRECT prc,
    DWORD dwStyle,
    BOOL bMenu,
    DWORD dwExStyle
    );

BOOL

ValidateRect(
    HWND hWnd ,
    const RECT *lpRect);

BOOL

InvalidateRect (
    HWND hwnd,
    LPCRECT prc,
    BOOL fErase
    );

HWND

GetWindow (
    HWND hwnd,
    UINT uCmd
    );

BOOL

BringWindowToTop(
    HWND hWnd);

HDWP BeginDeferWindowPos(
        int nNumWindows);

HDWP DeferWindowPos(
   HDWP hWinPosInfo,
   HWND hWnd,
   HWND hWndInsertAfter,
   int x,
   int y,
   int cx,
   int cy,
   UINT uFlags
   );

BOOL EndDeferWindowPos(
  HDWP hWinPosInfo
  );
# 1056 "/pgcc/include/winuser.h"
int

ScrollWindowEx(
    HWND hWnd,
    int dx,
    int dy,
    const RECT *prcScroll,
    const RECT *prcClip ,
    HRGN hrgnUpdate,
    LPRECT prcUpdate,
    UINT flags);







BOOL

ScrollDC(
    HDC hDC,
    int dx,
    int dy,
    const RECT *lprcScroll,
    const RECT *lprcClip ,
    HRGN hrgnUpdate,
    LPRECT lprcUpdate);
# 1134 "/pgcc/include/winuser.h"
BOOL

CheckMenuRadioItem(HMENU, UINT, UINT, UINT, UINT);



HBITMAP

LoadBitmapA(
    HINSTANCE hInstance,
    LPCSTR lpBitmapName);

HBITMAP

LoadBitmapW(
    HINSTANCE hInstance,
    LPCWSTR lpBitmapName);
# 1169 "/pgcc/include/winuser.h"
int

LoadStringA(
    HINSTANCE hInstance,
    UINT uID,
    LPSTR lpBuffer,
    int nBufferMax);

int

LoadStringW(
    HINSTANCE hInstance,
    UINT uID,
    LPWSTR lpBuffer,
    int nBufferMax);
# 1233 "/pgcc/include/winuser.h"
HMENU

LoadMenuA(
    HINSTANCE hInstance,
    LPCSTR lpMenuName);

HMENU

LoadMenuW(
    HINSTANCE hInstance,
    LPCWSTR lpMenuName);






BOOL

DrawMenuBar(
    HWND hWnd);

HMENU

CreateMenu(
    void);


HMENU

CreatePopupMenu(
    void);


BOOL

DestroyMenu(
    HMENU hMenu);


DWORD

CheckMenuItem(
    HMENU hMenu,
    UINT uIDCheckItem,
    UINT uCheck);


BOOL

EnableMenuItem(
    HMENU hMenu,
    UINT uIDEnableItem,
    UINT uEnable);

HMENU

GetSubMenu(
    HMENU hMenu,
    int nPos);

BOOL

InsertMenuA(
    HMENU hMenu,
    UINT uPosition,
    UINT uFlags,
    UINT uIDNewItem,
    LPCSTR lpNewItem
    );

BOOL

InsertMenuW(
    HMENU hMenu,
    UINT uPosition,
    UINT uFlags,
    UINT uIDNewItem,
    LPCWSTR lpNewItem
    );







BOOL

AppendMenuA(
    HMENU hMenu,
    UINT uFlags,
    UINT uIDNewItem,
    LPCSTR lpNewItem
    );

BOOL

AppendMenuW(
    HMENU hMenu,
    UINT uFlags,
    UINT uIDNewItem,
    LPCWSTR lpNewItem
    );






BOOL
 RemoveMenu(
    HMENU hMenu,
    UINT uPosition,
    UINT uFlags);


BOOL

DeleteMenu(
    HMENU hMenu,
    UINT uPosition,
    UINT uFlags);



BOOL

TrackPopupMenu(
    HMENU hMenu,
    UINT uFlags,
    int x,
    int y,
    int nReserved,
    HWND hWnd,
    const RECT *prcRect);

typedef struct tagTPMPARAMS
{
    UINT cbSize;
    RECT rcExclude;
} TPMPARAMS;
typedef TPMPARAMS *LPTPMPARAMS;

BOOL

TrackPopupMenuEx(
    HMENU hmenu,
    UINT uFlags,
    int x,
    int y,
    HWND hwnd,
    LPTPMPARAMS lptpm);
# 1409 "/pgcc/include/winuser.h"
typedef struct tagMENUITEMINFOA
{
    UINT cbSize;
    UINT fMask;
    UINT fType;
    UINT fState;
    UINT wID;
    HMENU hSubMenu;
    HBITMAP hbmpChecked;
    HBITMAP hbmpUnchecked;
    DWORD dwItemData;
    LPSTR dwTypeData;
    UINT cch;
} MENUITEMINFOA, *LPMENUITEMINFOA;
typedef struct tagMENUITEMINFOW
{
    UINT cbSize;
    UINT fMask;
    UINT fType;
    UINT fState;
    UINT wID;
    HMENU hSubMenu;
    HBITMAP hbmpChecked;
    HBITMAP hbmpUnchecked;
    DWORD dwItemData;
    LPWSTR dwTypeData;
    UINT cch;
} MENUITEMINFOW, *LPMENUITEMINFOW;

typedef MENUITEMINFOW MENUITEMINFO;
typedef LPMENUITEMINFOW LPMENUITEMINFO;




typedef MENUITEMINFOA const *LPCMENUITEMINFOA;
typedef MENUITEMINFOW const *LPCMENUITEMINFOW;

typedef LPCMENUITEMINFOW LPCMENUITEMINFO;




  WINUSERAPI
  BOOL
 
GetMenuItemInfoA(
    HMENU,
    UINT,
    BOOL,
    LPMENUITEMINFOA
    );

 WINUSERAPI
  BOOL
 
GetMenuItemInfoW(
    HMENU,
    UINT,
    BOOL,
    LPMENUITEMINFOW
    );
# 1480 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

SetMenuItemInfoA(
    HMENU,
    UINT,
    BOOL,
    LPCMENUITEMINFOA
    );
WINUSERAPI
BOOL

SetMenuItemInfoW(
    HMENU,
    UINT,
    BOOL,
    LPCMENUITEMINFOW
    );
# 1538 "/pgcc/include/winuser.h"
typedef struct tagACCEL {
    BYTE fVirt;
    WORD key;
    WORD cmd;
        WORD pad;
} ACCEL, *LPACCEL;


HACCEL

LoadAcceleratorsA(
    HINSTANCE hInstance,
    LPCSTR lpTableName);

HACCEL

LoadAcceleratorsW(
    HINSTANCE hInstance,
    LPCWSTR lpTableName);







HACCEL

CreateAcceleratorTableA(
    LPACCEL, int);

HACCEL

CreateAcceleratorTableW(
    LPACCEL, int);






BOOL

DestroyAcceleratorTable(
    HACCEL hAccel);




BOOL

SetSysColors(
    int cElements,
    const INT * lpaElements,
    const COLORREF * lpaRgbValues);




BOOL

SetRect(
    LPRECT lprc,
    int xLeft,
    int yTop,
    int xRight,
    int yBottom);

BOOL

SetRectEmpty(
    LPRECT lprc);

BOOL

CopyRect(
    LPRECT lprcDst,
    const RECT *lprcSrc);

BOOL

InflateRect(
    LPRECT lprc,
    int dx,
    int dy);

BOOL

IntersectRect(
    LPRECT lprcDst,
    const RECT *lprcSrc1,
    const RECT *lprcSrc2);

BOOL

UnionRect(
    LPRECT lprcDst,
    const RECT *lprcSrc1,
    const RECT *lprcSrc2);

BOOL

OffsetRect(
    LPRECT lprc,
    int dx,
    int dy);

BOOL

IsRectEmpty(
    const RECT *lprc);

BOOL

EqualRect(
    const RECT *lprc1,
    const RECT *lprc2);

BOOL

PtInRect(
    const RECT *lprc,
    POINT pt);

BOOL

SubtractRect(
    LPRECT prcDst,
    const RECT *prcSrc1,
    const RECT *prcSrc2);




int

MapWindowPoints(
    HWND hWndFrom,
    HWND hWndTo,
    LPPOINT lpPoints,
    UINT cPoints);

HWND

WindowFromPoint(
    POINT Point);

HWND

ChildWindowFromPoint(
    HWND hWndParent,
    POINT Point);

BOOL

ClientToScreen(
    HWND hWnd,
    LPPOINT lpPoint);

BOOL

ScreenToClient(
    HWND hWnd,
    LPPOINT lpPoint);


typedef struct _PAINTSTRUCT {
    HDC hdc;
    BOOL fErase;
    RECT rcPaint;
    BOOL fRestore;
    BOOL fIncUpdate;
    BYTE rgbReserved[32];
} PAINTSTRUCT;

typedef PAINTSTRUCT *LPPAINTSTRUCT;
typedef PAINTSTRUCT *PPAINTSTRUCT;
typedef const PAINTSTRUCT *LPCPAINTSTRUCT;
typedef const PAINTSTRUCT *PCPAINTSTRUCT;



BOOL

SetWindowTextA(
    HWND hWnd,
    LPCSTR lpString);

BOOL

SetWindowTextW(
    HWND hWnd,
    LPCWSTR lpString);







int

GetWindowTextA(
    HWND hWnd,
    LPSTR lpString,
    int nMaxCount);

int

GetWindowTextW(
    HWND hWnd,
    LPWSTR lpString,
    int nMaxCount);
# 1759 "/pgcc/include/winuser.h"
HDC

BeginPaint (
    HWND hwnd,
    LPPAINTSTRUCT pps
    );

BOOL

EndPaint (
    HWND hwnd,
    LPPAINTSTRUCT pps
    );

BOOL

GetUpdateRect(
    HWND hWnd,
    LPRECT lpRect,
    BOOL bErase);

int

GetUpdateRgn(
    HWND hWnd,
    HRGN hRgn,
    BOOL bErase);

WINUSERAPI
HDC

GetDCEx(
    HWND hWnd ,
    HRGN hrgnClip,
    DWORD flags);
# 1810 "/pgcc/include/winuser.h"
HWND

GetDesktopWindow(
        void
        );
# 1834 "/pgcc/include/winuser.h"
typedef struct tagCOPYDATASTRUCT {
    DWORD dwData;
    DWORD cbData;
    PVOID lpData;
} COPYDATASTRUCT, *PCOPYDATASTRUCT;


BOOL

IsWindow(
    HWND hWnd);

BOOL

IsWindowVisible(
    HWND hWnd);
# 1870 "/pgcc/include/winuser.h"
HWND

CreateWindowExA(
    DWORD dwExStyle,
    LPCSTR lpClassName,
    LPCSTR lpWindowName,
    DWORD dwStyle,
    int X,
    int Y,
    int nWidth,
    int nHeight,
    HWND hWndParent ,
    HMENU hMenu,
    HINSTANCE hInstance,
    LPVOID lpParam);

HWND

CreateWindowExW(
    DWORD dwExStyle,
    LPCWSTR lpClassName,
    LPCWSTR lpWindowName,
    DWORD dwStyle,
    int X,
    int Y,
    int nWidth,
    int nHeight,
    HWND hWndParent ,
    HMENU hMenu,
    HINSTANCE hInstance,
    LPVOID lpParam);
# 1926 "/pgcc/include/winuser.h"
BOOL

DestroyWindow (
    HWND hwnd
    );
# 1961 "/pgcc/include/winuser.h"
WINUSERAPI
LRESULT

CallWindowProcA(
    FARPROC lpPrevWndFunc,
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
WINUSERAPI
LRESULT

CallWindowProcW(
    FARPROC lpPrevWndFunc,
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
# 1988 "/pgcc/include/winuser.h"
DWORD

GetWindowThreadProcessId(
    HWND hWnd,
    LPDWORD lpdwProcessId);

WINUSERAPI
UINT

GetDoubleClickTime (void);


int

GetSystemMetrics(
    int nIndex);


WINUSERAPI
DWORD

GetClassLongA(
    HWND hWnd,
    int nIndex);


WINUSERAPI
DWORD

GetClassLongW(
    HWND hWnd,
    int nIndex);
# 2028 "/pgcc/include/winuser.h"
WINUSERAPI
DWORD

SetClassLongA(
    HWND hWnd,
    int nIndex,
    LONG dwNewLong);


WINUSERAPI
DWORD

SetClassLongW(
    HWND hWnd,
    int nIndex,
    LONG dwNewLong);
# 2060 "/pgcc/include/winuser.h"
ATOM

RegisterClassA(
    const WNDCLASSA *lpWndClass
    );

ATOM

RegisterClassW (
    const WNDCLASSW *lpWndClass
    );
# 2081 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

UnregisterClassA(
    LPCSTR lpClassName,
    HINSTANCE hInstance);


WINUSERAPI
BOOL

UnregisterClassW(
    LPCWSTR lpClassName,
    HINSTANCE hInstance);
# 2103 "/pgcc/include/winuser.h"
BOOL

GetClassInfoA(
    HINSTANCE hInstance,
    LPCSTR lpClassName,
    LPWNDCLASSA lpWndClass);

BOOL

GetClassInfoW(
    HINSTANCE hInstance,
    LPCWSTR lpClassName,
    LPWNDCLASSW lpWndClass);
# 2125 "/pgcc/include/winuser.h"
BOOL

EnableWindow(
    HWND hWnd,
    BOOL bEnable);

BOOL

IsWindowEnabled(
    HWND hWnd);
# 2180 "/pgcc/include/winuser.h"
DWORD

GetSysColor(
    int nIndex);

HDC

GetDC (
    HWND hwnd
    );


HDC

GetWindowDC (
    HWND hwnd
    );

int

ReleaseDC (
    HWND hwnd,
    HDC hdc
    );







BOOL

GetMouseMovePoints(
        PPOINT pptBuf,
        UINT nBufPoints,
        UINT *pnPointsRetrieved
        );
# 2230 "/pgcc/include/winuser.h"
void

mouse_event(
        DWORD dwFlags,
        DWORD dx,
        DWORD dy,
        DWORD cButtons,
        DWORD dwExtraInfo);



typedef struct tagMOUSEINPUT {
    LONG dx;
    LONG dy;
    DWORD mouseData;
    DWORD dwFlags;
    DWORD time;
    DWORD dwExtraInfo;
} MOUSEINPUT, *PMOUSEINPUT, * LPMOUSEINPUT;

typedef struct tagKEYBDINPUT {
    WORD wVk;
    WORD wScan;
    DWORD dwFlags;
    DWORD time;
    DWORD dwExtraInfo;
} KEYBDINPUT, *PKEYBDINPUT, * LPKEYBDINPUT;

typedef struct tagHARDWAREINPUT {
    DWORD uMsg;
    WORD wParamL;
    WORD wParamH;
    DWORD dwExtraInfo;
} HARDWAREINPUT, *PHARDWAREINPUT, * LPHARDWAREINPUT;





typedef struct tagINPUT {
    DWORD type;
    union
    {
        MOUSEINPUT mi;
        KEYBDINPUT ki;
                HARDWAREINPUT hi;
    };
} INPUT, *PINPUT, * LPINPUT;


WINUSERAPI
UINT

SendInput(
        UINT nInputs,
        LPINPUT pInputs,
        int cbSize
        );







int

TranslateAcceleratorA(
    HWND hWnd,
    HACCEL hAccTable,
    LPMSG lpMsg);

int

TranslateAcceleratorW(
    HWND hWnd,
    HACCEL hAccTable,
    LPMSG lpMsg);
# 2320 "/pgcc/include/winuser.h"
void

SystemIdleTimerReset(
        void
        );





LRESULT

DefWindowProcA(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);

LRESULT

DefWindowProcW(
    HWND hWnd,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
# 2368 "/pgcc/include/winuser.h"
LONG

GetWindowLongA(
    HWND hWnd,
    int nIndex);

LONG

GetWindowLongW(
    HWND hWnd,
    int nIndex);







LONG

SetWindowLongA(
    HWND hWnd,
    int nIndex,
    LONG dwNewLong);

LONG

SetWindowLongW(
    HWND hWnd,
    int nIndex,
    LONG dwNewLong);
# 2426 "/pgcc/include/winuser.h"
BOOL

IsChild(
    HWND hWndParent,
    HWND hWnd);


BOOL

ShowWindow (
    HWND hwnd,
    INT nCmdShow
    );

BOOL

UpdateWindow (
    HWND hwnd
    );

HWND

SetParent (
    HWND hwnd,
    HWND hwndParent
    );

HWND

GetParent (
    HWND hwnd
    );

WINUSERAPI
HWND

FindWindowA(
    LPCSTR lpClassName ,
    LPCSTR lpWindowName);
WINUSERAPI
HWND

FindWindowW(
    LPCWSTR lpClassName ,
    LPCWSTR lpWindowName);







typedef BOOL (* WNDENUMPROC)(HWND, LPARAM);

BOOL

EnumWindows(
    WNDENUMPROC lpEnumFunc,
    LPARAM lParam);



int

GetClassNameA(
    HWND hWnd,
    LPSTR lpClassName,
    int nMaxCount);

int

GetClassNameW(
    HWND hWnd,
    LPWSTR lpClassName,
    int nMaxCount);
# 2544 "/pgcc/include/winuser.h"
int

MessageBoxA(
    HWND hWnd ,
    LPCSTR lpText,
    LPCSTR lpCaption,
    UINT uType);

int

MessageBoxW(
    HWND hWnd ,
    LPCWSTR lpText,
    LPCWSTR lpCaption,
    UINT uType);
# 2567 "/pgcc/include/winuser.h"
BOOL

MessageBeep(
    UINT uType);




BOOL

CreateCaret(
    HWND hWnd,
    HBITMAP hBitmap,
    int nWidth,
    int nHeight);

BOOL

DestroyCaret(
    void);

BOOL

HideCaret(
    HWND hWnd);

BOOL

ShowCaret(
    HWND hWnd);

BOOL

SetCaretPos(
    int X,
    int Y);

BOOL

GetCaretPos(
    LPPOINT lpPoint);


BOOL

SetCaretBlinkTime(
        UINT uMSeconds
        );

UINT

GetCaretBlinkTime(
        void
        );




HWND

SetActiveWindow(
        HWND hWnd);

HWND

GetForegroundWindow(
        void);

BOOL

SetForegroundWindow(
        HWND hWnd);


HWND

SetFocus(
    HWND hWnd
    );

HWND

GetActiveWindow(
    void
    );

HWND

GetFocus(
    void
    );





WINUSERAPI
HKL

GetKeyboardLayout(
    DWORD dwThreadId
);






SHORT

GetAsyncKeyState(
    int vKey);

SHORT

GetKeyState(
    int nVirtKey);

WINUSERAPI
void

keybd_event(
    BYTE bVk,
    BYTE bScan,
    DWORD dwFlags,
    DWORD dwExtraInfo);


WINUSERAPI
BOOL

PostKeybdMessage(
        HWND hwnd,
        UINT VKey,
        UINT KeyStateFlags,
        UINT cCharacters,
        UINT *pShiftStateBuffer,
        UINT *pCharacterBuffer
        );




WINUSERAPI
BOOL

GetKeyboardLayoutNameA(
    LPSTR pwszKLID);
WINUSERAPI
BOOL

GetKeyboardLayoutNameW(
    LPWSTR pwszKLID);







WINUSERAPI
UINT

MapVirtualKeyA(
    UINT uCode,
    UINT uMapType);

WINUSERAPI
UINT

MapVirtualKeyW(
    UINT uCode,
    UINT uMapType);
# 3002 "/pgcc/include/winuser.h"
typedef struct tagNMHDR
{
    HWND hwndFrom;
    UINT idFrom;
    UINT code;
} NMHDR;
typedef NMHDR * LPNMHDR;
# 3040 "/pgcc/include/winuser.h"
typedef struct tagMEASUREITEMSTRUCT {
    UINT CtlType;
    UINT CtlID;
    UINT itemID;
    UINT itemWidth;
    UINT itemHeight;
    UINT itemData;
} MEASUREITEMSTRUCT, *PMEASUREITEMSTRUCT, *LPMEASUREITEMSTRUCT;




typedef struct tagDRAWITEMSTRUCT {
    UINT CtlType;
    UINT CtlID;
    UINT itemID;
    UINT itemAction;
    UINT itemState;
    HWND hwndItem;
    HDC hDC;
    RECT rcItem;
    DWORD itemData;
} DRAWITEMSTRUCT, *PDRAWITEMSTRUCT, *LPDRAWITEMSTRUCT;




typedef struct tagDELETITEMSTRUCT {
    UINT CtlType;
    UINT CtlID;
    UINT itemID;
    HWND hwndItem;
    UINT itemData;
} DELETEITEMSTRUCT, *PDELETEITEMSTRUCT, *LPDELETEITEMSTRUCT;

typedef struct tagCOMPAREITEMSTRUCT {
    UINT CtlType;
    UINT CtlID;
    HWND hwndItem;
    UINT itemID1;
    DWORD itemData1;
    UINT itemID2;
    DWORD itemData2;
    DWORD dwLocaleId;
} COMPAREITEMSTRUCT, *PCOMPAREITEMSTRUCT, *LPCOMPAREITEMSTRUCT;
# 3212 "/pgcc/include/winuser.h"
typedef struct tagSCROLLINFO
{
    UINT cbSize;
    UINT fMask;
    int nMin;
    int nMax;
    UINT nPage;
    int nPos;
    int nTrackPos;
} SCROLLINFO, *LPSCROLLINFO;
typedef SCROLLINFO const *LPCSCROLLINFO;

WINUSERAPI
int

SetScrollInfo(
        HWND,
        int,
        LPCSCROLLINFO,
        BOOL);


WINUSERAPI
BOOL

GetScrollInfo(
        HWND,
        int,
        LPSCROLLINFO
        );


int

SetScrollPos(
        HWND hwnd,
        int fnBar,
        int nPos,
        BOOL bRedraw
        );


BOOL

SetScrollRange(
HWND hwnd,
        int fnBar,
        int nMinPos,
        int nMaxPos,
        BOOL bRedraw
        );
# 3306 "/pgcc/include/winuser.h"
# 1 "/pgcc/include/pshpack2.h" 1
# 30 "/pgcc/include/pshpack2.h"
#pragma pack(2)
# 3307 "/pgcc/include/winuser.h" 2
# 3333 "/pgcc/include/winuser.h"
typedef struct {
    DWORD style;
    DWORD dwExtendedStyle;
    WORD cdit;
    short x;
    short y;
    short cx;
    short cy;
} DLGTEMPLATE;
typedef DLGTEMPLATE *LPDLGTEMPLATEA;
typedef DLGTEMPLATE *LPDLGTEMPLATEW;

typedef LPDLGTEMPLATEW LPDLGTEMPLATE;



typedef const DLGTEMPLATE *LPCDLGTEMPLATEA;
typedef const DLGTEMPLATE *LPCDLGTEMPLATEW;

typedef LPCDLGTEMPLATEW LPCDLGTEMPLATE;







typedef struct {
    DWORD style;
    DWORD dwExtendedStyle;
    short x;
    short y;
    short cx;
    short cy;
    WORD id;
} DLGITEMTEMPLATE;
typedef DLGITEMTEMPLATE *PDLGITEMTEMPLATEA;
typedef DLGITEMTEMPLATE *PDLGITEMTEMPLATEW;

typedef PDLGITEMTEMPLATEW PDLGITEMTEMPLATE;



typedef DLGITEMTEMPLATE *LPDLGITEMTEMPLATEA;
typedef DLGITEMTEMPLATE *LPDLGITEMTEMPLATEW;

typedef LPDLGITEMTEMPLATEW LPDLGITEMTEMPLATE;




# 1 "/pgcc/include/poppack.h" 1
# 34 "/pgcc/include/poppack.h"
#pragma pack()
# 3385 "/pgcc/include/winuser.h" 2
# 3623 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

IsDialogMessageA(
    HWND hDlg,
    LPMSG lpMsg);

WINUSERAPI
BOOL

IsDialogMessageW(
    HWND hDlg,
    LPMSG lpMsg);







WINUSERAPI
HWND

CreateDialogIndirectParamA(
    HINSTANCE hInstance,
    LPCDLGTEMPLATEA lpTemplate,
    HWND hWndParent,
    DLGPROC lpDialogFunc,
    LPARAM dwInitParam);
WINUSERAPI
HWND

CreateDialogIndirectParamW(
    HINSTANCE hInstance,
    LPCDLGTEMPLATEW lpTemplate,
    HWND hWndParent,
    DLGPROC lpDialogFunc,
    LPARAM dwInitParam);
# 3733 "/pgcc/include/winuser.h"
int

DialogBoxIndirectParamA(
    HINSTANCE hInstance,
    LPCDLGTEMPLATEA hDialogTemplate,
    HWND hWndParent ,
    DLGPROC lpDialogFunc,
    LPARAM dwInitParam);
int

DialogBoxIndirectParamW(
    HINSTANCE hInstance,
    LPCDLGTEMPLATEW hDialogTemplate,
    HWND hWndParent ,
    DLGPROC lpDialogFunc,
    LPARAM dwInitParam);
# 3817 "/pgcc/include/winuser.h"
BOOL

EndDialog(
    HWND hDlg,
    int nResult);

HWND

GetNextDlgGroupItem (
    HWND hDlg,
    HWND hCtl,
    BOOL bPrevious
    );

HWND

GetNextDlgTabItem (
    HWND hDlg,
    HWND hCtl,
    BOOL bPrevious
    );

int

GetDlgCtrlID (
    HWND hWnd
    );

long

GetDialogBaseUnits(
        void
        );

BOOL

MapDialogRect (
    HWND hwnd,
    LPRECT prc
    );


HWND

GetDlgItem (
    HWND hDlg,
    int iCtrlID
    );

WINUSERAPI
LRESULT

DefDlgProcA(
    HWND hDlg,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
WINUSERAPI
LRESULT

DefDlgProcW(
    HWND hDlg,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
# 3894 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

SetDlgItemInt(
    HWND hDlg,
    int nIDDlgItem,
    UINT uValue,
    BOOL bSigned);

WINUSERAPI
UINT

GetDlgItemInt(
    HWND hDlg,
    int nIDDlgItem,
    BOOL *lpTranslated,
    BOOL bSigned);

BOOL

CheckRadioButton(
    HWND hDlg,
    int nIDFirstButton,
    int nIDLastButton,
    int nIDCheckButton);

WINUSERAPI
LONG

SendDlgItemMessageA(
    HWND hDlg,
    int nIDDlgItem,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);
WINUSERAPI
LONG

SendDlgItemMessageW(
    HWND hDlg,
    int nIDDlgItem,
    UINT Msg,
    WPARAM wParam,
    LPARAM lParam);






WINUSERAPI
BOOL

SetDlgItemTextA(
    HWND hDlg,
    int nIDDlgItem,
    LPCSTR lpString);
WINUSERAPI
BOOL

SetDlgItemTextW(
    HWND hDlg,
    int nIDDlgItem,
    LPCWSTR lpString);






WINUSERAPI
UINT

GetDlgItemTextA(
    HWND hDlg,
    int nIDDlgItem,
    LPSTR lpString,
    int nMaxCount);
WINUSERAPI
UINT

GetDlgItemTextW(
    HWND hDlg,
    int nIDDlgItem,
    LPWSTR lpString,
    int nMaxCount);
# 4019 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

OpenClipboard(
    HWND hWndNewOwner);

WINUSERAPI
BOOL

CloseClipboard(
    void);

WINUSERAPI
HWND

GetClipboardOwner(
    void);

WINUSERAPI
HANDLE

SetClipboardData(
    UINT uFormat,
    HANDLE hMem);

WINUSERAPI
HANDLE

    GetClipboardData(
    UINT uFormat);

WINUSERAPI
HANDLE

    GetClipboardDataAlloc(
    UINT uFormat);



WINUSERAPI
UINT

RegisterClipboardFormatA(
    LPCSTR lpszFormat);


WINUSERAPI
UINT

RegisterClipboardFormatW(
    LPCWSTR lpszFormat);







WINUSERAPI
int

CountClipboardFormats(
    void);

WINUSERAPI
UINT

EnumClipboardFormats(
    UINT format);


WINUSERAPI
int

GetClipboardFormatNameA(
    UINT format,
    LPSTR lpszFormatName,
    int cchMaxCount);


WINUSERAPI
int

GetClipboardFormatNameW(
    UINT format,
    LPWSTR lpszFormatName,
    int cchMaxCount);







WINUSERAPI
BOOL

EmptyClipboard(
    void);

WINUSERAPI
BOOL

IsClipboardFormatAvailable(
    UINT format);

WINUSERAPI
int

GetPriorityClipboardFormat(
    UINT *paFormatPriorityList,
    int cFormats);

WINUSERAPI
HWND

GetOpenClipboardWindow(
    void);
# 4198 "/pgcc/include/winuser.h"
HCURSOR

SetCursor(
    HCURSOR hCursor);
# 4232 "/pgcc/include/winuser.h"
WINUSERAPI
HCURSOR

LoadCursorA(
    HINSTANCE hInstance,
    LPCSTR lpCursorName);
WINUSERAPI
HCURSOR

LoadCursorW(
    HINSTANCE hInstance,
    LPCWSTR lpCursorName);
# 4274 "/pgcc/include/winuser.h"
WINUSERAPI
int

ShowCursor(
    BOOL bShow);

WINUSERAPI
BOOL

SetCursorPos(
    int X,
    int Y);

WINUSERAPI
HCURSOR

SetCursor(
    HCURSOR hCursor);

WINUSERAPI
BOOL

GetCursorPos(
    LPPOINT lpPoint);

WINUSERAPI
BOOL

ClipCursor(
    const RECT *lpRect);

WINUSERAPI
BOOL

GetClipCursor(
    LPRECT lpRect);

WINUSERAPI
HCURSOR

GetCursor(
    void);
# 4329 "/pgcc/include/winuser.h"
UINT SetTimer(
    HWND hwnd,
    UINT idTimer,
    UINT uTimeOut,
    TIMERPROC pfnTimerProc);

BOOL KillTimer(
    HWND hwnd,
    UINT idEvent);




DWORD

GetKeyboardStatus(
        void
        );

BOOL

EnableHardwareKeyboard(
        BOOL fEnable
        );
# 4370 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

RegisterHotKey(
        HWND hWnd,
        int id,
        UINT fsModifiers,
        UINT vk
        );

WINUSERAPI
BOOL

UnregisterHotKey(
        HWND hWnd,
        int id
        );

WINUSERAPI
BOOL

AllKeys(
        BOOL bAllKeys);
# 4434 "/pgcc/include/winuser.h"
WINUSERAPI
BOOL

SystemParametersInfoA(
    UINT uiAction,
    UINT uiParam,
    PVOID pvParam,
    UINT fWinIni);

WINUSERAPI
BOOL

SystemParametersInfoW(
    UINT uiAction,
    UINT uiParam,
    PVOID pvParam,
    UINT fWinIni);
# 4506 "/pgcc/include/winuser.h"
HICON

LoadIconA(
    HINSTANCE hInstance,
    LPCSTR lpIconName);

HICON

LoadIconW(
    HINSTANCE hInstance,
    LPCWSTR lpIconName);







BOOL

DestroyIcon(
    HICON hIcon);






BOOL

DrawIconEx(
    HDC hdc,
    int xLeft,
    int yTop,
    HICON hIcon,
    int cxWidth,
    int cyWidth,
    UINT istepIfAniCur,
    HBRUSH hbrFlickerFreeDraw,
    UINT diFlags);






typedef struct _ICONINFO {
    BOOL fIcon;
    DWORD xHotspot;
    DWORD yHotspot;
    HBITMAP hbmMask;
    HBITMAP hbmColor;
} ICONINFO;
typedef ICONINFO *PICONINFO;


HICON

CreateIconIndirect(
    PICONINFO piconinfo);
# 4585 "/pgcc/include/winuser.h"
HANDLE

LoadImageA(
    HINSTANCE,
    LPCSTR,
    UINT,
    int,
    int,
    UINT);

HANDLE

LoadImageW(
    HINSTANCE,
    LPCWSTR,
    UINT,
    int,
    int,
    UINT);
# 4613 "/pgcc/include/winuser.h"
WINUSERAPI
HCURSOR

CreateCursor(
    HINSTANCE hInst,
    int xHotSpot,
    int yHotSpot,
    int nWidth,
    int nHeight,
    const void *pvANDPlane,
    const void *pvXORPlane);

WINUSERAPI
BOOL

DestroyCursor(
    HCURSOR hCursor);
# 3 "/src/pvis/main/pvis.rc" 2
# 1 "/pgcc/include/winver.h" 1
# 124 "/pgcc/include/winver.h"
typedef struct tagVS_FIXEDFILEINFO
{
    DWORD dwSignature;
    DWORD dwStrucVersion;
    DWORD dwFileVersionMS;
    DWORD dwFileVersionLS;
    DWORD dwProductVersionMS;
    DWORD dwProductVersionLS;
    DWORD dwFileFlagsMask;
    DWORD dwFileFlags;
    DWORD dwFileOS;
    DWORD dwFileType;
    DWORD dwFileSubtype;
    DWORD dwFileDateMS;
    DWORD dwFileDateLS;
} VS_FIXEDFILEINFO;



DWORD

VerFindFileA(
        DWORD uFlags,
        LPSTR szFileName,
        LPSTR szWinDir,
        LPSTR szAppDir,
        LPSTR szCurDir,
        PUINT lpuCurDirLen,
        LPSTR szDestDir,
        PUINT lpuDestDirLen
        );
DWORD

VerFindFileW(
        DWORD uFlags,
        LPWSTR szFileName,
        LPWSTR szWinDir,
        LPWSTR szAppDir,
        LPWSTR szCurDir,
        PUINT lpuCurDirLen,
        LPWSTR szDestDir,
        PUINT lpuDestDirLen
        );






DWORD

VerInstallFileA(
        DWORD uFlags,
        LPSTR szSrcFileName,
        LPSTR szDestFileName,
        LPSTR szSrcDir,
        LPSTR szDestDir,
        LPSTR szCurDir,
        LPSTR szTmpFile,
        PUINT lpuTmpFileLen
        );
DWORD

VerInstallFileW(
        DWORD uFlags,
        LPWSTR szSrcFileName,
        LPWSTR szDestFileName,
        LPWSTR szSrcDir,
        LPWSTR szDestDir,
        LPWSTR szCurDir,
        LPWSTR szTmpFile,
        PUINT lpuTmpFileLen
        );







DWORD

GetFileVersionInfoSizeA(
        LPSTR lptstrFilename,
        LPDWORD lpdwHandle
        );

DWORD

GetFileVersionInfoSizeW(
        LPWSTR lptstrFilename,
        LPDWORD lpdwHandle
        );







BOOL

GetFileVersionInfoA(
        LPSTR lptstrFilename,
        DWORD dwHandle,
        DWORD dwLen,
        LPVOID lpData
        );

BOOL

GetFileVersionInfoW(
        LPWSTR lptstrFilename,
        DWORD dwHandle,
        DWORD dwLen,
        LPVOID lpData
        );






DWORD

VerLanguageNameA(
        DWORD wLang,
        LPSTR szLang,
        DWORD nSize
        );
DWORD

VerLanguageNameW(
        DWORD wLang,
        LPWSTR szLang,
        DWORD nSize
        );






BOOL

VerQueryValueA(
        const LPVOID pBlock,
        LPSTR lpSubBlock,
        LPVOID * lplpBuffer,
        PUINT puLen
        );
BOOL

VerQueryValueW(
        const LPVOID pBlock,
        LPWSTR lpSubBlock,
        LPVOID * lplpBuffer,
        PUINT puLen
        );
# 4 "/src/pvis/main/pvis.rc" 2

# 1 "/src/pvis/main/resource.h" 1
# 6 "/src/pvis/main/pvis.rc" 2
# 22 "/src/pvis/main/pvis.rc"
LANGUAGE 0x09, 0x01

101 ICON DISCARDABLE "pvis.ico"

STRINGTABLE DISCARDABLE
BEGIN
 1 "PVis"
END
