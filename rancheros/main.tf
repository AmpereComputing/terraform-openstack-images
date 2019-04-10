## RancherOS
resource "null_resource" "download-extract-image-rancheros" {
  provisioner "local-exec" {
    command = "./ros_image.sh 1.5.1"
  }
}
resource "openstack_images_image_v2" "rancheros_151_openstack" {
  name   = "rancheros-1.5.1-openstack"
  local_file_path = "${pathexpand("~/.terraform/image_cache/rancheros-1.5.1-openstack.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-rancheros",
  ]

  properties = {
    key = "value"
    os_distro = "rancheros"
  }
}
