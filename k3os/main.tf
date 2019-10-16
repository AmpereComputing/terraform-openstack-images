## K3OS
resource "null_resource" "download-extract-image-k3os-arm64" {
  count = var.enable_k3os_arm64_qcow2 ? 1:0

  provisioner "local-exec" {
    command = "${path.module}/k3os_image.sh ${ var.k3os_version } arm64"
  }
}
resource "openstack_images_image_v2" "k3os_arm64_qcow2" {
  count = var.enable_k3os_arm64_qcow2 ? 1:0
  name   = "k3os-${ var.k3os_version }-arm64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/k3os-${ var.k3os_version }-arm64.qcow2")}"
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    "null_resource.download-extract-image-k3os-arm64",
  ]

  properties = {
    key = "value"
    os_distro = "k3os"
    kernel_args = "k3os.mode=live k3os.debug=true k3os.datasources=openstack"
  }
}

resource "openstack_images_image_v2" "k3os_arm64" {
  count = var.enable_k3os_arm64_raw ? 1:0
  name   = "k30s-${ var.k3os_version }-arm64.iso"
  image_source_url = "https://github.com/rancher/k3os/releases/download/v${ var.k3os_version }/k3os-arm64.iso"
  container_format = "bare"
  disk_format = "raw"
  properties = {
    os_distro = "k3os"
    kernel_args = "k3os.mode=live k3os.debug=true k3os.datasources=openstack"
  }
}
resource "null_resource" "download-extract-image-k3os-amd64" {
  count = var.enable_k3os_amd64_qcow2 ? 1:0

  provisioner "local-exec" {
    command = "${path.module}/k3os_image.sh ${ var.k3os_version } amd64"
  }
}
resource "openstack_images_image_v2" "k3os_amd64_qcow2" {
  count = var.enable_k3os_amd64_qcow2 ? 1:0
  name   = "k3os-${ var.k3os_version }-amd64-qcow2"
  local_file_path = "${pathexpand("~/.terraform/image_cache/k3os-${ var.k3os_version }-amd64.qcow")}"
  container_format = "bare"
  disk_format = "qcow2"
  depends_on = [
    "null_resource.download-extract-image-k3os-amd64",
  ]

  properties = {
    key = "value"
    os_distro = "k3os"
    kernel_args = "k3os.mode=live k3os.debug=true k3os.datasources=openstack"
  }
}

resource "openstack_images_image_v2" "k3os_amd64" {
  count = var.enable_k3os_amd64_raw ? 1:0
  name   = "k30s-${ var.k3os_version }-amd64.iso"
  image_source_url = "https://github.com/rancher/k3os/releases/download/v${ var.k3os_version }/k3os-amd64.iso"
  container_format = "bare"
  disk_format = "raw"
  properties = {
    os_distro = "k3os"
    kernel_args = "k3os.mode=live k3os.debug=true k3os.datasources=openstack"
  }
}
