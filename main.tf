module "archlinux" {
  source                               = "./archlinux"
  enable_archlinux_latest_x86_64_qcow2 = var.enable_archlinux_latest_x86_64_qcow2
  enable_archlinux_latest_x86_64_raw   = var.enable_archlinux_latest_x86_64_raw
}

module "centos" {
  source                             = "./centos"
  enable_centos_6_1901_x86_64_qcow2  = var.enable_centos_6_1901_x86_64_qcow2
  enable_centos_6_1901_x86_64_raw    = var.enable_centos_6_1901_x86_64_raw
  enable_centos_7_x86_64_qcow2       = var.enable_centos_7_x86_64_qcow2
  enable_centos_7_x86_64_raw         = var.enable_centos_7_x86_64_raw
  enable_centos_8_x86_64_qcow2       = var.enable_centos_8_x86_64_qcow2
  enable_centos_8_x86_64_raw         = var.enable_centos_8_x86_64_raw
  enable_centos_7_aarch64_qcow2      = var.enable_centos_7_aarch64_qcow2
  enable_centos_7_aarch64_raw        = var.enable_centos_7_aarch64_raw
  enable_centos_8_aarch64_qcow2      = var.enable_centos_8_aarch64_qcow2
  enable_centos_8_aarch64_raw        = var.enable_centos_8_aarch64_raw
  enable_centos_8_2_aarch64_qcow2    = var.enable_centos_8_2_aarch64_qcow2
  enable_centos_8_2_aarch64_raw      = var.enable_centos_8_2_aarch64_raw
  enable_centos_8_3_aarch64_qcow2    = var.enable_centos_8_3_aarch64_qcow2
  enable_centos_8_3_aarch64_raw      = var.enable_centos_8_3_aarch64_raw
  enable_centos_8_4_aarch64_qcow2    = var.enable_centos_8_4_aarch64_qcow2
  enable_centos_8_4_aarch64_raw      = var.enable_centos_8_4_aarch64_raw
}

module "centos-atomic" {
  source                                 = "./centos-atomic"
  enable_centos_atomic_host_x86_64_qcow2 = var.enable_centos_atomic_host_x86_64_qcow2
  enable_centos_atomic_host_x86_64_raw   = var.enable_centos_atomic_host_x86_64_raw
}
module "centos-stream" {
  source                                 = "./centos-stream"
  enable_centos_stream_8_aarch64_qcow2 = var.enable_centos_stream_8_aarch64_qcow2
  enable_centos_stream_8_aarch64_raw   = var.enable_centos_stream_8_aarch64_raw
}

module "cirros" {
  source                          = "./cirros"
  enable_cirros_051_x86_64_qcow2  = var.enable_cirros_051_x86_64_qcow2
  enable_cirros_051_x86_64_raw    = var.enable_cirros_051_x86_64_raw
  enable_cirros_051_aarch64_qcow2 = var.enable_cirros_051_aarch64_qcow2
  enable_cirros_051_aarch64_raw   = var.enable_cirros_051_aarch64_raw
}

module "debian" {
  source                       = "./debian"
  enable_debian_9_amd64_qcow2  = var.enable_debian_9_amd64_qcow2
  enable_debian_9_amd64_raw    = var.enable_debian_9_amd64_raw
  enable_debian_10_amd64_qcow2 = var.enable_debian_10_amd64_qcow2
  enable_debian_10_amd64_raw   = var.enable_debian_10_amd64_raw
  enable_debian_9_arm64_qcow2  = var.enable_debian_9_arm64_qcow2
  enable_debian_9_arm64_raw    = var.enable_debian_9_arm64_raw
  enable_debian_10_arm64_qcow2 = var.enable_debian_10_arm64_qcow2
  enable_debian_10_arm64_raw   = var.enable_debian_10_arm64_raw
  enable_debian_11_arm64_qcow2 = var.enable_debian_11_arm64_qcow2
}

module "devuan" {
  source                              = "./devuan"
  enable_devuan_acsii_200_amd64_raw   = var.enable_devuan_acsii_200_amd64_raw
  enable_devuan_ascii_200_amd64_qcow2 = var.enable_devuan_ascii_200_amd64_qcow2
}

module "fedora" {
  source                                   = "./fedora"
  enable_fedora_atomic_29_aarch64_qcow2    = var.enable_fedora_atomic_29_aarch64_qcow2
  enable_fedora_atomic_29_x86_64_qcow2     = var.enable_fedora_atomic_29_x86_64_qcow2
  enable_fedora_atomic_29_x86_64_raw       = var.enable_fedora_atomic_29_x86_64_raw
  enable_fedora_cloud_base_29_x86_64_qcow2 = var.enable_fedora_cloud_base_29_x86_64_qcow2
  enable_fedora_cloud_base_29_x86_64_raw   = var.enable_fedora_cloud_base_29_x86_64_raw
  enable_fedora_cloud_base_30_x86_64_qcow2 = var.enable_fedora_cloud_base_30_x86_64_qcow2
  enable_fedora_cloud_base_30_x86_64_raw   = var.enable_fedora_cloud_base_30_x86_64_raw
  enable_fedora_cloud_base_31_x86_64_qcow2 = var.enable_fedora_cloud_base_31_x86_64_qcow2
  enable_fedora_cloud_base_31_x86_64_raw   = var.enable_fedora_cloud_base_31_x86_64_raw
  enable_fedora_cloud_base_32_x86_64_qcow2 = var.enable_fedora_cloud_base_32_x86_64_qcow2
  enable_fedora_cloud_base_32_x86_64_raw   = var.enable_fedora_cloud_base_32_x86_64_raw
  enable_fedora_cloud_base_33_x86_64_qcow2 = var.enable_fedora_cloud_base_33_x86_64_qcow2
  enable_fedora_cloud_base_33_x86_64_raw   = var.enable_fedora_cloud_base_33_x86_64_raw
  enable_fedora_server_29_aarch64_qcow2    = var.enable_fedora_server_29_aarch64_qcow2
  enable_fedora_server_29_aarch64_raw      = var.enable_fedora_server_29_aarch64_raw
  enable_fedora_server_30_aarch64_qcow2    = var.enable_fedora_server_30_aarch64_qcow2
  enable_fedora_server_30_aarch64_raw      = var.enable_fedora_server_30_aarch64_raw
  enable_fedora_server_31_aarch64_qcow2    = var.enable_fedora_server_31_aarch64_qcow2
  enable_fedora_server_31_aarch64_raw      = var.enable_fedora_server_31_aarch64_raw
  enable_fedora_server_32_aarch64_qcow2    = var.enable_fedora_server_32_aarch64_qcow2
  enable_fedora_server_32_aarch64_raw      = var.enable_fedora_server_32_aarch64_raw
  enable_fedora_server_33_aarch64_qcow2    = var.enable_fedora_server_33_aarch64_qcow2
  enable_fedora_server_33_aarch64_raw      = var.enable_fedora_server_33_aarch64_raw
  enable_fedora_server_34_aarch64_qcow2    = var.enable_fedora_server_34_aarch64_qcow2
  enable_fedora_server_34_aarch64_raw      = var.enable_fedora_server_34_aarch64_raw
}

module "flatcar-linux" {
  source                                    = "./flatcar"
  enable_flatcar_current_stable_amd64_qcow2 = var.enable_flatcar_current_stable_amd64_qcow2
  enable_flatcar_current_stable_amd64_raw   = var.enable_flatcar_current_stable_amd64_raw
  enable_flatcar_current_alpha_amd64_qcow2  = var.enable_flatcar_current_alpha_amd64_qcow2
  enable_flatcar_current_alpha_amd64_raw    = var.enable_flatcar_current_alpha_amd64_raw
  enable_flatcar_current_beta_amd64_qcow2   = var.enable_flatcar_current_beta_amd64_qcow2
  enable_flatcar_current_beta_amd64_raw     = var.enable_flatcar_current_beta_amd64_raw
  enable_flatcar_current_alpha_arm64_qcow2  = var.enable_flatcar_current_alpha_arm64_qcow2
  enable_flatcar_current_alpha_arm64_raw    = var.enable_flatcar_current_alpha_arm64_raw
}

module "freebsd" {
  source                                 = "./freebsd"
  enable_freebsd_120_release_amd64_qcow2 = var.enable_freebsd_120_release_amd64_qcow2
  enable_freebsd_120_release_amd64_raw   = var.enable_freebsd_120_release_amd64_raw
  enable_freebsd_130_aarch64_qcow2       = var.enable_freebsd_130_aarch64_qcow2
  enable_freebsd_130_aarch64_raw         = var.enable_freebsd_130_aarch64_raw
}

module "kali-linux" {
  source                               = "./kali-linux"
  enable_kali_linux_2019_3_amd64_qcow2 = var.enable_kali_linux_2019_3_amd64_qcow2
  enable_kali_linux_2019_3_amd64_raw   = var.enable_kali_linux_2019_3_amd64_raw
}

module "openanolis" {
  source                           = "./openanolis"
  enable_anolisos_82_aarch64_qcow2 = var.enable_anolisos_82_aarch64_qcow2
}

module "openeuler" {
  source                                  = "./openeuler"
  enable_openeuler_2003-LTS_x86_64_raw    = var.enable_openeuler_2003-LTS_x86_64_raw
  enable_openeuler_2003-LTS_x86_64_qcow2  = var.enable_openeuler_2003-LTS_x86_64_qcow2
  enable_openeuler_2003-LTS_aarch64_raw   = var.enable_openeuler_2003-LTS_aarch64_raw
  enable_openeuler_2003-LTS_aarch64_qcow2 = var.enable_openeuler_2003-LTS_aarch64_qcow2
}

module "opensuse" {
  source                                = "./opensuse"
  enable_opensuse_leap_150_x86_64_qcow2 = var.enable_opensuse_leap_150_x86_64_qcow2
  enable_opensuse_leap_150_x86_64_raw   = var.enable_opensuse_leap_150_x86_64_raw
  enable_opensuse_leap_151_x86_64_qcow2 = var.enable_opensuse_leap_151_x86_64_qcow2
  enable_opensuse_leap_151_x86_64_raw   = var.enable_opensuse_leap_151_x86_64_raw
  enable_opensuse_151_aarch64_qcow2     = var.enable_opensuse_151_aarch64_qcow2
  enable_opensuse_151_aarch64_raw       = var.enable_opensuse_151_aarch64_raw
  enable_opensuse_152_aarch64_qcow2     = var.enable_opensuse_152_aarch64_qcow2
  enable_opensuse_152_aarch64_raw       = var.enable_opensuse_152_aarch64_raw
}

module "oraclelinux" {
  source                            = "./oraclelinux"
  enable_oraclelinux_r8u2_arm64_iso =  var.enable_oraclelinux_r8u2_arm64_iso
}


module "rancheros" {
  source                                 = "./rancheros"
  enable_rancheros_openstack_amd64_qcow2 = var.enable_rancheros_openstack_amd64_qcow2
  enable_rancheros_openstack_amd64_raw   = var.enable_rancheros_openstack_amd64_raw
}

module "ubuntu" {
  source                                  = "./ubuntu"
  enable_ubuntu_2004_amd64_qcow2          = var.enable_ubuntu_2004_amd64_qcow2
  enable_ubuntu_2004_amd64_raw            = var.enable_ubuntu_2004_amd64_raw
  enable_ubuntu_1804_amd64_qcow2          = var.enable_ubuntu_1804_amd64_qcow2
  enable_ubuntu_1804_amd64_raw            = var.enable_ubuntu_1804_amd64_raw
  enable_ubuntu_1604_amd64_qcow2          = var.enable_ubuntu_1604_amd64_qcow2
  enable_ubuntu_1604_amd64_raw            = var.enable_ubuntu_1604_amd64_raw  
  enable_ubuntu_1404_amd64_qcow2          = var.enable_ubuntu_1404_amd64_qcow2
  enable_ubuntu_1404_amd64_raw            = var.enable_ubuntu_1404_amd64_raw
  enable_ubuntu_2104_hirsute_arm64_qcow2  = var.enable_ubuntu_2104_hirsute_arm64_qcow2
  enable_ubuntu_2104_hirsute_arm64_raw    = var.enable_ubuntu_2104_hirsute_arm64_raw
  enable_ubuntu_2004_focal_arm64_qcow2    = var.enable_ubuntu_2004_focal_arm64_qcow2
  enable_ubuntu_2004_focal_arm64_raw      = var.enable_ubuntu_2004_focal_arm64_raw
  enable_ubuntu_1804_bionic_arm64_qcow2   = var.enable_ubuntu_1804_bionic_arm64_qcow2
  enable_ubuntu_1804_bionic_arm64_raw     = var.enable_ubuntu_1804_bionic_arm64_raw
  enable_ubuntu_1604_xenial_arm64_qcow2   = var.enable_ubuntu_1604_xenial_arm64_qcow2
  enable_ubuntu_1604_xenial_arm64_raw     = var.enable_ubuntu_1604_xenial_arm64_raw
  enable_ubuntu_1404_trusty_arm64_qcow2   = var.enable_ubuntu_1404_trusty_arm64_qcow2
  enable_ubuntu_1404_trusty_arm64_raw     = var.enable_ubuntu_1404_trusty_arm64_raw
}

module "vyos" {
  source                               = "./vyos"
  enable_vyos_rolling_latest_amd64_raw = var.enable_vyos_rolling_latest_amd64_raw
}
