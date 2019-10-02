module "archlinux" {
  source = "./archlinux"
  enable_archlinux_latest_x86_64_qcow2 = false
  enable_archlinux_latest_x86_64_raw = false
}
module "raw_centos_img" {
  source = "./centos"
  enable_centos = false
}
module "centos-atomic" {
  source = "./centos-atomic"
  enable_centos_atomic_host_x86_64_qcow2 = false
  enable_centos_atomic_host_x86_64_raw = false
}
module "cirros" {
  source = "./cirros"
  enable_cirros_040_x86_64_qcow2 = false
  enable_cirros_040_x86_64_raw = false
}
module "coreos" {
  source = "./coreos"
  enable_coreos_current_stable_amd64_qcow2 = false
  enable_coreos_current_stable_amd64_raw = false
  enable_coreos_current_alpha_amd64_qcow2 = false
  enable_coreos_current_alpha_amd64_raw = false
  enable_coreos_current_beta_amd64_qcow2 = false
  enable_coreos_current_beta_amd64_raw = false
}
module "debian" {
  source = "./debian"
  enable_debian_9_amd64_qcow2 = false
  enable_debian_9_amd64_raw = false
  enable_debian_10_amd64_qcow2 = false
  enable_debian_10_amd64_raw = false
}
module "fedora" {
  source = "./fedora"
  enable_fedora_atomic_29_x86_64_qcow2 = false
  enable_fedora_atomic_29_x86_64_raw = false
  enable_fedora_cloud_base_29_x86_64_qcow2 = false
  enable_fedora_cloud_base_29_x86_64_raw = false
  enable_fedora_cloud_base_30_x86_64_qcow2 = false
  enable_fedora_cloud_base_30_x86_64_raw = false
}
module "flatcar-linux" {
  source = "./flatcar"
  enable_flatcar_current_stable_amd64_qcow2 = false
  enable_flatcar_current_stable_amd64_raw = false
  enable_flatcar_current_alpha_amd64_qcow2 = false
  enable_flatcar_current_alpha_amd64_raw = false
  enable_flatcar_current_beta_amd64_qcow2 = false
  enable_flatcar_current_beta_amd64_raw = false
}

module "freebsd" {
  source = "./freebsd"
  enable_freebsd_120_release_amd64_qcow2 = false
  enable_freebsd_120_release_amd64_raw = false
}
module "kali-linux" {
  source = "./kali-linux"
  enable_kali_linux_2019_3_amd64_qcow2 = false
  enable_kali_linux_2019_3_amd64_raw = false
}
module "raw_opensuse_img" {
  source = "./opensuse"
  enable_opensuse = false
}
module "rancheros" {
  source = "./rancheros"
  enable_rancheros_openstack_amd64_qcow2 = false
  enable_rancheros_openstack_amd64_raw = false
}
module "raw_ubuntu_img" {
  source = "./ubuntu"
  enable_ubuntu = false
}
module "vyos" {
  source = "./vyos"
  enable_vyos_rolling_latest_amd64_raw = false
}
