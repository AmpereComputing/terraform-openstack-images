# Archlinux LATEST
resource "null_resource" "download-extract-image-archlinux-latest" {
  count = var.enable_archlinux_latest_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "sh archlinux_image.sh"
  }
}

resource "openstack_images_image_v2" "archlinux_openstack_LATEST_image_bootstrap_x86_64_raw" {
  count = var.enable_archlinux_latest_x86_64_raw ? 1:0
  name   = "archlinux-openstack-LATEST-image-bootstrap-x86_64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/arch-openstack-LATEST-image-bootstrap.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-archlinux-latest,
  ]

  properties = {
    key = "value"
    os_distro = "archlinux"
  }
}

resource "openstack_images_image_v2" "archlinux_openstack_LATEST_image_bootstrap_x86_64_qcow2" {
  count = var.enable_archlinux_latest_x86_64_qcow2 ? 1:0
  name   = "archlinux-openstack-LATEST-image-bootstrap-x86_64-qcow2"
  image_source_url = "https://linuximages.de/openstack/arch/arch-openstack-LATEST-image-bootstrap.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "archlinux"
  }
}

