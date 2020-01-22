set pp=\src\pvis
set pn=3frac

\pgcc\cc1plus %pp%\%pn%.c -o %pp%\tmp\%pn%.s -I \pgcc\include -I %pp%\include -I %pp%\%pn% -include \pgcc\fixincl.h -fms-extensions
\pgcc\as %pp%\tmp\%pn%.s -o %pp%\tmp\%pn%.o


