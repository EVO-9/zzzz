#!/bin/bash

# Source the environment variables from .env file
set -a
source .env
set +a

# Replace the variables in nginx.conf.template and save it as the final configuration file
envsubst < ./nginx.conf.template > ./nginx.conf

# Replace the variables in api.conf.template and save it as the final configuration file
envsubst < ./api.conf.template > ./api.conf

# Copy the modified nginx.conf into the running Nginx container
docker cp ./nginx.conf nginx:/etc/nginx/conf.d/${HALFSITE}.conf

# Copy the modified api.conf into the running Nginx container
docker cp ./api.conf nginx:/etc/nginx/conf.d/api.${HALFSITE}.conf

# Clean up the temporary nginx.conf and api.conf files if desired
rm ./nginx.conf
rm ./api.conf
