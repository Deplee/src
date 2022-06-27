#!/usr//bin/env bash
set -Eeuo pipefail
#trap cleanup SIGINT SIGTERM ERR EXIT
usage() {
        cat << EOF
        USAGE: $(basename "${BASH_SOURCE[0]}") [-h] [-v] -t parameter_value arg1 [arg2...] -d

        Available options:
                -h, --help Print help
                -v, --verbose Print script debug info
                -t         Print curent SHELL
                -d, --date Print current date
EOF
                exit
}

get_date() {
        date +%D_%H:%M | tr -s "_" " "
}
parse_params() {
       gd=''
while :;
do
        case "${1-}" in
                -h | --help) usage ;;
                -v | --verbose) set -x ;;
                -t) cat << EOF
$SHELL
EOF
;;
                -d | --date) gd="${2-}"
                        get_date
                        shift ;;
                -?*) cat << EOF
        Unknown option: $1
        Use -h or --help for help.
EOF
        cleanup
        break ;;
                *) break ;;
        esac
        shift
done
        args=("$@")
        [[ -z "${gd-}" ]] && msg "Missing required parameter: date" && cleanup
        [[ ${#args[@]} -eq 0 ]] && msg "Missing mandatory script arguments" && cleanup
}
cleanup() {
        trap - SIGINT SIGTERM ERR EXIT
        echo "[$(get_date)] =====> Cleanup"
        exit 1
}

msg() {
        echo >&2 -e "${1-}"
}
parse_params "$@"
