#!/usr/bin/env bash

# Script name: _dm-helper
# Description: helper-script for the other scripts in the collection
# Dependencies: 
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: Simon Ingelsson

set -euo pipefail

(return 0 2>/dev/null) && sourced=1 || sourced=0
if [[ ${sourced} -eq 0 ]]; then
    echo "This is a helper-script it does not do anything on its own."
    exit 1
fi

get_config() {
  local config_dirs=() 
  local _local_conf
  _local_conf="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")./config" && pwd)"
  if [[ -f "${_local_conf}/config" ]]; then
    config_dirs+=( "${_local_conf}/config"  )
  else 
    config_dirs+=(
    "${HOME}/.config/dmscripts/config"
    "/etc/dmscripts/config"
    )
  fi
  for conf in "${config_dirs[@]}"; do
    if [[ -f ${conf} ]]; then
      echo "${conf}"
      return
      break
    fi
  done
}

