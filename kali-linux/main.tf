# Kali-Linux
# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-kali-linux" {
  provisioner "local-exec" {
    command = "kali_linux_cloudimg.sh"
  }
}
resource "openstack_images_image_v2" "kali-linux-2019_1" {
  name   = "kali-linux-2019_1-x86_64"
  local_file_path = "${pathexpand("~/.terraform/image_cache/kali-linux-2019.1-amd64.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-kali-linux",
  ]

  properties = {
    os_distro = "kali-linux"
  }
}
