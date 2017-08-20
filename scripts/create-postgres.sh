#!/usr/bin/env bash

DB=$1;
USER=$2;
PASS=$3
# su postgres -c "dropdb $DB --if-exists"

if ! su postgres -c "psql $DB -c '\q' 2>/dev/null"; then
	su postgres -c "createuser $USER"
    su postgres -c "createdb -O $USER '$DB'"
fi
