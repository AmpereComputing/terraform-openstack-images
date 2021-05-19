# CentOS

# CentOS AARCH64

resource "null_resource" "download-extract-image-centos-stream-8-aarch64" {
  count = var.enable_centos_stream_8_aarch64_raw ? 1:0
  provisioner "local-exec" {
    command = "${path.module}/centos_stream__aarch64_image.sh 8"
  }
}

resource "openstack_images_image_v2" "centos_stream_8_aarch64_raw" {
  count = var.enable_centos_stream_8_aarch64_raw ? 1:0
  name   = "CentOS-Stream-GenericCloud-8-20210210.0.aarch64.qcow2"
  local_file_path = pathexpand("~/.terraform/image_cache/CentOS-Stream-GenericCloud-8-20210210.0.aarch64.raw")
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  depends_on = [
    null_resource.download-extract-image-centos-stream-8-aarch64,
  ]

  properties = {
    os_distro = "centos"
  }
}

resource "openstack_images_image_v2" "centos_stream_8_aarch64_qcow2" {
  count = var.enable_centos_stream_8_aarch64_qcow2 ? 1:0
  name   = "CentOS-Stream-GenericCloud-8-20210210.0.aarch64.qcow2"
  image_source_url = "https://cloud.centos.org/centos/8-stream/aarch64/images/CentOS-Stream-GenericCloud-8-20210210.0.aarch64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    os_distro = "centos"
  }
}
