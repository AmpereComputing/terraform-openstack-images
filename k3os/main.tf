## K3OS
resource "openstack_images_image_v2" "k3os_arm64" {
  count = var.enable_k3os_arm64_raw ? 1:0
  name   = "k30s-arm64.iso"
  image_source_url = "https://github.com/rancher/k3os/releases/download/v0.3.0/k3os-arm64.iso"
  container_format = "bare"
  disk_format = "raw"
  properties = {
    os_distro = "vyos"
  }
}
resource "openstack_images_image_v2" "k3os_amd64" {
  count = var.enable_k3os_amd64_raw ? 1:0
  name   = "k30s-amd64.iso"
  image_source_url = "https://github.com/rancher/k3os/releases/download/v0.3.0/k3os-amd64.iso"
  container_format = "bare"
  disk_format = "raw"
  properties = {
    os_distro = "vyos"
  }
}
