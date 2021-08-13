![Ampere Computing](https://avatars2.githubusercontent.com/u/34519842?s=400&u=1d29afaac44f477cbb0226139ec83f73faefe154&v=4)

# terraform-openstack-images

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module for managing QCOW2 and RAW AARCH64 and x86_64 images for OpenStack.


## Images 

| Cloud Image | versions | x86_64 | aarch64 | QCOW2 | RAW |
| ------------------- | --- | ---| ---| ----- | --- |
| Archlinux | LATEST | X | | X | X |
| CentOS | 6.1901 | X | | X | X |
| CentOS | 7.2003 | X | X | X | X |
| CentOS | 7 | | X | X | X |
| CentOS | 8 | X | X | X | X |
| CentOS | 8.2 | X | X | X | X |
| CentOS | 8.3 | | X | X | X |
| CentOS | 8.4 | | X | X | X |
| CentOS-Stream | 8 | | X | X | X |
| CirrOS | 0.4.0 | X | | X | X |
| Debian | 9 | X | X | X | X |
| Debian | 10 | X | X | X | X |
| Debian | 11 | | X | X | |
| Devuan | ASCII 2.0.0 | X | | X | X |
| Fedora | 29 | X | X | X | X |
| Fedora | 30 | X | X | X | X |
| Fedora | 31 | X | X | X | X |
| Fedora | 32 | X | X | X | X |
| Fedora | 33 | X | X | X | X |
| Fedora | 34 | | X | X | X |
| Fedora-Atomic | 29 | X | | X | X | 
| Flatcar Linux | Stable | X | | X | X |
| Flatcar Linux | Alpha | X | X | X | X |
| Flatcar Linux | Beta | X | | X | X |
| FreeBSD | 12.0 Release | X | X | | |
| FreeBSD | 13.0 Current | | | X | X |
| Kali-Linux | Rolling Latest| X | | X | X |
| openAnolis | 8.2 GA ANCK || X | X ||
| openEuler | 20.03-LTS |X | X | X | X |
| OpenSuSE | Leap 15.0 |X | | X | X |
| OpenSuSE | Leap 15.1 |X | X | X | X |
| RancherOS | 1.5.5 | X | | X | X |
| Ubuntu | Trusty | X | X | X | X |
| Ubuntu | Xenial | X | X | X | X |
| Ubuntu | Bionic | X | X | X | X |
| Ubuntu | Focal | X | X | X | X |
| Vyos | Rolling | X | | X | X |

## Usage

Include something like the following in your code:

```
# Operating System Images for Glance using terraform-openstack-images module
module "glance_images" {
  source = "github.com/amperecomputing/terraform-openstack-images"
  # ArchLinux
  enable_archlinux_latest_x86_64_raw         = false
  enable_archlinux_latest_x86_64_qcow2       = false
  # Centos
  enable_centos_6_1901_x86_64_qcow2          = false
  enable_centos_6_1901_x86_64_raw            = false
  enable_centos_7_x86_64_qcow2               = false
  enable_centos_7_x86_64_raw                 = false
  enable_centos_8_x86_64_qcow2               = false
  enable_centos_8_x86_64_raw                 = false
  enable_centos_7_aarch64_qcow2              = true
  enable_centos_7_aarch64_raw                = false
  enable_centos_8_aarch64_qcow2              = false
  enable_centos_8_aarch64_raw                = false
  enable_centos_8_2_aarch64_qcow2            = true
  enable_centos_8_2_aarch64_raw              = false
  # Centos atomic
  enable_centos_atomic_host_x86_64_qcow2     = false
  enable_centos_atomic_host_x86_64_raw       = false
  # Cirrus
  enable_cirros_040_x86_64_qcow2             = false
  enable_cirros_040_x86_64_raw               = false
  # Debian
  enable_debian_9_amd64_qcow2                = false
  enable_debian_9_amd64_raw                  = false
  enable_debian_10_amd64_qcow2               = false
  enable_debian_10_amd64_raw                 = false
  enable_debian_9_arm64_qcow2                = true
  enable_debian_9_arm64_raw                  = false
  enable_debian_10_arm64_qcow2               = true
  enable_debian_10_arm64_raw                 = false
  enable_debian_11_arm64_qcow2               = true
  # Devuan
  enable_devuan_acsii_200_amd64_raw          = false
  enable_devuan_ascii_200_amd64_qcow2        = false
  # Fedora
  enable_fedora_atomic_29_aarch64_qcow2      = true
  enable_fedora_atomic_29_x86_64_qcow2       = false
  enable_fedora_atomic_29_x86_64_raw         = false
  enable_fedora_cloud_base_29_x86_64_qcow2   = false
  enable_fedora_cloud_base_29_x86_64_raw     = false
  enable_fedora_cloud_base_30_x86_64_qcow2   = false
  enable_fedora_cloud_base_30_x86_64_raw     = false
  enable_fedora_cloud_base_31_x86_64_qcow2   = false
  enable_fedora_cloud_base_31_x86_64_raw     = false
  enable_fedora_cloud_base_32_x86_64_qcow2   = false
  enable_fedora_cloud_base_32_x86_64_raw     = false
  enable_fedora_cloud_base_33_x86_64_qcow2   = false
  enable_fedora_cloud_base_33_x86_64_raw     = false
  enable_fedora_server_29_aarch64_qcow2      = true
  enable_fedora_server_29_aarch64_raw        = false
  enable_fedora_server_30_aarch64_qcow2      = true
  enable_fedora_server_30_aarch64_raw        = false
  enable_fedora_server_31_aarch64_qcow2      = true
  enable_fedora_server_31_aarch64_raw        = false
  enable_fedora_server_32_aarch64_qcow2      = true
  enable_fedora_server_32_aarch64_raw        = false
  enable_fedora_server_33_aarch64_qcow2      = true
  enable_fedora_server_33_aarch64_raw        = false
  # Flatcar
  enable_flatcar_current_stable_amd64_qcow2  = false
  enable_flatcar_current_stable_amd64_raw    = false
  enable_flatcar_current_alpha_amd64_qcow2   = false
  enable_flatcar_current_alpha_amd64_raw     = false
  enable_flatcar_current_beta_amd64_qcow2    = false
  enable_flatcar_current_beta_amd64_raw      = false
  enable_flatcar_current_alpha_arm64_qcow2   = true
  enable_flatcar_current_alpha_arm64_raw     = false
  # Freebsd
  enable_freebsd_120_release_amd64_qcow2     = false
  enable_freebsd_120_release_amd64_raw       = false
  enable_freebsd_120_release_aarch64_qcow2   = false
  enable_freebsd_120_release_aarch64_raw     = false
  # Kali Linux
  enable_kali_linux_2019_3_amd64_qcow2       = false
  enable_kali_linux_2019_3_amd64_raw         = false
  # openanolis
  enable_anolisos_82_aarch64_qcow2           = false
  # openEuler
  enable_openeuler_2003-LTS_x86_64_raw       = false
  enable_openeuler_2003-LTS_x86_64_qcow2     = false
  enable_openeuler_2003-LTS_aarch64_raw      = false
  enable_openeuler_2003-LTS_aarch64_qcow2    = false
  # OpenSuse
  enable_opensuse_leap_150_x86_64_qcow2      = false
  enable_opensuse_leap_150_x86_64_raw        = false
  enable_opensuse_leap_151_x86_64_qcow2      = false
  enable_opensuse_leap_151_x86_64_raw        = false
  enable_opensuse_151_aarch64_qcow2          = false
  enable_opensuse_151_aarch64_raw            = false
  # RancherOS
  enable_rancheros_openstack_amd64_qcow2     = false
  enable_rancheros_openstack_amd64_raw       = false
  # Ubuntu
  enable_ubuntu_2004_amd64_qcow2             = false
  enable_ubuntu_2004_amd64_raw               = false
  enable_ubuntu_1804_amd64_qcow2             = false
  enable_ubuntu_1804_amd64_raw               = false
  enable_ubuntu_1604_amd64_qcow2             = false
  enable_ubuntu_1604_amd64_raw               = false
  enable_ubuntu_1404_amd64_qcow2             = false
  enable_ubuntu_1404_amd64_raw               = false
  enable_ubuntu_2004_focal_arm64_qcow2       = true
  enable_ubuntu_2004_focal_arm64_raw         = false
  enable_ubuntu_1804_bionic_arm64_qcow2      = true
  enable_ubuntu_1804_bionic_arm64_raw        = false
  enable_ubuntu_1604_xenial_arm64_qcow2      = false
  enable_ubuntu_1604_xenial_arm64_raw        = false
  enable_ubuntu_1404_trusty_arm64_qcow2      = false
  enable_ubuntu_1404_trusty_arm64_raw        = false
  # Vyos
  enable_vyos_rolling_latest_amd64_raw       = false
}
```
Modify the setting for the images you want loaded to "true" in the above example

For example to enable the CentOS 7 AARCH64 image find the following line

```
enable_centos_7_aarch64_qcow2 = false
```

Change the line from false to true like in the following example.

```
enable_centos_7_aarch64_qcow2 = true
```


Remember to source your OpenStack credentials.

```
 . /etc/kolla/admin-openrc.sh
```

Execute terraform.

```
terraform init
terraform plan
terraform apply -auto-approve
```

## Contributing

Download the source
```
git clone https://github.com/AmpereComputing/terraform-openstack-images
cd terraform-openstack-images
```

## Assets

* [main.tf](main.tf) 
* [variables.tf](variables.tf) 

### Archlinux

* [archlinux/archlinux_image.sh](archlinux/archlinux_image.sh)
* [archlinux/main.tf](archlinux/main.tf)
* [archlinux/varibles.tf](archlinux/variables.tf)

### CentOS

* [centos/centos_image.sh](centos/centos_image.sh)
* [centos/centos_aarch64_image.sh](centos/centos_aarch64_image.sh)
* [centos/main.tf](centos/main.tf)
* [centos/variables.tf](centos/varibles.tf)

### CirrOS

* [cirros/cirros_image.sh](cirros/cirros_image.sh)
* [cirros/main.tf](cirros/main.tf)
* [cirros/variables.tf](cirros/variables.tf)

### Debian

* [debian/main.tf](debian/main.tf)
* [debian/main.tf](debian/variables.tf)

### Devuan

* [devuan/devuan_image.sh](devuan/devuan_image.sh)
* [devuan/main.tf](devuan/main.tf)
* [devuan/main.tf](devuan/variables.tf)

### Fedora

* [fedora/fedora_atomic_image.sh](fedora/fedora_atomic_image.sh)
* [fedora/fedora_aarch64_image.sh](fedora/fedora_aarch64_server_image.sh)
* [fedora/fedora_image.sh](fedora/fedora_image.sh)
* [fedora/main.tf](fedora/main.tf)
* [fedora/variables.tf](fedora/variables.tf)

### Flatcar Linux

* [flatcar/flatcar_image.sh](flatcar/flatcar_image.sh)
* [flatcar/main.tf](flatcar/main.tf)
* [flatcar/variables.tf](flatcar/variables.tf)

### FreeBSD

* [freebsd/freebsd_image.sh](freebsd/freebsd_image.sh)
* [freebsd/main.tf](freebsd/main.tf)
* [freebsd/variables.tf](freebsd/variables.tf)

### Kali-Linux

* [kali-linux/kali_linux_cloudimg.sh](kali-linux/kali_linux_cloudimg.sh)
* [kali-linux/main.tf](kali-linux/main.tf)
* [kali-linux/variables.tf](kali-linux/variables.tf)

### openEuler

 * [openeuler/main.tf](openeuler/main.tf)
 * [openeuler/openeuler_aarch64_image.sh](openeuler/openeuler_aarch64_image.sh)
 * [openeuler/openeuler_x86_64_image.sh](openeuler/openeuler_x86_64_image.sh)
 * [openeuler/varibles.tf](openeuler/varibles.tf)

### OpenSuSE

* [opensuse/opensuse_image.sh](opensuse/opensuse_image.sh)
* [opensuse/opensuse_aarch64_image.sh](opensuse/opensuse_aarch64_image.sh)
* [opensuse/main.tf](opensuse/main.tf)
* [opensuse/variables.tf](opensuse/variables.tf)

### RancherOS

* [rancheros/ros_image.sh](rancheros/ros_image.sh)
* [rancheros/main.tf](rancheros/main.tf)
* [rancheros/variables.tf](rancheros/variables.tf)

### Ubuntu

* [ubuntu/ubuntu_image.sh](ubuntu/ubuntu_image.sh)
* [ubuntu/ubuntu_arm64_image.sh](ubuntu/ubuntu_arm64_image.sh)
* [ubuntu/main.tf](ubuntu/main.tf)
* [ubuntu/variables.tf](ubuntu/variables.tf)

### Vyos

* [vyos/main.tf](vyos/main.tf)
* [vyos/variables.tf](vyos/variables.tf)


### Examples

* [example/main.tf](example/main.tf)

## References

* [Archlinux OpenStack Images](https://linuximages.de/openstack/arch/)
* [CoreOS (stable) Cloud Images](https://stable.release.core-os.net/amd64-usr/current)
* [Debian 9 OpenStack Images](https://cdimage.debian.org/cdimage/openstack/current-9/)
* [Debian 10 OpenStack Images](https://cdimage.debian.org/cdimage/openstack/current-10/)
* [Flatcar(stable) Cloud Images](https://stable.release.flatcar-linux.net/amd64-usr/current)
* [openSUSE Cloud Images](http://download.opensuse.org/repositories/Cloud:/Images:/)
* [Ubuntu Cloud Images](https://cloud-images.ubuntu.com/daily/server/)
* [Vyos.io](https://vyos.io)
