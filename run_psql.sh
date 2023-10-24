#!/bin/bash

POSTGRES_MASKED_URL=postgresql://admin:xxx@localhost:5432
POSTGRES_URL=postgresql://admin:postgres_passwd@localhost:5432

echo psql $POSTGRES_MASKED_URL
psql $POSTGRES_URL

