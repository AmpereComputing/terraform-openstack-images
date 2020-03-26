## Cirros


resource "null_resource" "download-extract-image-cirros-040-x86_64" {
  count = var.enable_cirros_040_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/cirros_image.sh"
  }
}
resource "openstack_images_image_v2" "cirros-040-x86_64-raw" {
  count = var.enable_cirros_040_x86_64_raw ? 1:0
  name   = "cirros-0.4.0-x86_64"
  image_source_url = "https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-cirros-040-x86_64,
  ]
  properties = {
    os_distro = "cirros"
  }
}
resource "openstack_images_image_v2" "cirros-040-x86_64-qcow2" {
  count = var.enable_cirros_040_x86_64_qcow2 ? 1:0
  name   = "cirros-0.4.0-x86_64"
  image_source_url = "https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    os_distro = "cirros"
  }
}
