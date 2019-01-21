#!/bin/bash
cd ~/grpc-proxy-demo
yum install -y docker-ce
docker pull nginx:latest
mkdir -p /var/log/nginx
docker run -p 80:80 --name grpc-proxy -v $PWD/nginx/nginx.conf:/etc/nginx/nginx.conf -v /var/log/nginx:/var/log/nginx  -d nginx:latest
