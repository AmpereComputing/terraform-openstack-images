## Cirros
resource "openstack_images_image_v2" "cirros-040" {
  name   = "Cirros-0.4.0-x86_64"
  image_source_url = "https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"

  properties = {
    os_distro = "cirros"
  }
}
