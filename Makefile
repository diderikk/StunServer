# Target stun
stun: stun_remove stun_clean stun_build stun_run

# Removes docker container if it is running
stun_remove:
	-docker stop stun

# Removes docker image if it
stun_clean: 
	-docker rmi stunserver

# Builds the docker image from Dockerfile
stun_build:
	@docker build -t stunserver ./stunserver

# Runs the recently built image and open the UDP port
stun_run:
	docker run -d -p 3478:3478/udp --rm --name stun stunserver


# Target test
test: test_build_run test_clean

test_build_run:
	g++ test/attribute_test.cpp -o test1 && ./test1
	g++ test/handler_test.cpp -o test1 && ./test1

test_clean: test1
	rm test1

# Target p2p
p2p: p2p_remove p2p_clean p2p_build p2p_run


p2p_remove:
	-docker stop p2p

p2p_clean:
	-docker rmi p2p_image

p2p_build:
	@docker build -t p2p_image ./p2p

p2p_run:
	docker run -d -p 80:3000 -p 3001:3001 --rm --name p2p p2p_image


