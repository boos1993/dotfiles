#!/bin/sh

files="*.[c,h]"
flags=""
usage="
Usage: $0 [-i] [-n] [-f S] searchstring\n\n

  searchstring is either one word or surrounded by quotes\n\n

  -i, ignores the search string case\n
  -n, displays line numbers\n
  -f, which files to search (Default: \"*.[c,h]\" \n
  -h, displays this message\n
"

while getopts ":inf:" opt; do
  case $opt in
    i  ) flags=$flags"-i " ;;
    n  ) flags=$flags"-n " ;;
    f  ) files=$OPTARG ;;
    \? ) echo -e $usage
	 exit 1 ;;
  esac
done

shift $(($OPTIND - 1))

if [ -z "$1" ]; then
    echo -e $usage
    exit 1
fi

find . -name "$files" -exec grep --color=auto $flags "$1" {} \; -printf '\033[32m%p\033[0m\n'

