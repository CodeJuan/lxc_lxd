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
