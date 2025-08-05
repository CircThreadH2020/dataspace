#!/bin/bash

# Configuration file path
config_file="replace-vars.json"

# Function to parse JSON and extract variable values
parse_json() {
  local file="$1"
  local key="$2"
  local result=$(grep -o "\"$key\": *\"[^\"]*\"" "$file" | sed -E "s/\"$key\": *\"([^\"]*)\"/\1/")
  echo "$result"
}

# Read variable values from the configuration file
replace_with_connector_manager_unique_id=$(parse_json "$config_file" "<REPLACE_WITH_CONNECTOR_MANAGER_UNIQUE_ID>")
replace_with_org1_unique_id=$(parse_json "$config_file" "<REPLACE_WITH_ORG1_UNIQUE_ID>")
replace_with_org1_unique_uri=$(parse_json "$config_file" "<REPLACE_WITH_ORG1_UNIQUE_URI>")
replace_with_org2_unique_id=$(parse_json "$config_file" "<REPLACE_WITH_ORG2_UNIQUE_ID>")
replace_with_org2_unique_uri=$(parse_json "$config_file" "<REPLACE_WITH_ORG2_UNIQUE_URI>")
replace_dns_connector_ids_endpoint=$(parse_json "$config_file" "<REPLACE_DNS_CONNECTOR_IDS_ENDPOINT>")
replace_with_ids_uuid=$(parse_json "$config_file" "<REPLACE_WITH_IDS_UUID>")
replace_with_public_key=$(parse_json "$config_file" "<REPLACE_WITH_PUBLIC_KEY>")
replace_password_1=$(parse_json "$config_file" "<REPLACE_PASSWORD_1>")
replace_password_2=$(parse_json "$config_file" "<REPLACE_PASSWORD_2>")
replace_catalog_title=$(parse_json "$config_file" "<REPLACE_WITH_CATALOG_TITLE>")
replace_catalog_description=$(parse_json "$config_file" "<REPLACE_WITH_CATALOG_DESCRIPTION>")

# Traverse through each text file in the current directory and its subdirectories
find . -type f \( -name "*.properties" -o -name "*.json" -o -name "*.yml" -o -name "*.cfg"  -o -name "create-certs.sh" \) ! -name "$config_file" -print0 | while IFS= read -r -d $'\0' file; do
  # Check if the file is readable
  if [ -r "$file" ]; then
    # Replace variable occurrences in the file
    sed -i "s#<REPLACE_WITH_CONNECTOR_MANAGER_UNIQUE_ID>#$replace_with_connector_manager_unique_id#g" "$file"
    sed -i "s#<REPLACE_WITH_ORG1_UNIQUE_ID>#$replace_with_org1_unique_id#g" "$file"
    sed -i "s#<REPLACE_WITH_ORG1_UNIQUE_URI>#$replace_with_org1_unique_uri#g" "$file"
    sed -i "s#<REPLACE_WITH_ORG2_UNIQUE_ID>#$replace_with_org2_unique_id#g" "$file"
    sed -i "s#<REPLACE_WITH_ORG2_UNIQUE_URI>#$replace_with_org2_unique_uri#g" "$file"
    sed -i "s#<REPLACE_DNS_CONNECTOR_IDS_ENDPOINT>#$replace_dns_connector_ids_endpoint#g" "$file"
    sed -i "s#<REPLACE_WITH_IDS_UUID>#$replace_with_ids_uuid#g" "$file"
    sed -i "s#<REPLACE_WITH_PUBLIC_KEY>#$replace_with_public_key#g" "$file"
    sed -i "s#<REPLACE_PASSWORD_1>#$replace_password_1#g" "$file"
    sed -i "s#<REPLACE_PASSWORD_2>#$replace_password_2#g" "$file"
    sed -i "s#<REPLACE_WITH_CATALOG_TITLE>#$replace_catalog_title#g" "$file"
    sed -i "s#<REPLACE_WITH_CATALOG_DESCRIPTION>#$replace_catalog_description#g" "$file"
  fi
done