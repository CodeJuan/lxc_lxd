# build lxd on centos

go get github.com/lxc/lxd
cd $GOPATH/src/github.com/lxc/lxd
make

# but pkg-config failed
# pkg-config --cflags lxc
#Package lxc was not found in the pkg-config search path.
#Perhaps you should add the directory containing `lxc.pc'
#to the PKG_CONFIG_PATH environment variable
find / -type f -name "lxc.pc"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig"



#[root@centos ~]# $GOPATH/bin/lxd init
#Name of the storage backend to use (dir or zfs) [default=dir]: 
#Would you like LXD to be available over the network (yes/no) [default=no]? yes
#Address to bind LXD to (not including port) [default=all]: 
#Port to bind LXD to [default=8443]: 
#Trust password for new clients: 
#Again: 
#Would you like stale cached images to be updated automatically (yes/no) [default=yes]? 
#Would you like to create a new network bridge (yes/no) [default=yes]? 
#What should the new bridge be called [default=lxdbr0]? 
#What IPv4 address should be used (CIDR subnet notation, “auto” or “none”) [default=auto]? 172.0.0.1/24
#Would you like LXD to NAT IPv4 traffic on your bridge? [default=yes]? yes
#What IPv6 address should be used (CIDR subnet notation, “auto” or “none”) [default=auto]? none
#LXD has been successfully configured.

