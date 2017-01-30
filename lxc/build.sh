# build lxc on centos

# 2.0.7   wget https://github.com/lxc/lxc/archive/lxc-2.0.7.zip
git clone https://github.com/lxc/lxc.git

# libtoolize
yum install -y libtool

# autogen
./autogen.sh

# ./configure
./configure

#Environment:
# - compiler: gcc
# - distribution: centos
# - init script type(s): sysvinit
# - rpath: no
# - GnuTLS: no
# - Bash integration: yes
#
#Security features:
# - Apparmor: no
# - Linux capabilities: no
# - seccomp: no
# - SELinux: no
# - cgmanager: no
#
#Bindings:
# - lua: no
# - python3: no
#
#Documentation:
# - examples: yes
# - API documentation: no
# - user documentation: no
#
#Debugging:
# - tests: no
# - mutex debugging: no
#
#Paths:
# - Logs in configpath: no

# install libseccomp
wget https://github.com/seccomp/libseccomp/releases/download/v2.3.1/libseccomp-2.3.1.tar.gz
tar xf libseccomp-2.3.1.tar.gz
cd libseccomp-2.3.1
./configure 
make
make install

# Linux capabilities
yum install libcap-devel -y

# cgmanager???

# should disable apparmor selinux seccomp cgmanager LinuxCapabilities rpath

./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var  --with-distro=centos --disable-lua --enable-bash --disable-python --disable-selinux --disable-apparmor --disable-rpath --disable-cgmanager --disable-doc
make
make install

# # lxc-create version
# lxc-create: error while loading shared libraries: liblxc.so.1: cannot open shared object file: No such file or directory
export LD_LIBRARY_PATH=/usr/lib

[root@centos lxd]# lxc-create version
lxc-create: error while loading shared libraries: libseccomp.so.2: cannot open shared object file: No such file or directory
[root@centos lxd]# find / -name "libseccomp.so*"
#/root/systemcontainer/lxc/libseccomp-2.3.1/src/.libs/libseccomp.so.2
#/root/systemcontainer/lxc/libseccomp-2.3.1/src/.libs/libseccomp.so
#/root/systemcontainer/lxc/libseccomp-2.3.1/src/.libs/libseccomp.so.2.3.1
#/usr/local/lib/libseccomp.so.2
#/usr/local/lib/libseccomp.so
#/usr/local/lib/libseccomp.so.2.3.1
[root@centos lxd]# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#[root@centos lxd]# lxc-create version
#lxc-create: missing container name, use --name option

[root@centos lxd]# lxc-create -t ubuntu -n abc
'debootstrap' command is missing
lxc-create: lxccontainer.c: create_run_template: 1297 container creation template for abc failed
lxc-create: tools/lxc_create.c: main: 318 Error creating container abc

