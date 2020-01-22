set bp=\Storage Card\pgcc
set pp=\src
set pn=pvisxx


"%bp%\bin\gcc" -I %pp%\%pn%\include -c %pp%\%pn%\context.cpp -o %pp%\%pn%\objs\context.o
