cmd="simple_switch -i 0@eth1 -i 1@eth2 creditBased.bmv2/creditBased.json"
$cmd &

sleep 5

simple_switch_CLI << EOF
table_add MyIngress.mac_exact MyIngress.mac_forward 13.13.0.0/16 => 1
EOF

simple_switch_CLI << EOF
table_add MyIngress.mac_exact MyIngress.mac_forward 10.10.0.0/16 => 0
EOF

simple_switch_CLI << EOF
table_add MyIngress.ipv4_lpm MyIngress.ipv4_forward 13.13.0.0/16 => 1
EOF

simple_switch_CLI << EOF
table_add MyIngress.ipv4_lpm MyIngress.ipv4_forward 10.10.0.0/16 => 0
EOF
