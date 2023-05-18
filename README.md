# simluateNetworkWithDockerAndP4Lang
Simple test to simulate a network with docker contaner and p4 lang switches. It uses 2 host and 3 switches. Futher information later...


# How to start the test stetting
- first build the host images, this images is not online in the docker hub avaible 
- go in dir: dockerfiles/host via console and run: sudo docker build -t host . 
- the second image, that i use is in the docker hub and called p4lang/p4c
- then run ./start
Now the setup is running and can be use. Take care, that you have to connect to the container via sudo docker exec -it {name} bash 


## List of docker container it uses {name}
- sw0
- sw1
- sw2
- host0 
- host1 
