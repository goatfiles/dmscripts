#!/usr/bin/env bash


get_config() {
  local config_dirs=() 
  local _local_conf="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")./config" && pwd)"
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
      loaded=1
      break
    fi
  done
}
