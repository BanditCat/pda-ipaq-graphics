set bp=\Storage Card\pgcc
set pp=\src
set pn=hw

"%bp%\bin\gcc" %pp%\%pn%\%pn%.cpp -target=con -o %pp%\%pn%\%pn%.exe -Wl,-s

