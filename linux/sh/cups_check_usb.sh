#!/bin/bash -
#===============================================================================
#
#          FILE: cups_check_usb.sh
#
#         USAGE: ./cups_check_usb.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: 1zuna <dkapitsev@gmail.com>
#  ORGANIZATION:
#       CREATED: 05/28/2022 13:19
#      REVISION:  ---
#===============================================================================

msg(){
        echo >&2 -e "${1-}"
}

msg "---> CUPS USB INFO"

/usr/lib/cups/backend/usb

echo $1
msg "=> Done"
