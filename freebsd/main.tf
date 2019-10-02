resource "null_resource" "download-extract-image-freebsd-release-12-amd64" {
  count = var.enable_freebsd_120_release_amd64_qcow2 || var.enable_freebsd_120_release_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/freebsd_image.sh"
  }
}
resource "openstack_images_image_v2" "freebsd-120-release-amd64-raw" {
  count = var.enable_freebsd_120_release_amd64_raw ? 1:0
  name   = "freebsd-12.0-release-amd64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/FreeBSD-12.0-RELEASE-amd64.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-freebsd-release-12-amd64",
  ]

  properties = {
    key = "value"
    os_distro = "freebsd"
  }
}
resource "openstack_images_image_v2" "freebsd-120-release-amd64-qcow2" {
  count = var.enable_freebsd_120_release_amd64_qcow2 ? 1:0
  name   = "freebsd-12.0-release-amd64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/FreeBSD-12.0-RELEASE-amd64.qcow2")}"
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    "null_resource.download-extract-image-freebsd-release-12-amd64",
  ]

  properties = {
    key = "value"
    os_distro = "freebsd"
  }
}
