#!/bin/bash

set +x
set -euo pipefail

mkdir -p /root/bootstrap
git clone https://github.com/jedahan/kiss-repo /root/bootstrap/jedahan
export KISS_PATH="/root/bootstrap/jedahan:$KISS_PATH"
kiss b talyn-config && kiss i talyn-config
kiss b talyn && kiss i talyn
