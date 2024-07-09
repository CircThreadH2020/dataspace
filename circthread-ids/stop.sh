#!/bin/bash

# Stop first the app4edi
docker compose down circthread-app4edi

# Stop then the connector
docker compose down circthread-connector

docker compose down haproxy postgres

# Stop remaining services if any
docker compose down

exit 0
