# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-centos-atomic-x86_64" {
  count = var.enable_centos_atomic_host_x86_64_qcow2 || var.enable_centos_atomic_host_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "sh centos_atomic_image.sh"
  }
}

resource "openstack_images_image_v2" "centos_atomic_host_genericcloud_x86_64_qcow2" {
  count = var.enable_centos_atomic_host_x86_64_qcow2 ? 1:0
  name   = "centos-atomic-host-genericcloud-x86_64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-Atomic-Host-GenericCloud.qcow2")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-centos-atomic-x86_64,
  ]
  properties = {
    key = "value"
    os_distro = "centos"
  }
}

resource "openstack_images_image_v2" "centos_atomic_host_genericcloud_x86_64_raw" {
  count = var.enable_centos_atomic_host_x86_64_raw ? 1:0
  name   = "centos-atomic-host-genericcloud-x86_64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-Atomic-Host-GenericCloud.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-centos-atomic-x86_64,
  ]
  properties = {
    key = "value"
    os_distro = "centos"
  }
}
