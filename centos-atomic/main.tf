# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-centos-atomic" {
  provisioner "local-exec" {
    command = "sh centos_atomic_image.sh"
  }
}

resource "openstack_images_image_v2" "centos_atomic_host_genericcloud" {
  name   = "centos-atomic-host-genericcloud"
  local_file_path = "${pathexpand("~/.terraform/image_cache/CentOS-Atomic-Host-GenericCloud.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-centos-atomic",
  ]
  properties = {
    key = "value"
    os_distro = "centos"
  }
}
