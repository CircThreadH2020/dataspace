#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    ALTER USER postgres WITH PASSWORD '12345';
	CREATE DATABASE connectordb;
    GRANT ALL PRIVILEGES ON DATABASE connectordb TO postgres;
    CREATE DATABASE app4edidb;
    GRANT ALL PRIVILEGES ON DATABASE app4edidb TO postgres;
EOSQL
