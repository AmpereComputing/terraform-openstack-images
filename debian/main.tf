# Debian OpenStack Images
resource "openstack_images_image_v2" "rancheros" {
  name   = "debian-9-openstack-amd64"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-9/debian-9-openstack-amd64.raw"
  container_format = "bare"
  disk_format = "raw"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
