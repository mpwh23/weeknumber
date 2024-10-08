@echo off

set DATE=01x01x2022

REM get days from jan 1st to act date

if %DATE:~3,2% == 01 set /a (days=0)
if %DATE:~3,2% == 02 set /a (days=31)
if %DATE:~3,2% == 03 set /a (days=59)
if %DATE:~3,2% == 04 set /a (days=90)
if %DATE:~3,2% == 05 set /a (days=120)
if %DATE:~3,2% == 06 set /a (days=151)
if %DATE:~3,2% == 07 set /a (days=181)
if %DATE:~3,2% == 08 set /a (days=212)
if %DATE:~3,2% == 09 set /a (days=243)
if %DATE:~3,2% == 10 set /a (days=273)
if %DATE:~3,2% == 11 set /a (days=304)
if %DATE:~3,2% == 12 set /a (days=334)

SET /a rule = %DATE:~6,4% %% 4
SET /a exeption1=%DATE:~6,4% %% 100
SET /a exeption2=%DATE:~6,4% %% 400

set /a leap=0
IF %rule%==0 set /a leap=1
IF %exeption1%==0 set /a leap=0
IF %exeption2%==0 set /a leap=1

if %DATE:~3,2% GTR 2 set /a (days+=%leap%)

set /a days+=%DATE:~0,2%

REM first day of year
set /a e4=(%DATE:~6,4%/4)
set /a myif=%DATE:~6,4% %% 4
if NOT %myif% == 0 set /a e4+=1

set /a e100=(%DATE:~6,4%/100)
set /a myif=%DATE:~6,4% %% 100
if NOT %myif% == 0 set /a e100+=1

set /a e400=(%DATE:~6,4%/400)
set /a myif=%DATE:~6,4% %% 400
if NOT %myif% == 0 set /a e400+=1

set /a (fd=(%DATE:~6,4% * 365 + %e400% - %e100% + %e4% - 2) %% 7)
REM fd -> MON = 0, SUN = 6

set /a (days+=(%fd%-1))

set /a (kw=%days%/7 + 1)

if %fd% GTR 3 set /a kw+=-1

if %kw% LSS 10 set (kw=0%kw%)

echo %kw%


REM https://de.wikipedia.org/wiki/Woche
SET /a iso=0
if %DATE:~3,2% == 01 set /a (iso=1)
if %DATE:~0,2% LSS 4 set /a (iso+=1)
REM if 2 -> exception jan

if %DATE:~3,2% == 12 set /a (iso=3)
if %DATE:~0,2% GTR 28 set /a (iso+=1)
REM if 4 -> exception dec

echo %iso%
