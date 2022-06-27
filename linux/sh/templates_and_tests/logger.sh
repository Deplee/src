#!/usr/bin/env bash

function __msg_error() {
    [[ "${ERROR}" == "1" ]] && echo -e "[ERROR]: $*"
}

function __msg_debug() {
    #[[ "${DEBUG}" == "1" ]] &&  echo "[DEBUG]: $*"
echo "[DEBUG]: $*" | tee -a /home/izuna/log > /dev/null 2>&1
}

function __msg_info() {
    [[ "${INFO}" == "1" ]] && echo -e "[INFO]: $*"
}

#__msg_error "File could not be found. Cannot proceed"

#__msg_debug "Starting script execution with 276MB of available RAM"

ERROR=1
if [ "${ERROR}" -eq 1 ]; then
	__msg_debug "$*"
fi
