#!/bin/bash -
#===============================================================================
#
#          FILE: backup-docs.sh
#
#         USAGE: ./backup-docs.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: 1zuna <dkapitsev@gmail.com>
#  ORGANIZATION:
#       CREATED: 05/20/2022 09:57
#      REVISION:  ---
#===============================================================================

set -Eeuo pipefail
trap _not_found_scripts_dirs SIGINT SIGTERM ERR
trap _not_found_md_dirs SIGINT SIGTERM ERR

RED='\033[0;31m'         #  ${RED}
GREEN='\033[0;32m'      #  ${GREEN}
DEFAULT='\033[0m'       # ${DEFAULT}

scripts_dir_from=${HOME}/.scripts/*.sh
scripts_dir_to=/mnt/HDD/work/Linux/scripts/personal/
scripts_dir_to_b=/mnt/HDD/work_backups/Linux/scripts/personal/

md_dir_from=${HOME}/Documents/MD_docs/*.md
md_dir_to=/mnt/HDD/work/MD_docs/
md_dir_to_b=/mnt/HDD/work_backups/MD_docs/

logfile=/tmp/err_backup-docs.log

msg(){
       	echo >&2 -e "${1-}"
}


get_date()
{
	date +%D_%H:%M:%S | tr -s '_' ' '
}

log(){

	echo "[INFO] [$(get_date)] $@"
}

err(){
	echo "[ERROR] [$(get_date)] $@"
}

warn(){
	echo "[WARNING] [$(get_date)] $@"
}

usage(){
	cat << EOF

	Usage: "${BASH_SOURCE[0]}"

		[-h] | [--help]	Print help
		[-sh]	starting backup *.sh files from variable in "scripts_dir_from" to variable path in "scripts_dir_to" & "scripts_dir_to_b"
		[-md]	starting backup *.md files from variable in "md_dir_from" to variable path in "md_dir_to" & "md_dir_to_b"

	Examples:

		Help: backup -h | backup --help
		Backup *.sh files: backup -sh
		Backup *.md files: backup -md
		Backup *.sh & &.md files: backup -sh -md | backup -md -sh


EOF
}

_not_found_scripts_dirs(){

	if [ ! -d $scripts_dir_to ]; then
        	local exit=255
        	err "Directory $scripts_dir_to or $scripts_dir_to_b not found. Exit code: $exit" >> $logfile
        	trap - SIGINT SIGTERM ERR && msg "${RED} --> Directory $scripts_dir_to or $scripts_dir_to_b not found. Check $logfile ${DEFAULT}" && exit $exit
        elif [ ! -d $scripts_dir_to_b ]; then
        	local exit=255
        	err "Directory $scripts_dir_to or $scripts_dir_to_b not found. Exit code: $exit" >> $logfile
        	trap - SIGINT SIGTERM ERR && msg "${RED} --> Directory $scripts_dir_to or $scripts_dir_to_b not found. Check $logfile ${DEFAULT}" && exit $exit
	else
	msg "${RED}------------------------------------------------------------${DEFAULT}"
       	log "==> Backup *.sh files started..."
        cp $scripts_dir_from $scripts_dir_to && cp $scripts_dir_from $scripts_dir_to_b
        log "==> Backup *.sh files ended..."
        msg "${RED}------------------------------------------------------------${DEFAULT}"
	fi

}

_not_found_md_dirs(){

	if [ ! -d $md_dir_to ]; then
		local exit=254
		err "Directory $md_dir_to or $md_dir_to_b not found. Exit code: $exit" >> $logfile
		trap - SIGINT SIGTERM ERR && msg "${RED} --> Directory $md_dir_to or $md_dir_to_b not found. Check $logfile ${DEFAULT}" && exit $exit
	elif [ ! -d $md_dir_to_b ]; then
		local exit=254
		err "Directory $md_dir_to or $md_dir_to_b not found. Exit code: $exit" >> $logfile
		trap - SIGINT SIGTERM ERR && msg "${RED} --> Directory $md_dir_to or $md_dir_to_b not found. Check $logfile ${DEFAULT}" && exit $exit
	elif [[ -d $md_dir_to && -d $md_dir_to_b ]]; then
        msg "${RED}------------------------------------------------------------${DEFAULT}"
        log "==> Backup *.md files started..."
        cp $md_dir_from $md_dir_to && cp $md_dir_from $md_dir_to_b
        log "==> Backup *.md files ended..."
        msg "${RED}------------------------------------------------------------${DEFAULT}"
	fi
}

main(){

	while [ -n "${1-}" ]
	do
		case "${1-}" in
			-h | --help)
				usage ;;
			-l | --log)
				cat $logfile ;;
			-sh)
				_not_found_scripts_dirs ;;
			-md)
				_not_found_md_dirs ;;
			-?*)
				msg "${RED}------------------------------------------------------------${DEFAULT}"
				msg "${RED} Unknown parameter: $1 Use [-h] or [--help] for help ${DEFAULT}"
				msg "${RED}------------------------------------------------------------${DEFAULT}"
				exit 1
				;;
			*)
				msg "${RED}------------------------------------------------------------${DEFAULT}"
				msg "${RED} --> Interrupted. Use [-h] or [--help] for help ${DEFAULT}"
				msg "${RED}------------------------------------------------------------${DEFAULT}"
				exit 1 ;;
		esac
		shift
	done
		}

main "$@"
