#!/bin/bash

echo Stopping circthread-app4edi and circthread-connector
docker compose down circthread-app4edi circthread-connector

echo Removing the DB used by circthread-connector
docker exec -it postgres psql -U postgres -c "DROP DATABASE connectordb;"

echo Creating the DB used by circthread-connector
docker exec -it postgres psql -U postgres -c "CREATE DATABASE connectordb;"

docker compose pull
docker compose build  --no-cache

echo Starting circthread-app4edi and circthread-connector
docker compose up -d circthread-app4edi circthread-connector  --remove-orphans

echo ReStarting haproxy
docker compose restart haproxy
