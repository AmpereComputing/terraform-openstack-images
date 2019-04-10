## Cirros
resource "openstack_images_image_v2" "vyos_120-rolling" {
  name   = "vyos-1.2.0-rolling-amd64"
  image_source_url = "https://downloads.vyos.io/rolling/current/amd64/vyos-1.2.0-rolling%2B201903210337-amd64.iso"
  container_format = "bare"
  disk_format = "raw"

  properties = {
    os_distro = "vyos"
  }
}
