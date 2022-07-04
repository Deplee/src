#!/bin/bash
#===============================================================================
#
#          FILE: json.sh
#
#         USAGE: ./json.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: David Kapitsev (@1zuna)
#  ORGANIZATION:
#       CREATED: 07/04/2022 14:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error



#-------------------------------------------------------------------------------
# JSON output data format
#-------------------------------------------------------------------------------

hostname=$(hostname)
osname=$(cat /etc/os-release | head -n 1 | cut -b 7- | tr -s '"' " ")

cat <<EOF>test.json
  {
    "hostname": $hostname,
    "os-name": $osname
  }
EOF
