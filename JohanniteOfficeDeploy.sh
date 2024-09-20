#!/bin/bash

# Log into repository
cat /home/tandu/dockerpwd.txt | docker login -u srassbach --password-stdin

# close and remove old image
docker-compose down

# pull latest
docker pull srassbach/johannitechurch:latest
docker pull srassbach/johannite_liturgies_ui:latest
docker pull portainer/agent:latest

# Spin up new image
docker-compose up -d
# copy default.conf to nginx-proxy
docker cp ~/home/tandu/default.conf nginx-proxy:/etc.nginx/conf.d/
# logout
docker logout


