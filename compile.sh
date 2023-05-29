sudo docker run --rm -itd --cap-add NET_ADMIN --name sw0 -v"$(pwd)"/sw0:/p4c p4lang/p4c
sudo docker run --rm -itd --cap-add NET_ADMIN --name sw1 -v"$(pwd)"/sw1:/p4c p4lang/p4c
sudo docker run --rm -itd --cap-add NET_ADMIN --name sw2 -v"$(pwd)"/sw2:/p4c p4lang/p4c

sudo docker exec sw0 bash /p4c/compile.sh $1 $2
sudo docker exec sw1 bash /p4c/compile.sh $1 $2
sudo docker exec sw2 bash /p4c/compile.sh $1 $2


sudo docker kill sw0
sudo docker kill sw1
sudo docker kill sw2
