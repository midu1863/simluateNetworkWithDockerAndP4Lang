 sudo docker run --rm -itd --cap-add NET_ADMIN --name $1 -v"$(pwd)"/$1:/p4c p4lang/p4c


sudo docker exec -it $1 p4c -b bmv2 $2 -o $3

sudo docker kill $1
