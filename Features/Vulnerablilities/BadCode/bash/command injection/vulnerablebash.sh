#!/bin/bash

getopt_simple()
{
    until [ -z "$1" ]
    do
      if [ ${1:0:2} = '--' ]
      then
          tmp=${1:2}               # Strip off leading '--' . . .
          parameter=${tmp%%=*}     # Extract name.
          value=${tmp##*=}         # Extract value.
          eval $parameter=$value
      fi
      shift
    done
}

target=/tmp

# Pass all options to getopt_simple().
getopt_simple $*

# list files to clean
echo "listing files in $target"
find "$target" -mtime 1
