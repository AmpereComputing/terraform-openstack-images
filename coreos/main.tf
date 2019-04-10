## Coreos
# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-coreos-stable" {
  provisioner "local-exec" {
    command = "sh coreos_image.sh stable"
  }
}
resource "openstack_images_image_v2" "coreos_2093_00_stable" {
  name   = "coreos-stable-2093_0_0"
  local_file_path = "${pathexpand("~/.terraform/image_cache/coreos_production_openstack_image.img")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-coreos-stable",
  ]

  properties = {
    os_distro = "coreos"
  }
}
#
#resource "null_resource" "download-extract-image-coreos-alpha" {
#  provisioner "local-exec" {
#    command = "./coreos_image.sh alpha"
#  }
#}
#resource "openstack_images_image_v2" "coreos-latest-alpha" {
#  name   = "CoreOS-Latest-Alpha"
#  local_file_path = "${pathexpand("~/.terraform/image_cache/coreos_production_openstack_image.img")}"
#  container_format = "bare"
#  disk_format = "raw"
#  depends_on = [
#    "null_resource.download-extract-image-coreos-alpha",
#  ]
#
#  properties = {
#    os_distro = "coreos"
#    key = "value"
#  }
#}
#
#resource "openstack_images_image_v2" "coreos-latest-beta" {
#  provisioner "local-exec" {
#    command = "./coreos_image.sh beta"
#  }
#}
#resource "openstack_images_image_v2" "coreos-latest-beta" {
#  name   = "CoreOS-Latest-beta"
#  local_file_path = "${pathexpand("~/.terraform/image_cache/coreos_production_openstack_image.img")}"
#  container_format = "bare"
#  disk_format = "raw"
#  ]
#
#  properties = {
#    key = "value"
#    os_distro = "coreos"
#  }
#}
