#!/bin/sh

if [ $# != 1 ]; then
  exit 1
fi
set $*

case "$1" in
  button/lid)
    case "$2" in
      LID)	
        case "$3" in
          close) zzz
	  ;;
	esac
      ;;
    esac
  ;;
esac
