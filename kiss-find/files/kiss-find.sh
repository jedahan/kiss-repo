#!/bin/sh -e
# Search for packages across every known repository

VERSION="1"
DB_PATH="$HOME/.cache/kiss-find/db.gz"
UPDATE_URL="https://github.com/jedahan/kiss-find-db/releases/download/0.1.0/db.gz"

mkdir -p "$(dirname "$DB_PATH")"

if [ -z "$1" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "kiss-find $VERSION"
	echo "$0 <query> :: Search for packages across every known repository"
	echo "$0 -u      :: Update package database"
	exit
elif [ "$1" = "-u" ]; then
	command -v wget && wget -U "kiss-find/$VERSION" "$UPDATE_URL" -O "$DB_PATH"
	echo ":: Update done"
	exit
fi

set -u # was required for the -z check above, can enable now

if [ ! -f "$DB_PATH" ]; then
	echo ":: Please run with '-u' to update"
	exit
fi

# Speed up grep
export LC_ALL=C

DATABASE="$(zcat "$DB_PATH")"

query() {
	echo "$DATABASE" | jq "$@"
}

#          get all pkg names > grep query   > wrap line in quotes   > one line    > remove last comma
RESULTS="$(query -r "keys[]" | grep -i "$1" | sed 's/\(.*\)/"\1"/g' | tr "\n" "," | sed 's/.$//')"

query "{$RESULTS}"
