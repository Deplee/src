#!/bin/bash -
#===============================================================================
#
#          FILE: git.sh
#
#         USAGE: ./git.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 06/30/2022 23:13
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

case $1 in
	-a)
		git add $2
		;;
	-c)	
		#read "" commit
		git commit -m "$2"
		;;
	-r)
		git rm -r --cached $2
		;;
	-p)
		git push origin master
		;;
	*)
		echo "Uknown option $1"
		;;

esac    # --- end of case ---
