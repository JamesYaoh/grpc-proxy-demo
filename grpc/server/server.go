package main

import (
    "fmt"
    "golang.org/x/net/context"
    "google.golang.org/grpc"
    "grpc-proxy-demo/grpc/pb"
    "log"
    "net"
)

const (
    port = ":8089"
)

// server is used to implement helloworld.GreeterServer.
type server struct{}

// SayHello implements helloworld.GreeterServer
func (s *server) SayHello(ctx context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
    return &pb.HelloReply{Message: "Hello " + in.Name}, nil
}

func main() {
    lis, err := net.Listen("tcp", port)
    if err != nil {
        log.Fatalf("failed to listen: %v", err)
    }
    s := grpc.NewServer()
    pb.RegisterGreeterServer(s, &server{})
    err = s.Serve(lis)
    if err == nil {
        log.Println("server listening on port: ", port)
    } else {
        fmt.Println(err)
    }
}
