## stop switche's
sudo docker stop sw0
sudo docker stop sw1
sudo docker stop sw2

## stop host
sudo docker stop host0
sudo docker stop host1

## remove networks
sudo docker network rm sw0eth0
sudo docker network rm sw0eth1
sudo docker network rm sw1eth1
sudo docker network rm sw2eth1
sudo docker network rm rxtunnel
sudo docker network rm credittunnel
