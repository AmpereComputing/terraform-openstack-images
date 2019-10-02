# OpenSuSE LEAP
resource "null_resource" "download-extract-image-opensuse-leap-15_1-x86_64" {
  count = var.enable_opensuse_leap_151_x86_64_qcow2 || var.enable_opensuse_leap_151_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/opensuse_image.sh"
  }
}

resource "openstack_images_image_v2" "opensuse-leap-151-x86_64-qcow2" {
  count = var.enable_opensuse_leap_151_x86_64_qcow2 ? 1:0
  name   = "openSUSE-leap-15.1-x86_64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/openSUSE-Leap-15.1-OpenStack.x86_64.qcow2")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-opensuse-leap-15_1-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
resource "openstack_images_image_v2" "opensuse-leap-151-x86_64-raw" {
  count = var.enable_opensuse_leap_151_x86_64_raw ? 1:0
  name   = "openSUSE-leap-15.1-x86_64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/openSUSE-Leap-15.1-OpenStack.x86_64.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-opensuse-leap-15_1-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
# OpenSuSE LEAP
resource "null_resource" "download-extract-image-opensuse-leap-15_0-x86_64" {
  count = var.enable_opensuse_leap_150_x86_64_qcow2 || var.enable_opensuse_leap_150_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/opensuse_image.sh"
  }
}

resource "openstack_images_image_v2" "opensuse-leap-150-x86_64-qcow2" {
  count = var.enable_opensuse_leap_150_x86_64_qcow2 ? 1:0
  name   = "openSUSE-leap-15.0-x86_64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/openSUSE-Leap-15.0-OpenStack.x86_64.qcow2")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-opensuse-leap-15_0-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
resource "openstack_images_image_v2" "opensuse-leap-150-x86_64-raw" {
  count = var.enable_opensuse_leap_150_x86_64_raw ? 1:0
  name   = "openSUSE-leap-15.0-x86_64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/openSUSE-Leap-15.0-OpenStack.x86_64.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-opensuse-leap-15_0-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
