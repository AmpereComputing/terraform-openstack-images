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
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-AtomicHost-29.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-atomic,
  ]

  properties = {
    key = "value"
    os_distro = "fedora-atomic"
  }
}

resource "openstack_images_image_v2" "fedora_atomic_29_x86_64_qcow2" {
  count = var.enable_fedora_atomic_29_x86_64_qcow2 ? 1:0
  name   = "fedora-atomichost-29-x86_64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-AtomicHost-29.qcow2")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-atomic,
  ]

  properties = {
    key = "value"
    os_distro = "fedora-atomic"
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
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-29-1.2.x86_64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-29-cloud-base-x86_64,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

resource "openstack_images_image_v2" "fedora-29-cloud-base-x86_64-raw" {
  count = var.enable_fedora_cloud_base_29_x86_64_raw ? 1:0
  name   = "fedora-cloud-base-29-x86_64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-29-1.2.x86_64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-29-cloud-base-x86_64,
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
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-30-1.2.x86_64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-30-cloud-base-x86_64,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

resource "openstack_images_image_v2" "fedora-30-cloud-base-x86_64-raw" {
  count = var.enable_fedora_cloud_base_30_x86_64_raw ? 1:0
  name   = "fedora-cloud-base-30-x86_64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-30-1.2.x86_64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-30-cloud-base-x86_64,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

resource "null_resource" "download-extract-image-fedora-31-cloud-base-x86_64" {
  count = var.enable_fedora_cloud_base_31_x86_64_qcow2 || var.enable_fedora_cloud_base_31_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/fedora_image.sh 31"
  }
}
resource "openstack_images_image_v2" "fedora-31-cloud-base-x86_64-qcow2" {
  count = var.enable_fedora_cloud_base_31_x86_64_qcow2 ? 1:0
  name   = "fedora-cloud-base-31-x86_64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-31-1.9.x86_64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-31-cloud-base-x86_64,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}
resource "openstack_images_image_v2" "fedora-31-cloud-base-x86_64-raw" {
  count = var.enable_fedora_cloud_base_31_x86_64_raw ? 1:0
  name   = "fedora-cloud-base-31-x86_64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-31-1.9.x86_64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-31-cloud-base-x86_64,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}

resource "null_resource" "download-extract-image-fedora-32-cloud-base-x86_64" {
  count = var.enable_fedora_cloud_base_32_x86_64_qcow2 || var.enable_fedora_cloud_base_32_x86_64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/fedora_image.sh 32"
  }
}
resource "openstack_images_image_v2" "fedora-32-cloud-base-x86_64-qcow2" {
  count = var.enable_fedora_cloud_base_32_x86_64_qcow2 ? 1:0
  name   = "fedora-cloud-base-32-x86_64-qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-32-1.6.x86_64.qcow2")
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-32-cloud-base-x86_64,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}
resource "openstack_images_image_v2" "fedora-32-cloud-base-x86_64-raw" {
  count = var.enable_fedora_cloud_base_32_x86_64_raw ? 1:0
  name   = "fedora-cloud-base-32-x86_64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Cloud-Base-32-1.6.x86_64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-fedora-32-cloud-base-x86_64,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}
# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-fedora-server" {
  count = var.enable_fedora_server_29_aarch64_raw || var.enable_fedora_server_30_aarch64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/fedora_aarch64_server_image.sh"
  }
}


resource "openstack_images_image_v2" "fedora_server_29_aarch64_raw" {
  count = var.enable_fedora_server_29_aarch64_raw ? 1:0
  name   = "fedora-server-29-aarch64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Server-29-1.2.aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-fedora-server,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
  }
}
resource "openstack_images_image_v2" "fedora_server_29_aarch64_qcow2" {
  count = var.enable_fedora_server_29_aarch64_qcow2 ? 1:0
  name   = "fedora-server-29-aarch64-qcow2"
  image_source_url = "https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/29/Cloud/aarch64/images/Fedora-Cloud-Base-29-1.2.aarch64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    key = "value"
    os_distro = "fedora"
  }
}

resource "openstack_images_image_v2" "fedora_server_30_aarch64_raw" {
  count = var.enable_fedora_server_30_aarch64_raw ? 1:0
  name   = "fedora-server-30-aarch64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Server-30-1.2.aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-fedora-server,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
  }
}

resource "openstack_images_image_v2" "fedora_server_30_aarch64_qcow2" {
  count = var.enable_fedora_server_30_aarch64_qcow2 ? 1:0
  name   = "fedora-server-30-aarch64-qcow2"
  image_source_url = "https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/30/Cloud/aarch64/images/Fedora-Cloud-Base-30-1.2.aarch64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    key = "value"
    os_distro = "fedora"
  }
}

resource "openstack_images_image_v2" "fedora_server_31_aarch64_raw" {
  count = var.enable_fedora_server_31_aarch64_raw ? 1:0
  name   = "fedora-server-31-aarch64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Server-31-1.9.aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-fedora-server,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
  }
}

resource "openstack_images_image_v2" "fedora_server_31_aarch64_qcow2" {
  count = var.enable_fedora_server_31_aarch64_qcow2 ? 1:0
  name   = "fedora-server-31-aarch64-qcow2"
  image_source_url = "https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/31/Cloud/aarch64/images/Fedora-Cloud-Base-31-1.9.aarch64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    key = "value"
    os_distro = "fedora"
  }
}
resource "openstack_images_image_v2" "fedora_server_32_aarch64_raw" {
  count = var.enable_fedora_server_32_aarch64_raw ? 1:0
  name   = "fedora-server-32-aarch64-raw"
  local_file_path = pathexpand("~/.terraform/image_cache/Fedora-Server-32-1.6.aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    null_resource.download-extract-image-fedora-server,
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
  }
}

resource "openstack_images_image_v2" "fedora_server_32_aarch64_qcow2" {
  count = var.enable_fedora_server_32_aarch64_qcow2 ? 1:0
  name   = "fedora-server-32-aarch64-qcow2"
  image_source_url = "https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/aarch64/images/Fedora-Cloud-Base-32-1.6.aarch64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    key = "value"
    os_distro = "fedora"
  }
}
resource "openstack_images_image_v2" "fedora_atomic_29_aarch64_qcow2" {
  count = var.enable_fedora_atomic_29_aarch64_qcow2 ? 1:0
  name   = "fedora-atomic-29-aarch64-qcow2"
  image_source_url = "https://dl.fedoraproject.org/pub/alt/atomic/stable/Fedora-29-updates-20191001.0/AtomicHost/aarch64/images/Fedora-AtomicHost-29-20191001.0.aarch64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  properties = {
    key = "value"
    os_distro = "fedora-atomic"
  }
}


