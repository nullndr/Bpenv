
#! /bin/bash

main() {

  cat .env | while read -r line || [[ -n "$line" ]]; do

    # allow comments in the .env file
    if [[ ${line:1:0} = "#" ]]; then
      continue
    fi 
    
    key=$(cut -d = -f1 <<< $line)
    value=$(cut -d = -f2- <<< $line)
  done 
}

main
