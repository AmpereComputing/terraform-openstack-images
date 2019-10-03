![Ampere Computing](https://avatars2.githubusercontent.com/u/34519842?s=400&u=1d29afaac44f477cbb0226139ec83f73faefe154&v=4)

# terraform-openstack-images

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module for managing QCOW2 and RAW OpenStack Images for x86_64 and AARCH64


| Cloud Image | versions | x86_64 | aarch64 | QCOW2 | RAW |
| ------------------- | --- | ---| ---| ----- | --- |
| Archlinux | LATEST | X | | X | X |
| CentOS | 6.1901 | X | | X | X |
| CentOS | 7.1901 | X | | X  | X |
| CentOS | 7 | | X  | X  | X |
| CirrOS | 0.4.0 | X | | X | X |
| CoreOS | Stable | X | | X | X |
| CoreOS | Alpha | X | | X | X |
| CoreOS | Beta | X | | X | X |
| Debian | 9 | X | X | X | X |
| Debian | 10 | X | X | X | X |
| Fedora | 29 | X | X | X | X |
| Fedora | 30 | X | X | X | X |
| Fedora-Atomic | 29 | | | X | X | 
| Flatcar Linux | Stable | X | | X | X |
| Flatcar Linux | Alpha | X | | X | X |
| Flatcar Linux | Beta | X | | X | X |
| FreeBSD | 12.0 Release | X | | X | X |
| Kali-Linux | Rolling Latest| X | | X | X |
| OpenSuSE | Leap 15.0 |X | | X | X |
| OpenSuSE | Leap 15.1 |X | X | X | X |
| RancherOS | 5.4 | X | | X | X |
| Ubuntu | Trusty | X | X | X | X |
| Ubuntu | Xenial | X | X | X | X |
| Ubuntu | Bionic | X | X | X | X |
| Vyos | Rolling | X | | X | X |

## Assets

### Archlinux

* [archlinux/archlinux_image.sh](archlinux/archlinux_image.sh)
* [archlinux/main.tf](archlinux/main.tf)
* [archlinux/varibles.tf](archlinux/variables.tf)
* [Archlinux OpenStack Images](https://linuximages.de/openstack/arch/)

### CentOS

* [centos/centos_image.sh](centos/centos_image.sh)
* [centos/main.tf](centos/main.tf)
* [centos/variables.tf](centos/varibles.tf)

### CirrOS

* [cirros/cirros_image.sh](cirros/cirros_image.sh)
* [cirros/main.tf](cirros/main.tf)
* [cirros/variables.tf](cirros/variables.tf)

### CoreOS

* [coreos/coreos_image.sh](coreos/coreos_image.sh)
* [coreos/main.tf](coreos/main.tf)
* [coreos/variables.tf](coreos/variables.tf)
* [CoreOS (stable) Cloud Images](https://stable.release.core-os.net/amd64-usr/current)

### Debian

* [debian/main.tf](debian/main.tf)
* [debian/main.tf](debian/variables.tf)
* [Debian 9 OpenStack Images](https://cdimage.debian.org/cdimage/openstack/current-9/)
* [Debian 10 OpenStack Images](https://cdimage.debian.org/cdimage/openstack/current-10/)

### Fedora

* [fedora/fedora_atomic_image.sh](fedora/fedora_atomic_image.sh)
* [fedora/fedora_image.sh](fedora/fedora_image.sh)
* [fedora/main.tf](fedora/main.tf)
* [fedora/variables.tf](fedora/variables.tf)

### Flatcar Linux

* [flatcar/flatcar_image.sh](flatcar/flatcar_image.sh)
* [flatcar/main.tf](flatcar/main.tf)
* [flatcar/variables.tf](flatcar/variables.tf)
* [Flatcar(stable) Cloud Images](https://stable.release.flatcar-linux.net/amd64-usr/current)

### FreeBSD

* [freebsd/freebsd_image.sh](freebsd__image.sh)
* [freebsd/main.tf](freebsd/main.tf)
* [freebsd/variables.tf](freebsd/variables.tf)

### Kali-Linux

* [kali-linux/kali_linux_cloudimg.sh](kali-linux/kali_linux_cloudimg.sh)
* [kali-linux/main.tf](kali-linux/main.tf)
* [kali-linux/variables.tf](kali-linux/variables.tf)

### OpenSuSE

* [opensuse/opensuse_image.sh](opensuse/opensuse_image.sh)
* [opensuse/main.tf](opensuse/main.tf)
* [opensuse/variables.tf](opensuse/variables.tf)
* [openSUSE Cloud Images](http://download.opensuse.org/repositories/Cloud:/Images:/)

### RancherOS

* [rancheros/ros_image.sh](rancheros/ros_image.sh)
* [rancheros/main.tf](rancheros/main.tf)
* [rancheros/variables.tf](rancheros/variables.tf)

### Ubuntu

* [ubuntu/ubuntu_image.sh](ubuntu/ubuntu_image.sh)
* [ubuntu/main.tf](ubuntu/main.tf)
* [ubuntu/variables.tf](ubuntu/variables.tf)
* [Ubuntu Cloud Images](https://cloud-images.ubuntu.com/daily/server/)

### Vyos

* [vyos/main.tf](vyos/main.tf)
* [vyos/variables.tf](vyos/variables.tf)
* [Vyos.io](https://vyos.io)
