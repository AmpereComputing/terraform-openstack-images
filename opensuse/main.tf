# OpenSuSE LEAP
resource "null_resource" "download-extract-image-opensuse-leap-15_0" {
  provisioner "local-exec" {
    command = "sh opensuse_image.sh"
  }
}

resource "openstack_images_image_v2" "opensuse-leap-150" {
  name   = "OpenSuSE-Leap-15.0"
  local_file_path = "${pathexpand("~/.terraform/image_cache/openSUSE-Leap-15.0-OpenStack.x86_64-0.0.4-Buildlp150.12.140.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-opensuse-leap-15_0",
  ]

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
