# build lxc on centos

# 2.0.7   wget https://github.com/lxc/lxc/archive/lxc-2.0.7.zip
git clone https://github.com/lxc/lxc.git

# libtoolize
yum install -y libtool

# autogen
./autogen.sh

# ./configure
./configure
