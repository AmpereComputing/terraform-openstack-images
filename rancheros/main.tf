## RancherOS
resource "openstack_images_image_v2" "rancheros" {
  name   = "RancherOS"
  image_source_url = "https://releases.rancher.com/os/latest/rancheros-openstack.img"
  container_format = "bare"
  disk_format = "raw"
  properties = {
    key = "value"
    os_distro = "rancheros"
  }
}
