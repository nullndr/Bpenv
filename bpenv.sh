
#! /bin/bash

main() {

  declare -A data
  data=()

  while read -r line || [[ -n "$line" ]]; do

    # allow comments in the .env file and empty lines
    if [[ ${line:1:0} = "#" ]] || [[ $line = "" ]]; then
      continue
    fi 

    key=$(cut -d = -f1 <<< $line)
    value=$(cut -d = -f2- <<< $line)
    data["$key"]="$value"
  done <<< $(cat .env)

  for key in "${!data[@]}"; do
    echo "Key in loop: $key"
    echo "${data[$key]}"
  done
}

main
