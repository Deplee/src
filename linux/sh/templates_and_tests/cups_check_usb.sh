#!/bin/bash

msg(){
        echo >&2 -e "${1-}"
}

msg "---> CUPS USB INFO" 

/usr/lib/cups/backend/usb

echo $1
msg "=> Done"
