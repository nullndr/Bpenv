
#! /bin/bash

main() {
  
  key=()
  values=()

  while read line; do
  
  # allow comments in the .env file
  if [[ ! ${line:1:0} = "#" ]]; then
    continue
  fi 

  done < .env

  if [[ ${#key[@]} -eq ${#values[@]} ]]; then

  else
    echo "Error: Invalid .env file"
    exit 1
  fi
}

main
