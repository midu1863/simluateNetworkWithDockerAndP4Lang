simple_switch_CLI << EOF
register_write switchId 0 3
EOF

simple_switch_CLI << EOF
set_queue_depth 10
EOF

simple_switch_CLI << EOF
set_queue_rate 1
EOF


simple_switch_CLI << EOF
mc_node_create 1 1 2
EOF

simple_switch_CLI << EOF
mc_mgrp_create 1
EOF

simple_switch_CLI << EOF
mc_node_associate 1 0
EOF

simple_switch_CLI << EOF
register_write ingressCreditCard 1 1
EOF

simple_switch_CLI << EOF
register_write leftOverCreditCard 1 1
EOF
