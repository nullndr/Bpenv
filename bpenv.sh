
#! /bin/bash

main() {
  
  keys=()
  values=()

  while IFS= read -r line; do

    # allow comments in the .env file
    if [[ ${line:1:0} = "#" ]]; then
      continue
    fi 

    keys+=$(cut -d = -f1 <<< $line)
    values+=$(cut -d = -f2- <<< $line)

  done < .env
}

main
