#!/usr/bin/env bash
set -Eeo pipefail

declare -g DATABASE_ALREADY_EXISTS
# look specifically for PG_VERSION, as it is expected in the DB dir

export POSTGRES_PASSWORD=postgres

if [ -s "$PGDATA/PG_VERSION" ]; then
	DATABASE_ALREADY_EXISTS='true'
fi

if [ -z "$DATABASE_ALREADY_EXISTS" ]; then
	su - postgres -c "/var/lib/postgresql/bin/initdb -D $PGDATA --username=postgres --pwfile=<(echo "$POSTGRES_PASSWORD")"

	cp /pg_conf/postgresql.conf $PGDATA/
	cp /pg_conf/pg_hba.conf $PGDATA/

	echo
	echo 'PostgreSQL init process complete; ready for start up.'
	echo
else
	echo
	echo 'PostgreSQL Database directory appears to contain a database; Skipping initialization'
	echo
fi

su - postgres -c "/var/lib/postgresql/bin/pg_ctl -D  $PGDATA  -l  $PGDATA/logfile.txt start"
tail -f $PGDATA/logfile.txt
