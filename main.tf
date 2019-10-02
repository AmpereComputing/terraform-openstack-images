module "archlinux_latest_x86_64" {
  source = "./archlinux"
  enable_archlinux_latest_x86_64_qcow2 = false
  enable_archlinux_latest_x86_64_raw = false
}
module "raw_centos_img" {
  source = "./centos"
  enable_centos = false
}
module "raw_cirros_img" {
  source = "./cirros"
  enable_cirros_040_x86_64_qcow2 = false
  enable_cirros_040_x86_64_raw = false
}
module "raw_coreos_img" {
  source = "./coreos"
  enable_coreos = false
}
module "raw_debian_img" {
  source = "./debian"
  enable_debian = false
}
module "raw_fedora_img" {
  source = "./fedora"
  enable_fedora = false
}
module "raw_flatcar_img" {
  source = "./flatcar"
  enable_flatcar = false
}
module "raw_freebsd_img" {
  source = "./freebsd"
  enable_freebsd = false
}
module "raw_kali-linux_img" {
  source = "./kali-linux"
  enable_kali-linux = false
}
module "raw_opensuse_img" {
  source = "./opensuse"
  enable_opensuse = false
}
module "raw_rancheros_img" {
  source = "./rancheros"
  enable_rancheros = false
}
module "raw_ubuntu_img" {
  source = "./ubuntu"
  enable_ubuntu = false
}
module "raw_vyos_img" {
  source = "./vyos"
  enable_vyos = false
}
