resource "null_resource" "download-extract-image-freebsd-release-12-amd64" {
  count = var.enable_freebsd_120_release_amd64_qcow2 || var.enable_freebsd_120_release_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/freebsd_image.sh"
  }
}
resource "openstack_images_image_v2" "freebsd-120-release-amd64-raw" {
  count = var.enable_freebsd_120_release_amd64_raw ? 1:0
  name   = "freebsd-12.0-release-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/FreeBSD-12.0-RELEASE-amd64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-freebsd-release-12-amd64,
  ]

  properties = {
    key = "value"
    os_distro = "freebsd"
  }
}
resource "openstack_images_image_v2" "freebsd-120-release-amd64-qcow2" {
  count = var.enable_freebsd_120_release_amd64_qcow2 ? 1:0
  name   = "freebsd-12.0-release-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/FreeBSD-12.0-RELEASE-amd64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-freebsd-release-12-amd64,
  ]

  properties = {
    key = "value"
    os_distro = "freebsd"
  }
}
resource "null_resource" "download-extract-image-freebsd-13-aarch64" {
  count = var.enable_freebsd_130_aarch64_qcow2 || var.enable_freebsd_130_aarch64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/freebsd_aarch64_image.sh"
  }
}
resource "openstack_images_image_v2" "freebsd-130-aarch64-raw" {
  count = var.enable_freebsd_130_aarch64_raw ? 1:0
  name   = "freebsd-13.0-RELEASE-arm64-aarch64.raw"
  local_file_path = pathexpand("~/.terraform/image_cache/FreeBSD-13.0-RELEASE-arm64-aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-freebsd-13-aarch64,
  ]

  properties = {
    key = "value"
    os_distro = "freebsd"
  }
}
resource "openstack_images_image_v2" "freebsd-130-aarch64-qcow2" {
  count = var.enable_freebsd_130_aarch64_qcow2 ? 1:0
  name   = "freebsd-13.0-RELEASE-arm64-aarch64.qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/FreeBSD-13.0-RELEASE-arm64-aarch64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-freebsd-13-aarch64,
  ]

  properties = {
    key = "value"
    os_distro = "freebsd"
  }
}
