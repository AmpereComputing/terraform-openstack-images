# Minimal Kickstart
# by Peter J. Pouliot peter@pouliot.net
#version=DEVEL
install
text
url --url=http://4881c4f36ac3.pouliot.net/oraclelinux/mnt/OracleLinux-R7-U5-Server-x86_64-dvd.iso 
#--proxy=http://pxe.to:8000
# ssl proxy for install
#url --url=http://4881c4f36ac3.pouliot.net/oraclelinux/mnt/OracleLinux-R7-U5-Server-x86_64-dvd.iso --proxy=https://proxy_host:8000 --noverifyssl
lang en_US.UTF-8
keyboard us

network --onboot yes --bootproto dhcp --noipv6

#network --onboot yes --bootproto dhcp --noipv6 --hostname oraclelinux.local
#network --onboot yes --device eth0 --bootproto dhcp --noipv6 --hostname oraclelinux.local
#network --onboot yes --device eth1 --bootproto dhcp --noipv6 --hostname oraclelinux.local
#timezone --utc America/New_York
timezone America/New_York
#rootpw  --iscrypted $6$xZjQTi60/cVUkZzt$v8XcjyqcyCcsNlaadeBSZrP033MIkqINosu8m2s0he4mlzxb.GLGBFznwvKUXrNZfCkvv9l.pdEh/ZpE//fgA0
rootpw oraclelinux
#selinux --enforcing
selinux --disabled
authconfig --enableshadow --passalgo=sha512
#firewall --service=ssh
firewall --disabled
# The following is the partition information you requested
# Note that any partitions you deleted are not expressed
# here so unless you clear all partitions first, this is
# not guaranteed to work
#clearpart --all --drives=sda
#zerombr yes
zerombr
clearpart --all --initlabel
part pv.008002 --grow --size=500
part /boot --fstype=ext4 --size=500
volgroup vg_system --pesize=32768 pv.008002
logvol swap --name=lv_swap --vgname=vg_system --grow --size=496 --maxsize=4096
logvol / --fstype=ext4 --name=lv_root --vgname=vg_system --grow --size=1024

bootloader --location=mbr --timeout=5 --append="rhgb quiet"
repo --name="oraclelinux-7.5-x86_64"  --baseurl=http://4881c4f36ac3.pouliot.net/oraclelinux/mnt/OracleLinux-R7-U5-Server-x86_64-dvd.iso --cost=1000
# repo --name="oraclelinux-7.5-x86_64-Updates"  --baseurl=http://public-yum.oracle.com/repo/oracle/OracleLinux/OL7/5/base/x86_64 --cost=1000
# repo --name="puppetlabs"  --baseurl=http://yum.puppet.com/el/7/PC1/x86_64 --cost=1000
services --enabled network
services --disabled cups,smartd,autofs,bluetooth,ip6tables,avahi-daemon,NetworkManager
reboot
%packages
#@admin-tools
#@fonts
@core
#@online-docs
openssh-clients
# puppetlabs-release
%end

%post --nochroot --log /mnt/sysimage/root/oraclelinux-copy-dhcp-lease.log
set -x
# @echo on
echo "Copy Current Lease Information to New Installation"
cp /var/lib/dhclient/* /mnt/sysimage/var/lib/dhclient/
%end

%post --log /root/oraclelinux-rename-host.log
# SET HOSTNAME

DNSNAME=`cat /var/lib/dhclient/dhclient*.lease |grep -m 1 "option host-name" |tr -s " " | cut -d " " -f4| /bin/sed -e "s/\"//g;" | /bin/sed -e "s/\;//g;"`
echo $DNSNAME

if [ $DNSNAME ]
then
  # SET HOSTNAME TO DHCP CLIENT VALUE
  NEWHOSTNAME=$DNSNAME
  echo "### DNSNAME: "$DNSNAME "HOSTNAME:" $HOSTNAME "NEWHOSTNAME:" $NEWHOSTNAME "###"
else
  # Basic Hostname Check
  NEWHOSTNAME=`/sbin/ip a | grep "ether" | tr -s " " | cut -d " " -f3 | /bin/sed -e "s/://g;"`
  echo "### DNSNAME: "$DNSNAME "HOSTNAME:" $HOSTNAME "NEWHOSTNAME:" $NEWHOSTNAME "###"
fi

# Setting Hostname
cat << EOF > /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=$NEWHOSTNAME
EOF

if [ -f /etc/hostname ]
then
  rm -f /etc/hostname
  cat <<EOF > /etc/hostname
$NEWHOSTNAME
EOF
fi

%end

%post --log /root/oraclelinux-install-epel-repo.log

# Install Fedor EPL Repos if we are not Fedora
echo "Checking hostname -s and installing EPL Package if Necessary"
echo "Installing Puppet 5 Repositories"
HOSTNAME=`hostname -s`
EPLRELEASE=`/bin/cat /etc/redhat-release |/bin/awk '{print $3}'`
EPL7RELEASE=`/bin/cat /etc/redhat-release |/bin/awk '{print $4}'|/bin/sed -e "s/\./\ /g"|/bin/awk '{print $1"."$2}'`

if [ "$HOSTNAME" = "centos" -o "$HOSTNAME" = "scientificlinux" -o "$HOSTNAME" = "oraclelinux" ]; then
  echo -n "Install Fedora EPL Repos"
  if [$EPL7RELEASE -ge "7.0" ]; then
    /bin/rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    /bin/rpm -ivh http://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
  fi
  if [$EPLRELEASE -ge "6.0" ]; then
    /bin/rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
    /bin/rpm -ivh http://yum.puppet.com/puppet5/puppet5-release-el-6.noarch.rpm
  fi
fi
%end
%post --log /root/oraclelinux-puppet_installation.log


# Puppet
# Test if yum is in /bin
if [ -f /bin/yum ]
  then
  /bin/yum install puppet-agent rubygems make gcc ruby-devel git -y
fi
# Test if yum is in /usr/bin
if [ -f /usr/bin/yum ]
  then
  /usr/bin/yum install puppet-agent rubygems make gcc ruby-devel git -y
fi
%end

%post --log /root/oraclelinux-r10k_installation.log
# R10K"
if [ -f /bin/gem ]
  then
  /bin/gem install r10k hiera-eyaml
fi
if [ -f /usr/bin/gem ]
  then
  /usr/bin/gem install r10k hiera-eyaml
fi
%end

%post --log /root/oraclelinux-puppet_service_configuration.log

if [ -f /etc/sysconfig/puppet ]
   then
   /bin/sed -i -e "s/^START=no/START=yes/" /etc/sysconfig/puppet
fi

if [ -f /etc/puppet/puppet.conf ]
   then
   cat << EOF >> /etc/puppet/puppet.conf
[agent]
server=
EOF

fi

use_chkconfig=`ps -p 1 -o command | awk '{print $1}'|grep -c init`
use_systemd=`ps -p 1 -o command | awk '{print $1}'|grep -c systemd`

if [ $use_systemd -eq 0 ]
  then
  systemctl enable puppet
fi

if [ $use_chkconfig -eq 0 ]
  then
  chkconfig puppet on
fi

echo "Removing Old DHCP Lease Files"
rm -rf /var/lib/dhclient/dhclient*.lease

%end
