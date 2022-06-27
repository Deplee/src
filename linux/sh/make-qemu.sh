#!/bin/bash -
#===============================================================================
#
#          FILE: make-qemu.sh
#
#         USAGE: ./make-qemu.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: 1zuna <dkapitsev@gmail.com>
#  ORGANIZATION:
#       CREATED: 06/25/2022 01:13
#      REVISION:  ---
#===============================================================================

read -p "Enter option: " option

	case $option in
		# make *.img
		make | m)
			echo "==>Creating IMG..."
			read -p "Enter IMG PATH: " imgpath
			read -p "Enter IMG NAME: " imgname
			read -p "Ener IMG SIZE: " imgsize
			qemu-img create -f qcow2 $imgpath/${imgname}.img ${imgsize}G
			exit 0
			;;
	esac
