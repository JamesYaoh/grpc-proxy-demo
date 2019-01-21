#!/bin/bash
cd ~/grpc-proxy-demo
sudo ./env.sh
sudo mkdir -p /var/log/nginx
docker run -p 80:80 --name grpc-proxy -v $PWD/nginx/nginx.conf:/etc/nginx/nginx.conf -v /var/log/nginx:/var/log/nginx  -d hub.cloud.ctripcorp.com/cbaas/nginx:latest
