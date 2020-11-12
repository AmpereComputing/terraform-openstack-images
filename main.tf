module "archlinux" {
  source                               = "./archlinux"
  enable_archlinux_latest_x86_64_qcow2 = false
  enable_archlinux_latest_x86_64_raw   = false
}

module "centos" {
  source                             = "./centos"
  enable_centos_6_1901_x86_64_qcow2  = false
  enable_centos_6_1901_x86_64_raw    = false
  enable_centos_7_x86_64_qcow2       = false
  enable_centos_7_x86_64_raw         = false
  enable_centos_8_x86_64_qcow2       = false
  enable_centos_8_x86_64_raw         = false
  enable_centos_7_aarch64_qcow2      = true
  enable_centos_7_aarch64_raw        = false
  enable_centos_8_aarch64_qcow2      = false
  enable_centos_8_aarch64_raw        = false
  enable_centos_8_2_aarch64_qcow2    = true
  enable_centos_8_2_aarch64_raw      = false
}

module "centos-atomic" {
  source                                 = "./centos-atomic"
  enable_centos_atomic_host_x86_64_qcow2 = false
  enable_centos_atomic_host_x86_64_raw   = false
}

module "cirros" {
  source                         = "./cirros"
  enable_cirros_040_x86_64_qcow2 = false
  enable_cirros_040_x86_64_raw   = false
}

module "debian" {
  source                       = "./debian"
  enable_debian_9_amd64_qcow2  = false
  enable_debian_9_amd64_raw    = false
  enable_debian_10_amd64_qcow2 = false
  enable_debian_10_amd64_raw   = false
  enable_debian_9_arm64_qcow2  = true
  enable_debian_9_arm64_raw    = false
  enable_debian_10_arm64_qcow2 = true
  enable_debian_10_arm64_raw   = false
}

module "devuan" {
  source                              = "./devuan"
  enable_devuan_acsii_200_amd64_raw   = false
  enable_devuan_ascii_200_amd64_qcow2 = false
}

module "fedora" {
  source                                   = "./fedora"
  enable_fedora_atomic_29_aarch64_qcow2    = true
  enable_fedora_atomic_29_x86_64_qcow2     = false
  enable_fedora_atomic_29_x86_64_raw       = false
  enable_fedora_cloud_base_29_x86_64_qcow2 = false
  enable_fedora_cloud_base_29_x86_64_raw   = false
  enable_fedora_cloud_base_30_x86_64_qcow2 = false
  enable_fedora_cloud_base_30_x86_64_raw   = false
  enable_fedora_cloud_base_31_x86_64_qcow2 = false
  enable_fedora_cloud_base_31_x86_64_raw   = false
  enable_fedora_cloud_base_32_x86_64_qcow2 = false
  enable_fedora_cloud_base_32_x86_64_raw   = false
  enable_fedora_server_29_aarch64_qcow2    = false
  enable_fedora_server_29_aarch64_raw      = false
  enable_fedora_server_30_aarch64_qcow2    = false
  enable_fedora_server_30_aarch64_raw      = false
  enable_fedora_server_31_aarch64_qcow2    = true
  enable_fedora_server_31_aarch64_raw      = false
  enable_fedora_server_32_aarch64_qcow2    = true
  enable_fedora_server_32_aarch64_raw      = false
}

module "flatcar-linux" {
  source                                    = "./flatcar"
  enable_flatcar_current_stable_amd64_qcow2 = false
  enable_flatcar_current_stable_amd64_raw   = false
  enable_flatcar_current_alpha_amd64_qcow2  = false
  enable_flatcar_current_alpha_amd64_raw    = false
  enable_flatcar_current_beta_amd64_qcow2   = false
  enable_flatcar_current_beta_amd64_raw     = false
  enable_flatcar_current_alpha_arm64_qcow2  = true
  enable_flatcar_current_alpha_arm64_raw    = false
}

module "freebsd" {
  source                                   = "./freebsd"
  enable_freebsd_120_release_amd64_qcow2   = false
  enable_freebsd_120_release_amd64_raw     = false
  enable_freebsd_120_release_aarch64_qcow2 = false
  enable_freebsd_120_release_aarch64_raw   = false
}

module "kali-linux" {
  source                               = "./kali-linux"
  enable_kali_linux_2019_3_amd64_qcow2 = false
  enable_kali_linux_2019_3_amd64_raw   = false
}

module "opensuse" {
  source                                = "./opensuse"
  enable_opensuse_leap_150_x86_64_qcow2 = false
  enable_opensuse_leap_150_x86_64_raw   = false
  enable_opensuse_leap_151_x86_64_qcow2 = false
  enable_opensuse_leap_151_x86_64_raw   = false
  enable_opensuse_151_aarch64_qcow2     = false
  enable_opensuse_151_aarch64_raw       = false
}

module "rancheros" {
  source                                 = "./rancheros"
  enable_rancheros_openstack_amd64_qcow2 = false
  enable_rancheros_openstack_amd64_raw   = false
}

module "k3os" {
  source                  = "./k3os"
  enable_k3os_arm64_qcow2 = false
  enable_k3os_arm64_raw   = false
  enable_k3os_amd64_qcow2 = false
  enable_k3os_amd64_raw   = false
}

module "ubuntu" {
  source                                = "./ubuntu"
  enable_ubuntu_2004_amd64_qcow2        = false
  enable_ubuntu_2004_amd64_raw          = false
  enable_ubuntu_1804_amd64_qcow2        = false
  enable_ubuntu_1804_amd64_raw          = false
  enable_ubuntu_1604_amd64_qcow2        = false
  enable_ubuntu_1604_amd64_raw          = false
  enable_ubuntu_1404_amd64_qcow2        = false
  enable_ubuntu_1404_amd64_raw          = false
  enable_ubuntu_2004_focal_arm64_qcow2  = true
  enable_ubuntu_2004_focal_arm64_raw    = false
  enable_ubuntu_1804_bionic_arm64_qcow2 = true
  enable_ubuntu_1804_bionic_arm64_raw   = false
  enable_ubuntu_1604_xenial_arm64_qcow2 = false
  enable_ubuntu_1604_xenial_arm64_raw   = false
  enable_ubuntu_1404_trusty_arm64_qcow2 = false
  enable_ubuntu_1404_trusty_arm64_raw   = false
}

module "vyos" {
  source                               = "./vyos"
  enable_vyos_rolling_latest_amd64_raw = false
}
