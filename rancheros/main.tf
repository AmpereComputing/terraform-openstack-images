## RancherOS
resource "null_resource" "download-extract-image-rancheros" {
  count = var.enable_rancheros_openstack_amd64_raw ? 1:0

  provisioner "local-exec" {
    command = "./ros_image.sh 1.5.4"
  }
}
resource "openstack_images_image_v2" "rancheros_openstack_154_amd64_raw" {
  count = var.enable_rancheros_openstack_amd64_raw ? 1:0
  name   = "rancheros-1.5.4-openstack-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/rancheros-1.5.4-openstack.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-rancheros,
  ]

  properties = {
    key = "value"
    os_distro = "rancheros"
  }
}

resource "openstack_images_image_v2" "rancheros_openstack_154_amd64_qcow2" {
  count = var.enable_rancheros_openstack_amd64_qcow2 ? 1:0
  name   = "rancheros-1.5.4-openstack-amd64-qcow2"
  image_source_url = "https://github.com/rancher/os/releases/download/v1.5.4/rancheros-openstack.img"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    key = "value"
    os_distro = "rancheros"
  }
}
