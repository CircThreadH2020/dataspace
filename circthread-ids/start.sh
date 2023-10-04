#!/bin/bash

docker compose pull

docker compose build

docker compose up -d postgres

sleep 5s

docker compose up -d circthread-connector circthread-app4edi 

sleep 40s

docker compose up -d haproxy

exit 0
