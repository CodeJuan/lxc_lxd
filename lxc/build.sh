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


# should disable apparmor selinux seccomp cgmanager LinuxCapabilities rpath
