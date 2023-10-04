#!/bin/bash

# Stop first the app4edi
docker compose stop circthread-app4edi

# Stop then the connector
docker compose stop circthread-connector

docker compose stop haproxy postgres

# Stop remaining services if any
docker compose down

exit 0
