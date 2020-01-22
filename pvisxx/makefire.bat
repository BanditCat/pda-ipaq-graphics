set bp=\Storage Card\pgcc
set pp=\src
set pn=pvisxx
set sd=fire

"%bp%\bin\gcc" -I %pp%\%pn%\include %pp%\%pn%\%sd%.cpp %pp%\%pn%\objs\pvis.rc.o %pp%\%pn%\objs\pvisxx.o %pp%\%pn%\objs\context.o -o %pp%\%pn%\%sd%.exe
