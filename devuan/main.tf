resource "null_resource" "download-extract-image-devuan-amd64" {
  count = var.enable_devuan_ascii_200_amd64_qcow2 || var.enable_devuan_acsii_200_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/devuan_image.sh"
  }
}
resource "openstack_images_image_v2" "devuan_ascii_200_amd64_qcow2" {
  count = var.enable_devuan_ascii_200_amd64_qcow2 ? 1:0
  name   = "devuan-ascii-2.0.0-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/devuan_ascii_2.0.0_amd64_qemu.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-devuan-amd64,
  ]

  properties = {
    os_distro = "devuan"
  }
}
resource "openstack_images_image_v2" "devuan_ascii_200_amd64_raw" {
  count = var.enable_devuan_acsii_200_amd64_raw ? 1:0
  name   = "devuan-ascii-2.0.0-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/devuan_ascii_2.0.0_amd64_qemu.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-devuan-amd64,
  ]

  properties = {
    os_distro = "devuan"
  }
}
