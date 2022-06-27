***
README.md - **this file**
***
Reworked [CUPS](https://github.com/OpenPrinting/cups) version adaptated for Ubuntu 20.04.4 LTS
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
sudo dpkg -i packagename.deb

After this steps usb printer (EPSON/Olivetty) will be approves (or not) sended to him bytes
***
