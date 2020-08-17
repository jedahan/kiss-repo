#!/bin/bash

set +x
set -euo pipefail

ver=2020.7
url=https://github.com/kisslinux/repo/releases/download/$ver

test -f "kiss-chroot-$ver.tar.xz" || wget "$url/$_"
test -f "kiss-chroot-$ver.tar.xz.sha256" || wget "$url/$_"
sha256sum -c < "kiss-chroot-$ver.tar.xz.sha256"

test -f kiss-chroot-$ver.tar.xz.asc || wget "$url/$_"
gpg --keyserver keys.gnupg.net --recv-key 46D62DD9F1DE636E
gpg --verify "kiss-chroot-$ver.tar.xz.asc" "kiss-chroot-$ver.tar.xz"

mkdir -p mnt
tar xvf "kiss-chroot-$ver.tar.xz" -C ./mnt --strip-components 1
cp kiss-bootstrap-chroot.sh ./mnt/
./mnt/bin/kiss-chroot ./mnt  
