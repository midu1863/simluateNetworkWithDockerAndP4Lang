pkill simple_switch
sleep 2
p4c -b bmv2 /p4c/$1 -o /p4c/$2

./run_switch.sh $3
