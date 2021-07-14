#!/bin/sh -e

case $TYPE in
    build-fail)
        log "$PKG" "Dropped into subshell"
        sh >/dev/tty
    ;;
esac
