#!/bin/bash

set -a
source .env
set +a

POSTGRES_URL=postgresql://${POSTGRES_USR}:${POSTGRES_PASSWD}@localhost:5432
POSTGRES_MASKED_URL=postgresql://${POSTGRES_USR}:xxx@localhost:5432

echo psql $POSTGRES_MASKED_URL
psql $POSTGRES_URL


