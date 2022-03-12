
#! /bin/bash

declare -A data
data=()

parse_dotenv() {
  while read -r line || [[ -n "$line" ]]; do

    # allow comments in the .env file and empty lines
    if [[ ${line:1:0} = "#" ]] || [[ $line = "" ]]; then
      continue
    fi 

    key=$(cut -d = -f1 <<< $line)
    value=$(cut -d = -f2- <<< $line)
    data["$key"]="$value"
  done <<< $(cat .env)
}

usage() {
  echo "\
Bash Parse ENV v0.0.1

Usage:  bpenv [OPTION]
"
}

version() {
  echo "Bash Parse ENV v0.0.1"
}

main() {
  while [[ $# -gt 0 ]]; do
    case $1 in 
      -v | --version)
        version
        shift
      ;;
      -h | --help)
        usage
        shift
      ;;
      -p | --print) 
        parse_dotenv
        echo "Keys  : ${!data[@]}"
        echo "Values: ${data[@]}"
        shift
      ;;
      -* | --*) ;;
    esac
  done
}

main $@
