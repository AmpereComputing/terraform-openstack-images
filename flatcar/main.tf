## Coreos
# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-flatcar-stable-amd64" {
  count = var.enable_flatcar_current_stable_amd64_qcow2 || var.enable_flatcar_current_stable_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/flatcar_image.sh stable"
  }
}
resource "openstack_images_image_v2" "flatcar_current_stable_amd64_qcow2" {
  count = var.enable_flatcar_current_stable_amd64_qcow2 ? 1:0
  name   = "flatcar-current-stable-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/stable/flatcar_production_openstack_image.img")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-stable-amd64,
  ]

  properties = {
    os_distro = "coreos"
  }
}
resource "openstack_images_image_v2" "flatcar_current_00_stable_amd64_raw" {
  count = var.enable_flatcar_current_stable_amd64_raw ? 1:0
  name   = "flatcar-current-stable-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/stable/flatcar_production_openstack_image.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-stable-amd64,
  ]

  properties = {
    os_distro = "coreos"
  }
}

resource "null_resource" "download-extract-image-flatcar-alpha-amd64" {
  count = var.enable_flatcar_current_alpha_amd64_qcow2 || var.enable_flatcar_current_alpha_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/flatcar_image.sh alpha"
  }
}

resource "openstack_images_image_v2" "flatcar_current_alpha_amd64_qcow2" {
  count = var.enable_flatcar_current_alpha_amd64_qcow2 ? 1:0
  name   = "flatcar-current-alpha-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/alpha/flatcar_production_openstack_image.img")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-alpha-amd64,
  ]

  properties = {
    os_distro = "coreos"
    key = "value"
  }
}
resource "openstack_images_image_v2" "flatcar_current_alpha_amd64_raw" {
  count = var.enable_flatcar_current_alpha_amd64_raw ? 1:0
  name   = "flatcar-current-alpha-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/alpha/flatcar_production_openstack_image.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-alpha-amd64,
  ]

  properties = {
    os_distro = "coreos"
    key = "value"
  }
}

resource "null_resource" "download-extract-image-flatcar-beta-amd64" {
  count = var.enable_flatcar_current_beta_amd64_qcow2 || var.enable_flatcar_current_beta_amd64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/flatcar_image.sh beta"
  }
}
resource "openstack_images_image_v2" "flatcar_current_beta_amd64_qcow2" {
  count = var.enable_flatcar_current_alpha_amd64_qcow2 ? 1:0
  name   = "flatcar-current-beta-amd64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/beta/flatcar_production_openstack_image.img")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-beta-amd64,
  ]

  properties = {
    key = "value"
    os_distro = "coreos"
  }
}
resource "openstack_images_image_v2" "flatcar_current_beta_amd64_raw" {
  count = var.enable_flatcar_current_alpha_amd64_raw ? 1:0
  name   = "flatcar-current-beta-amd64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/beta/flatcar_production_openstack_image.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-beta-amd64,
  ]

  properties = {
    key = "value"
    os_distro = "coreos"
  }
}
# https://alpha.release.flatcar-linux.net/arm64-usr/current/flatcar_production_openstack_image.img.bz2

resource "null_resource" "download-extract-image-flatcar-alpha-arm64" {
  count = var.enable_flatcar_current_alpha_arm64_qcow2 || var.enable_flatcar_current_alpha_arm64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/flatcar_arm64_image.sh alpha"
  }
}

resource "openstack_images_image_v2" "flatcar_current_alpha_arm64_qcow2" {
  count = var.enable_flatcar_current_alpha_arm64_qcow2 ? 1:0
  name   = "flatcar-current-alpha-arm64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/alpha/flatcar_production_openstack_image.img")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-alpha-arm64,
  ]

  properties = {
    os_distro = "coreos"
    key = "value"
  }
}
resource "openstack_images_image_v2" "flatcar_current_alpha_arm64_raw" {
  count = var.enable_flatcar_current_alpha_arm64_raw ? 1:0
  name   = "flatcar-current-alpha-arm64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/alpha/flatcar_production_openstack_image.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-flatcar-alpha-arm64,
  ]

  properties = {
    os_distro = "coreos"
    key = "value"
  }
}
