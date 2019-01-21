#!/bin/bash
cd ~/grpc-proxy-demo
./grpc/bin/client

grpcurl -plaintext localhost:80 helloworld.Greeter.SayHello

