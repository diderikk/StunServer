# docker run -td -p 8080:8080/udp --rm <docker-image>

FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install -y g++

EXPOSE 3478/udp

COPY . .

RUN g++ server.cpp -fsanitize=address -lpthread -o server

CMD ["./server"]
