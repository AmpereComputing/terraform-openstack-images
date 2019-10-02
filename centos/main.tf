# CentOS
resource "null_resource" "download-extract-image-centos-7_1901" {
  count = var.enable_centos ? 1:0
  provisioner "local-exec" {
    command = "sh centos_image.sh 7"
  }
}
resource "openstack_images_image_v2" "centos7_1901" {
  count = var.enable_centos ? 1:0
  name   = "centos-7.1901-x86_64-GenericCloud"
  local_file_path = "${pathexpand("~/.terraform/image_cache/CentOS-7-x86_64-GenericCloud-1901.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-centos-7_1901",
  ]

  properties = {
    os_distro = "centos"
  }
}

resource "null_resource" "download-extract-image-centos-6_1901" {
  count = var.enable_centos ? 1:0
  provisioner "local-exec" {
    command = "./centos_image.sh 6"
  }
  depends_on = [
    "openstack_images_image_v2.centos7_1901",
  ]
}
resource "openstack_images_image_v2" "centos6_1901" {
  count = var.enable_centos ? 1:0
  name   = "centos-6.1901-x86_64-GenericCloud"
  local_file_path = "${pathexpand("~/.terraform/image_cache/CentOS-6-x86_64-GenericCloud-1901.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-centos-6_1901",
  ]

  properties = {
    os_distro = "centos"
  }
}

