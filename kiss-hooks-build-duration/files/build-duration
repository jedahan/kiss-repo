#!/bin/sh -e

case $TYPE in
    pre-build)
        IFS=. read -r _start _ < /proc/uptime
        ;;

    post-build)
        IFS=. read -r _end _ < /proc/uptime
        (
            _s=$((_end - _start))
            _h=$((_s / 60 / 60 % 24))
            _m=$((_s / 60 % 60))

            [ "$_h" = 0 ] || _u="${_u}${_h}h "
            [ "$_m" = 0 ] || _u="${_u}${_m}m "

            log "$PKG" "Build finished in ${_u:-${_s}s}"
        )
        ;;
esac
