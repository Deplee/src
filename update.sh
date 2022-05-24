#!/bin//bash

usage(){
	cat << EOF

	Usage: "${BASH_SOURCE[0]}"

	-h | --help	Print help
	-s | --system	System update & upgrade
	-c | --clear	Cleanup package caches
	-l | --list	List of installed packages

	Examples:

	Help: ./update.sh -h OR ./update.sh --help
		
	System update & upgrade: sudo ./update.sh -s OR sudo ./update.sh --system

	Cleanup packages cache: sudo ./update.sh -c OR sudo ./update.sh --clear

	List of installed packages: sudo ./update.sh -l OR sudo ./update.sh --list OR ./update.sh -l OR ./update.sh --list

EOF
}

msg(){
	echo >&2 -e "${1-}"
}

cleanup(){
	msg "==> Use -h OR --help for help"
	exit 1
}

parse_params(){
param=''
while [ -n "$1" ]
#while : 
do

case "${1-}" in
    -h | --help) 
	   usage
	   exit 0 ;;
    -s | --system)
	   pacman -Syyu ;;
    -c | --clear)
	   pacman -Sc ;;
    -l | --list)
	   pacman -Q
	   exit 0 ;;
   -p | --off)
	   systemctl poweroff ;;
    -r | --reboot)
	   systemctl reboot ;; 
    -?*) msg "Unknown option: $1"
	    cleanup ;;
    *) break ;;   
esac
	shift
done

#[[ "${1-}" -eq 0 ]] && cleanup

[[ "$@" == " " ]] && cleanup

return 0
#exit 0

}

parse_params "$@"
