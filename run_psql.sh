#!/bin/bash

POSTGRES_MASKED_URL=postgresql://dimitri:xxx@localhost:5432
POSTGRES_URL=postgresql://dimitri:dim@localhost:5432

echo psql $POSTGRES_MASKED_URL
psql $POSTGRES_URL