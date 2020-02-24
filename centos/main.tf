# CentOS
resource "null_resource" "download-extract-image-centos-7_1901" {
  count = var.enable_centos_7_1901_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "sh centos_image.sh 7"
  }
}
resource "openstack_images_image_v2" "centos-7-1901-x86_64-raw" {
  count = var.enable_centos_7_1901_x86_64_raw ? 1:0
  name   = "centos-7.1901-x86_64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-7-x86_64-GenericCloud-1901.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-centos-7_1901,
  ]

  properties = {
    os_distro = "centos"
  }
}
resource "openstack_images_image_v2" "centos-7-1901-x86_64-qcow2" {
  count = var.enable_centos_7_1901_x86_64_qcow2 ? 1:0
  name   = "centos-7.1901-x86_64-qcow2"
  image_source_url = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1601.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    os_distro = "centos"
  }
}

resource "null_resource" "download-extract-image-centos-6_1901" {
  count = var.enable_centos_6_1901_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "./centos_image.sh 6"
  }
}
resource "openstack_images_image_v2" "centos-6-1901-x86_64-raw" {
  count = var.enable_centos_6_1901_x86_64_raw ? 1:0
  name   = "centos-6.1901-x86_64-GenericCloud"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-6-x86_64-GenericCloud-1901.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-centos-6_1901,
  ]

  properties = {
    os_distro = "centos"
  }
}

resource "openstack_images_image_v2" "centos-6-1901-x86_64-qcow2" {
  count = var.enable_centos_6_1901_x86_64_qcow2 ? 1:0
  name   = "centos-6.1901-x86_64-qcow2"
  image_source_url = "https://cloud.centos.org/centos/6/images/CentOS-6-x86_64-GenericCloud-1601.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    os_distro = "centos"
  }
}

# CentOS AARCH64
resource "null_resource" "download-extract-image-centos-7_1708-aarch64" {
  count = var.enable_centos_7_1708_aarch64_raw || var.enable_centos_7_1708_aarch64_qcow2 ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/centos_aarch64_image.sh 7"
  }
}
resource "openstack_images_image_v2" "centos_7-1708_aarch64_raw" {
  count = var.enable_centos_7_1708_aarch64_raw ? 1:0
  name   = "centos-7-aarch64-GenericCloud-1708-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-7-aarch64-GenericCloud-1708.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-centos-7_1708-aarch64,
  ]

  properties = {
    os_distro = "centos"
  }
}
resource "openstack_images_image_v2" "centos_7-1708_aarch64_qcow2" {
  count = var.enable_centos_7_1708_aarch64_qcow2 ? 1:0
  name   = "centos-7-aarch64-GenericCloud-1708-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-7-aarch64-GenericCloud-1708.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    null_resource.download-extract-image-centos-7_1708-aarch64,
  ]
  properties = {
    os_distro = "centos"
  }
}

resource "null_resource" "download-extract-image-centos-8-aarch64" {
  count = var.enable_centos_8_aarch64_raw || var.enable_centos_8_aarch64_qcow2 ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/centos_aarch64_image.sh 8"
  }
}
resource "openstack_images_image_v2" "centos_8_aarch64_raw" {
  count = var.enable_centos_8_aarch64_raw ? 1:0
  name   = "centos-8-aarch64-GenericCloud-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-8-GenericCloud-8.1.1911-20200113.3.aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-centos-8-aarch64,
  ]

  properties = {
    os_distro = "centos"
  }
}
resource "openstack_images_image_v2" "centos_8_aarch64_qcow2" {
  count = var.enable_centos_8_aarch64_qcow2 ? 1:0
  name   = "centos-8-aarch64-GenericCloud-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-8-GenericCloud-8.1.1911-20200113.3.aarch64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    null_resource.download-extract-image-centos-8-aarch64,
  ]
  properties = {
    os_distro = "centos"
  }
}
