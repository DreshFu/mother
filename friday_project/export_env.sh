#!/bin/bash

echo "Sourcing env"
set -a
source config/.env
set +a

echo "mix deps.get"
mix deps.get

echo "mix deps.compile"
mix deps.compile

echo "mix ecto.create"
mix ecto.create

echo "mix ecto.migrate"
mix ecto.migrate

