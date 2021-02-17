@setlocal
@set/PNAME=What do you want to name the disk 
@set/PSIZE=How big would you like the disk to be? (In Gb) 
@qemu\qemu-img create -f raw "%USERPROFILE%\Desktop\%NAME%.img" %SIZE%G
