#!/bin/bash

MODEL=$(lpstat -s | grep "usb://EPSON/TM-P2.01" | awk '{print $4}' )
ERRPRNTR=$(lpinfo -v | grep 'direct usb://Unknown/Printer')

[[ $MODEL && $ERRPRNTR == "direct usb://Unknown/Printer" ]] && usb_modeswitch -v 0x1a86 -p 0x7584 -V 0x1a86 > /dev/null 2>&1 && echo -e "\n====$MODEL\====\n====$TEST====\n====$DONE===="
