#!/bin/bash

echo "Sourcing env"
set -a
source config/.env
set +a

echo "phx.server"
mix phx.server


