***
Reworked Cups version adaptated for Ubuntu 20.04.4 LTS
***
# Fixes

 + What's new:
   1. addaptated for Ubuntu 20.04.4 LTS
   2. usb printer connection (Reverted USB read limit enforcement change)
        - added **if statement _(bytes)_**
***
# Dependencies

```
make clang cpp (9.4.0.9)
```
***
# Installation

 - cd cups-reworked-david
 - sudo ./configure (if you wanna prefix use ./configure --help etc.)
 - sudo make
 - cd backend/
 - sudo make 
 - sudo make usb
 - sudo make install
 - sudo systemctl restart cups
 - sudo systemctl reboot

After this steps usb printer (EPSON/Olivetty) will be approves (or not) sended to him bytes
***
