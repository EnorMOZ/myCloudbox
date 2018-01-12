#!/bin/bash

# Script prints the Plex Autoscan URL

cfg_server_ip=$(cat {{mnt.docker_data}}/plex_autoscan/config/config.json | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["'SERVER_IP'"]';)

if [ $cfg_server_ip = 0.0.0.0 ]; then
  server_ip="$(curl -s http://checkip.amazonaws.com)"
else
  server_ip=$cfg_server_ip
fi

server_port=$(cat {{mnt.docker_data}}/plex_autoscan/config/config.json | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["'SERVER_PORT'"]';)

server_pass=$(cat {{mnt.docker_data}}/plex_autoscan/config/config.json | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["'SERVER_PASS'"]';)


echo "http://${server_ip}:${server_port}/${server_pass}"
