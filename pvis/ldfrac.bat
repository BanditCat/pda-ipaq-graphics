set pp=\src\pvis
set pn=frac
set objs=%pp%\tmp\pvis.o %pp%\tmp\pvis.rc.o %pp%\tmp\%pn%.o

\pgcc\ld %objs% -o %pp%\%pn%.exe -L \pgcc\lib -l cpplib -l corelibc -l coredll -l aygshell -l runtime -l portlib



