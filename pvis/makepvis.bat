set pp=\src\pvis
set pn=pvis

\pgcc\cc1plus %pp%\pvis.c -o %pp%\tmp\pvis.s -I \pgcc\include -I %pp%\include -I %pp%\main -include \pgcc\fixincl.h -fms-extensions -DFOR_PV
\pgcc\as %pp%\tmp\pvis.s -o %pp%\tmp\pvis.o

\pgcc\cpp0 %pp%\main\%pn%.rc -o %pp%\tmp\%pn%.rc.p -I \pgcc\include -I %pp%\include -I %pp%\main -include \pgcc\fixincl.h
\pgcc\windres %pp%\tmp\%pn%.rc.p -o %pp%\tmp\%pn%.rc.o --include-dir %pp%\main
