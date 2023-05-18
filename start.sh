## sw0 port 0
sudo docker network create --driver=bridge --subnet=10.10.0.0/16 sw0eth0
## sw0 port 1
sudo docker network create --driver=bridge --subnet=11.11.0.0/16 sw0eth1
## sw1 port 1
sudo docker network create --driver=bridge --subnet=12.12.0.0/16 sw1eth1
## sw2 port 1
sudo docker network create --driver=bridge --subnet=13.13.0.0/16 sw2eth1


## create host's
sudo docker run --rm -itd --cap-add NET_ADMIN --name host0 host
sudo docker run --rm -itd --cap-add NET_ADMIN --name host1 host

## create switche's
sudo docker run --rm -itd --cap-add NET_ADMIN --name sw0 -v"$(pwd)"/sw0:/p4c p4lang/p4c
sudo docker run --rm -itd --cap-add NET_ADMIN --name sw1 -v"$(pwd)"/sw1:/p4c p4lang/p4c
sudo docker run --rm -itd --cap-add NET_ADMIN --name sw2 -v"$(pwd)"/sw2:/p4c p4lang/p4c

## disconnect container from default switchte's
#sudo docker network disconnect bridge sw0
#sudo docker network disconnect bridge sw1
#sudo docker network disconnect bridge sw2
## disconnect container from default host's
#sudo docker network disconnect bridge host0
#sudo docker network disconnect bridge host1

## connect sw0
sudo docker network connect sw0eth0 sw0
sudo docker network connect sw0eth1 sw0

## connect sw0 to sw1 1:0
sudo docker network connect sw0eth1 sw1
sudo docker network connect sw1eth1 sw1

## connect sw1 to sw2 1:0
sudo docker network connect sw1eth1 sw2
sudo docker network connect sw2eth1 sw2

## connect host0 to sw0:0 and host1 to sw2:1
sudo docker network connect sw0eth0 host0
sudo docker network connect sw2eth1 host1

## fix maybe
#sudo docker network connect sw0eth0 sw1
#sudo docker network connect sw0eth0 sw2

#sudo docker network connect sw2eth1 sw0
#sudo docker network connect sw2eth1 sw1

## sysctl net.ipv4.conf.all.send_redirects=0
sudo docker exec host0 ip route delete default
sudo docker exec host0 ip route add default via 10.10.0.2
sudo docker exec host0 ip route add 13.13.0.0/16 dev eth1 proto kernel scope link src 10.10.0.3

sudo docker exec host1 ip route delete default
sudo docker exec host1 ip route add default via 13.13.0.2
sudo docker exec host1 ip route add 10.10.0.0/16 dev eth1 proto kernel scope link src 13.13.0.3

sudo docker exec host0 ethtool -K eth1 rx off tx off
sudo docker exec host1 ethtool -K eth1 rx off tx off



## compile it
# now i mount a folder, in oder to manipulate on the program on local maschine
#sudo docker cp ./basic.p4 sw0:/p4c
#sudo docker cp ./basic.p4 sw1:/p4c
#sudo docker cp ./basic.p4 sw2:/p4c


#sudo docker exec sw0 p4c -b bmv2 /p4c/basic.p4 -o /p4c/basic.bmv2
#sudo docker exec sw1 p4c -b bmv2 /p4c/basic.p4 -o /p4c/basic.bmv2
#sudo docker exec sw2 p4c -b bmv2 /p4c/basic.p4 -o /p4c/basic.bmv2

#sudo docker exec sw0 simple_switch -i 0@eth1 -i 1@eth2 basic.bmv2/basic.json
#sudo docker exec sw1 simple_switch -i 0@eth1 -i 1@eth2 basic.bmv2/basic.json
#sudo docker exec sw2 simple_switch -i 0@eth1 -i 1@eth2 basic.bmv2/basic.json

sudo docker exec sw0 sh /p4c/run_switch.sh
sudo docker exec sw1 sh /p4c/run_switch.sh
sudo docker exec sw2 sh /p4c/run_switch.sh
