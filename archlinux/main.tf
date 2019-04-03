# OpenSuSE LEAP
resource "null_resource" "download-extract-image-archlinux-latest" {
  provisioner "local-exec" {
    command = "./archlinux_image.sh"
  }
}

resource "openstack_images_image_v2" "archlinux" {
  name   = "archlinux-openstack-LATEST-image-bootstrap"
  local_file_path = "${pathexpand("~/.terraform/image_cache/arch-openstack-LATEST-image-bootstrap.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-archlinux-latest",
  ]

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
