KISS_REPO=/home/micro/.cache/kiss/repo
KISS_DB=/var/db/kiss/repo

export KISS_PATH=\
:$KISS_REPO/jedahan\
:$KISS_REPO/kiss-wayland/kiss-wayland\
:$KISS_DB/core\
:$KISS_DB/extra\
:$KISS_DB/xorg\
:$KISS_REPO/community/community

export CFLAGS="-O2 -march=native -pipe"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"
