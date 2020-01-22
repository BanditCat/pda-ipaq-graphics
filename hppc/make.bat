set pp=\src\hppc

\pgcc\cc1plus %pp%\main\main.c -o %pp%\tmp\main.s -I \pgcc\include -I %pp%\main -include \pgcc\fixincl.h -fms-extensions
\pgcc\as %pp%\tmp\main.s -o %pp%\tmp\main.o

\pgcc\cpp0 %pp%\main\hppc.rc -o %pp%\tmp\hppc.rc.p -I \pgcc\include -I %pp%\main -DRC_INVOKED -include \pgcc\fixincl.h
\pgcc\windres %pp%\tmp\hppc.rc.p -o %pp%\tmp\hppc.rc.o --include-dir %pp%\main

\pgcc\ld %pp%\tmp\main.o %pp%\tmp\hppc.rc.o -o %pp%\hppc.exe -L \pgcc\lib -l cpplib -l corelibc -l coredll -l aygshell -l runtime -l portlib
