# gRPC proxy demo #

this demo composed of a golang backend listening on 8089 and a nginx proxy listening on 80.

## prepare ##

- git clone this repo under $HOME
~~~shell
cd ~ && git clone git@git.dev.sh.ctripcorp.com:hongyao/grpc-proxy-demo.git
~~~
- update the ip address in this demo:
  - nginx.conf -> grpc_pass grpc://ip_address:port
  - client.go -> address = "ip_address:port"
  - restart nginx and rebuild client bin
  
## nginx ##
run run.sh to install docker and start nginx
~~~shell
cd ~/grpc-proxy-demo && ./run.sh
~~~

## test ##
- run test.sh to test
~~~shell
cd ~/grpc-proxy-demo && ./test.sh
~~~
- use grpcurl to test
~~~shell
cd ~/grpc-proxy-demo
grpcurl -plaintext localhost:80 list
grpcurl -plaintext localhost:80 helloworld.Greeter.SayHello
~~~
