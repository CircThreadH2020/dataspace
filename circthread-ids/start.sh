#!/bin/bash

docker compose build  --no-cache  --pull

docker compose up -d postgres  --remove-orphans

sleep 5s

docker compose up -d circthread-connector circthread-app4edi  --remove-orphans

sleep 40s

docker compose up -d haproxy  --remove-orphans

exit 0
