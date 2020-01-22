set bp=\Storage Card\pgcc
set pp=\src
set pn=pvisxx

"%bp%\bin\windres" %pp%\%pn%\pvis\pvis.rc -o %pp%\%pn%\objs\pvis.rc.o --include-dir=%pp%\%pn%\pvis

"%bp%\bin\gcc" -I %pp%\%pn%\include -c %pp%\%pn%\pvisxx.cpp -o %pp%\%pn%\objs\pvisxx.o
