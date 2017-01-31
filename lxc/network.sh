brctl addbr lxcbr0
ip addr add 192.168.11.1/24 dev lxcbr0
ifconfig lxcbr0 up

# in container
ifconfig lxcbr0 up
ip route add default via 192.168.11.1
