#!/bin/bash
# 
# Simple wrapper for the pgli tool. This script allows us to pull in linked
# docker containers if the user decides to bring up the cli that way.

if [ -z ${POSTGRES_PORT_5432_TCP_ADDR+x} ]; then
    # POSTGRES linked variables aren't set, just call pgcli without params
    pgcli
else
    pgcli -h $POSTGRES_PORT_5432_TCP_ADDR -p $POSTGRES_PORT_5432_TCP_PORT -U $POSTGRES_ENV_POSTGRES_USER
fi

