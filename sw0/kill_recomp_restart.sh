pkill simple_switch
sleep 2
p4c -b bmv2 /p4c/creditBased.p4 -o /p4c/creditBased.bmv2

./run_switch.sh
