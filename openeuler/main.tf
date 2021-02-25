# openEuler
resource "null_resource" "download-extract-image-openeuler-2003-LTS-x86_64" {
  count = var.enable_openeuler_2003-LTS_x86_64_raw || var.enable_openeuler_2003-LTS_x86_64_qcow2 ? 1:0
  provisioner "local-exec" {
    command = "sh openeuler_x86_64_image.sh"
  }
}
resource "openstack_images_image_v2" "openeuler-2003-x86_64-raw" {
  count = var.enable_openeuler_2003-LTS_x86_64_raw ? 1:0
  name   = "openEuler-20.03-LTS.x86_64.raw"
  local_file_path = pathexpand("~/.terraform/image_cache/openEuler-20.03-LTS.x86_64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-openeuler-2003-LTS-x86_64,
  ]

  properties = {
    os_distro = "openeuler"
  }
}
resource "openstack_images_image_v2" "openeuler-2003-x86_64-qcow2" {
  count = var.enable_openeuler_2003-LTS_x86_64_qcow2 ? 1:0
  name   = "openEuler-20.03-LTS.x86_64.qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/openEuler-20.03-LTS.x86_64.qcow2")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-openeuler-2003-LTS-x86_64,
  ]

  properties = {
    os_distro = "openeuler"
  }
}

resource "null_resource" "download-extract-image-openeuler-2003-LTS-aarch64" {
  count = var.enable_openeuler_2003-LTS_aarch64_raw || var.enable_openeuler_2003-LTS_aarch64_qcow2 ? 1:0
  provisioner "local-exec" {
    command = "sh openeuler_aarch64_image.sh"
  }
}
resource "openstack_images_image_v2" "openeuler-2003-aarch64-raw" {
  count = var.enable_openeuler_2003-LTS_aarch64_raw ? 1:0
  name   = "openEuler-20.03-LTS.aarch64.raw"
  local_file_path = pathexpand("~/.terraform/image_cache/openEuler-20.03-LTS.aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-openeuler-2003-LTS-aarch64,
  ]

  properties = {
    os_distro = "openeuler"
  }
}
resource "openstack_images_image_v2" "openeuler-2003-aarch64-qcow2" {
  count = var.enable_openeuler_2003-LTS_aarch64_qcow2 ? 1:0
  name   = "openEuler-20.03-LTS.aarch64.qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/openEuler-20.03-LTS.aarch64.qcow2")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-openeuler-2003-LTS-aarch64,
  ]

  properties = {
    os_distro = "openeuler"
  }
}
