## Coreos
# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-coreos-stable-amd64" {
  count = var.enable_coreos_current_stable_amd64_qcow2 || var.enable_coreos_current_stable_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/coreos_image.sh stable"
  }
}
resource "openstack_images_image_v2" "coreos_current_stable_amd64_qcow2" {
  count = var.enable_coreos_current_stable_amd64_qcow2 ? 1:0
  name   = "coreos-current-stable-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/stable/coreos_production_openstack_image.img")
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    null_resource.download-extract-image-coreos-stable-amd64,
  ]

  properties = {
    os_distro = "coreos"
  }
}
resource "openstack_images_image_v2" "coreos_current_00_stable_amd64_raw" {
  count = var.enable_coreos_current_stable_amd64_raw ? 1:0
  name   = "coreos-current-stable-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/stable/coreos_production_openstack_image.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-coreos-stable-amd64,
  ]

  properties = {
    os_distro = "coreos"
  }
}

resource "null_resource" "download-extract-image-coreos-alpha-amd64" {
  count = var.enable_coreos_current_alpha_amd64_qcow2 || var.enable_coreos_current_alpha_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/coreos_image.sh alpha"
  }
}

resource "openstack_images_image_v2" "coreos_current_alpha_amd64_qcow2" {
  count = var.enable_coreos_current_alpha_amd64_qcow2 ? 1:0
  name   = "coreos-current-alpha-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/alpha/coreos_production_openstack_image.img")
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    null_resource.download-extract-image-coreos-alpha-amd64,
  ]

  properties = {
    os_distro = "coreos"
    key = "value"
  }
}
resource "openstack_images_image_v2" "coreos_current_alpha_amd64_raw" {
  count = var.enable_coreos_current_alpha_amd64_raw ? 1:0
  name   = "coreos-current-alpha-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/alpha/coreos_production_openstack_image.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-coreos-alpha-amd64,
  ]

  properties = {
    os_distro = "coreos"
    key = "value"
  }
}

resource "null_resource" "download-extract-image-coreos-beta-amd64" {
  count = var.enable_coreos_current_beta_amd64_qcow2 || var.enable_coreos_current_beta_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/coreos_image.sh beta"
  }
}
resource "openstack_images_image_v2" "coreos_current_beta_amd64_qcow2" {
  count = var.enable_coreos_current_alpha_amd64_qcow2 ? 1:0
  name   = "coreos-current-beta-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/beta/coreos_production_openstack_image.img")
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    null_resource.download-extract-image-coreos-beta-amd64,
  ]

  properties = {
    key = "value"
    os_distro = "coreos"
  }
}
resource "openstack_images_image_v2" "coreos_current_beta_amd64_raw" {
  count = var.enable_coreos_current_alpha_amd64_raw ? 1:0
  name   = "coreos-current-beta-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/beta/coreos_production_openstack_image.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-coreos-beta-amd64,
  ]

  properties = {
    key = "value"
    os_distro = "coreos"
  }
}
