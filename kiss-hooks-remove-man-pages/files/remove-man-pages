#!/bin/sh -e

case $TYPE in
    post-build)
        # Ensure that '$DEST' is set.
        : "${DEST:?DEST is unset}"
	rm -rf "$DEST/usr/share/man"
        ;;
esac
