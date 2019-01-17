#!/bin/bash
cd ~/grpc-proxy-demo
sudo ./env.sh
docker run -p 80:80 --name grpc-proxy -v $PWD/www:/www -v $PWD/nginx/nginx.conf:/etc/nginx/nginx.conf  -d hub.cloud.ctripcorp.com/cbaas/nginx:latest
