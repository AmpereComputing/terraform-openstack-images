# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-fedora-atomic" {
  count = var.enable_fedora_atomic_29_x86_64_qcow2 || var.enable_fedora_atomic_29_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/fedora_atomic_image.sh"
  }
}


resource "openstack_images_image_v2" "fedora_atomic_29_x86_64_raw" {
  count = var.enable_fedora_atomic_29_x86_64_raw ? 1:0
  name   = "fedora-atomichost-29-x86_64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/Fedora-AtomicHost-29.raw")}"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    "null_resource.download-extract-image-fedora-atomic",
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
  }
}

resource "openstack_images_image_v2" "fedora_atomic_29_x86_64_qcow2" {
  count = var.enable_fedora_atomic_29_x86_64_qcow2 ? 1:0
  name   = "fedora-atomichost-29-x86_64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/Fedora-AtomicHost-29.qcow2")}"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    "null_resource.download-extract-image-fedora-atomic",
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
  }
}

resource "null_resource" "download-extract-image-fedora-29-cloud-base-x86_64" {
  count = var.enable_fedora_cloud_base_29_x86_64_qcow2 || var.enable_fedora_cloud_base_29_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/fedora_image.sh 29"
  }
}
resource "openstack_images_image_v2" "fedora-29-cloud-base-x86_64-qcow2" {
  count = var.enable_fedora_cloud_base_29_x86_64_qcow2 ? 1:0
  name   = "fedora-cloud-base-29-x86_64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-29-1.2.x86_64.qcow2")}"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    "null_resource.download-extract-image-fedora-29-cloud-base-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

resource "openstack_images_image_v2" "fedora-29-cloud-base-x86_64-raw" {
  count = var.enable_fedora_cloud_base_29_x86_64_raw ? 1:0
  name   = "fedora-cloud-base-29-x86_64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-29-1.2.x86_64.raw")}"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    "null_resource.download-extract-image-fedora-29-cloud-base-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

resource "null_resource" "download-extract-image-fedora-30-cloud-base-x86_64" {
  count = var.enable_fedora_cloud_base_30_x86_64_qcow2 || var.enable_fedora_cloud_base_30_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/fedora_image.sh 30"
  }
}
resource "openstack_images_image_v2" "fedora-30-cloud-base-x86_64-qcow2" {
  count = var.enable_fedora_cloud_base_30_x86_64_qcow2 ? 1:0
  name   = "fedora-cloud-base-30-x86_64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-30-1.2.x86_64.qcow2")}"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    "null_resource.download-extract-image-fedora-30-cloud-base-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

resource "openstack_images_image_v2" "fedora-30-cloud-base-x86_64-raw" {
  count = var.enable_fedora_cloud_base_30_x86_64_raw ? 1:0
  name   = "fedora-cloud-base-30-x86_64-raw"
  local_file_path = "${pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-30-1.2.x86_64.raw")}"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    "null_resource.download-extract-image-fedora-30-cloud-base-x86_64",
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

