#!/bin/bash
# 
# Simple wrapper for the pgli tool. This script allows us to pull in linked
# docker containers if the user decides to bring up the cli that way.

db_url=$1

if [ -n "$db_url" ]; then
    # 1st priority goes to any argument passed to the script
    pgcli "$db_url"
elif [ -n "$DB_URL" ]; then
    # next, if a DB_URL environment variable is set, use that
    pgcli "$DB_URL"
elif [ -n "$POSTGRES_PORT_5432_TCP_ADDR" ]; then
    # if nothing is set, we try to construct a db_url from the env vars that docker
    # automatically sets for the postgres container
    pgcli postgres://$POSTGRES_ENV_POSTGRES_USER:$POSTGRES_ENV_POSTGRES_PASSWORD@$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT
else
    echo "Database URL not provided, please try again."
fi

