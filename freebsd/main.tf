# Archlinux LATEST
resource "null_resource" "download-extract-image-freebsd-release-12" {
  provisioner "local-exec" {
    command = "sh freebsd_image.sh"
  }
}

resource "openstack_images_image_v2" "freebsd12" {
  name   = "FreeBSD-12.0-RELEASE-amd64"
  local_file_path = "${pathexpand("~/.terraform/image_cache/FreeBSD-12.0-RELEASE-amd64.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-freebsd-release-12",
  ]

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
