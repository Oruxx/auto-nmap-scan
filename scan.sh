#!/usr/bin/bash

# Author: Kian (orux)

error=0
ip=$1
out=$2
typescan=$3


ValidarIP() {
  if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]];then
    return 0
  else
    ip=$(ping $ip -c 1 | head -n 1 | grep -o -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
  fi
}
TypeScan() {
  if [[ "$(echo $typescan | tr '[:upper:]' '[:lower:]')" == "full" ]];then
    full
  elif [[ "$(echo $typescan | tr '[:upper:]' '[:lower:]')" == "quick" ]];then
    quick
  elif [[ "$(echo $typescan | tr '[:upper:]' '[:lower:]')" == "basic" ]];then
    basic
  else
    echo No seleccionado
  fi
}

full() {
  echo full
}

quick() {
  echo quick
}

basic() {
  echo basic
}


main() {
  # principal flujo del script
  ValidarIP
  TypeScan
}

if [[ $# -eq 3 ]];then
  main 
else
  exit 1
fi
