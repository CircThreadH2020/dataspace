#!/bin/bash

echo Stopping circthread-app4edi and circthread-connector
docker compose down circthread-app4edi circthread-connector

echo Removing the DB used by circthread-app4edi
docker exec -it postgres psql -U postgres -c "DROP DATABASE app4edidb;"

echo Creating the DB used by circthread-app4edi
docker exec -it postgres psql -U postgres -c "CREATE DATABASE app4edidb;"

echo Removing the DB used by circthread-connector
docker exec -it postgres psql -U postgres -c "DROP DATABASE connectordb;"

echo Creating the DB used by circthread-connector
docker exec -it postgres psql -U postgres -c "CREATE DATABASE connectordb;"

echo Cleaning and recreating folder app4edi-edi-artifacts
sudo rm -r app4edi-edi-artifacts
mkdir app4edi-edi-artifacts

echo Cleaning and recreating folder app4edi-data-published
sudo rm -r app4edi-data-published
mkdir app4edi-data-published

docker compose build  --no-cache  --pull

echo Starting circthread-app4edi and circthread-connector
docker compose up -d circthread-app4edi circthread-connector  --remove-orphans

echo ReStarting haproxy
docker compose restart haproxy
