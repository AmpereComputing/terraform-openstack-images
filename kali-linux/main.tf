# Kali-Linux
# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-kali-linux-amd64" {
  count = var.enable_kali_linux_2019_3_amd64_qcow2 || var.enable_kali_linux_2019_3_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "sh kali_linux_cloudimg.sh"
  }
}
resource "openstack_images_image_v2" "kali_linux_2019_3a_amd64_qcow2" {
  count = var.enable_kali_linux_2019_3_amd64_qcow2 ? 1:0
  name   = "kali-linux-2019-3a-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/kali-linux-2019.3-amd64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-kali-linux-amd64,
  ]

  properties = {
    os_distro = "kali-linux"
  }
}
resource "openstack_images_image_v2" "kali_linux_2019_3a_amd64_raw" {
  count = var.enable_kali_linux_2019_3_amd64_raw ? 1:0
  name   = "kali-linux-2019-3a-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/kali-linux-2019.3-amd64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-kali-linux-amd64,
  ]

  properties = {
    os_distro = "kali-linux"
  }
}
