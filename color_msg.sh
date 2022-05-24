#!/bin/bash


setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}


RED='\033[0;31m'         #  ${RED}
GREEN='\033[0;32m'      #  ${GREEN}
DEFAULT='\033[0m'	# ${DEFAULT}
msg "RED:${RED} MSG, ${DEFAULT} GREEN: ${GREEN} MSG, ${DEFAULT} DEFAULT: ${DEFAULT} MSG. "


tput sgr0
