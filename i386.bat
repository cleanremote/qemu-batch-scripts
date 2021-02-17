@echo off
setlocal
echo This script is for i386 systems (32 bit)
echo Only raw images (.raw .iso .img) can be loaded using this script
set/PNAME=What is the name of the HARD DISK? (iso disk next) INCLUDE THE FILE TYPE! Example: .img (It MUST be on your desktop!!)
set/PRAM=How much RAM do you want to give the system in MiB? (512 recommended)

:start
SET choice=
SET/pchoice=Do you want to mount an iso? y,n [N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF /i '%choice%'=='Y' GOTO yes
IF /i '%choice%'=='N' GOTO no
IF '%choice%'=='' GOTO no
ECHO "%choice%" is not valid
ECHO/
GOTO start

:yes
set/PISONAME=What is the name of the iso disk? INCLUDE THE FILE TYPE! Example: .iso (It MUST be on your desktop!!) THIS DISK WILL BE READ ONLY!!
"%USERPROFILE%\Desktop\qemu\qemu-system-i386.exe" -m %RAM% -drive format=raw,file=%USERPROFILE%\desktop\%NAME% -drive format=raw,media=cdrom,readonly,file=%USERPROFILE%\desktop\%ISONAME%
goto :eof

:no
"%USERPROFILE%\Desktop\qemu\qemu-system-i386.exe" -m %RAM% -drive format=raw,file=%USERPROFILE%\desktop\%NAME%
