#!/usr/bin/env bash

RED='\033[0;31m'         #  ${RED}
GREEN='\033[0;32m'      #  ${GREEN}
DEFAULT='\033[0m'	# ${DEFAULT}

gd(){
	msg "${GREEN}" | date +%D_%H:%M:%S | tr -s '_' ' ' 
}

msg(){
        echo >&2 -e "${1-}"
}


[[ -z "$@" ]] && msg "${RED} --> Error. Enter command arg." && tput sgr0 && exit 1

$@ | xargs -L1 echo "[$(gd)]" && tput sgr0
