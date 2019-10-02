resource "null_resource" "download-extract-image-bionic" {
  count = var.enable_ubuntu_1804_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/ubuntu_image.sh bionic"
  }
}
resource "openstack_images_image_v2" "ubuntu-1804-bionic-raw" {
  count = var.enable_ubuntu_1804_amd64_raw ? 1:0
  name = "ubuntu-18.04-bionic-amd64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/bionic-server-cloudimg-amd64-disk1.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-bionic"
  ]
  properties = {
    os_distro = "ubuntu"
  }
}

resource "null_resource" "download-extract-image-xenial-amd64" {
  count = var.enable_ubuntu_1604_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/ubuntu_image.sh xenial"
  }
}
resource "openstack_images_image_v2" "ubuntu-1604-xenial-amd64-raw" {
  count = var.enable_ubuntu_1604_amd64_raw ? 1:0
  name   = "ubuntu-16.04-xenial-amd64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/xenial-server-cloudimg-amd64-disk1.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-xenial-amd64"
  ]

  properties = {
    os_distro = "ubuntu"
  }
}
resource "null_resource" "download-extract-image-trusty-amd64" {
  count = var.enable_ubuntu_1404_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/ubuntu_image.sh trusty"
  }
}
resource "openstack_images_image_v2" "ubuntu-1404-trusty-amd64-raw" {
  count = var.enable_ubuntu_1404_amd64_raw ? 1:0
  name   = "ubuntu-14.04-trusty-amd64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/trusty-server-cloudimg-amd64-disk1.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-trusty-amd64"
  ]

  properties = {
    os_distro = "ubuntu"
  }
}
resource "openstack_images_image_v2" "ubuntu-1804-bionic-amd64-qcow2" {
  count = var.enable_ubuntu_1804_amd64_qcow2 ? 1:0
  name   = "ubuntu-18.04-bionic-amd64-qcow2"
  image_source_url = "https://cloud-images.ubuntu.com/daily/server/xenial/current/xenial-server-cloudimg-amd64-disk1.img"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    os_distro = "ubuntu"
  }
}
resource "openstack_images_image_v2" "ubuntu-1604-xenial-amd64-qcow2" {
  count = var.enable_ubuntu_1404_amd64_qcow2 ? 1:0
  name   = "ubuntu-16.04-xenial-amd64-qcow2"
  image_source_url = "https://cloud-images.ubuntu.com/daily/server/xenial/current/xenial-server-cloudimg-amd64-disk1.img"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    os_distro = "ubuntu"
  }
}
resource "openstack_images_image_v2" "ubuntu-1404-trusty-amd64-qcow2" {
  count = var.enable_ubuntu_1404_amd64_qcow2 ? 1:0
  name   = "ubuntu-14.04-trusty-amd64-qcow2"
  image_source_url = "https://cloud-images.ubuntu.com/daily/server/trusty/current/trusty-server-cloudimg-amd64-disk1.img"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    os_distro = "ubuntu"
  }
}

