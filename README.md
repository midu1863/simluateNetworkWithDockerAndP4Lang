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


#troubleshoot list i had to deal
- I had the assumtion, that the default gateway handle automatically the ip route from differ subnet. It doesn't, see start.sh "sudo docker exec host1 ip route add default via 13.13.0.2" it fixed. It fix the routing issue.
- Docker uses veth in order to create a NIC for a container, which create a wrong checksum. You can fix if you recompile the linux kernel (veth setting) or see in start.sh "sudo docker exec host0 ethtool -K eth1 rx off tx off". The second approach disable the checksum checking on the NIC. 
- For some reason windows docker create a traffic noices in the network. I don't know why, but this noices blow up the cpu usage to 100%. I use linux now. So i don't have this behavoir. Perhebs the problem can be only on my windows maschine. 
