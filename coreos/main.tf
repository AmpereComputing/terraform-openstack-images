## Coreos
# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-coreos-stable" {
  provisioner "local-exec" {
    command = "coreos_image.sh stable"
  }
}
resource "openstack_images_image_v2" "coreos_2093_00_stable" {
  name   = "coreos-stable-2093_0_0"
  local_file_path = "$HOME/.terraform/image_cache/coreos_production_openstack_image.img"
  container_format = "bare"
  disk_format = "raw"

  properties = {
    os_distro = "coreos"
  }
}
#
#resource "null_resource" "download-extract-image" {
#  provisioner "local-exec" {
#    command = "coreos_image.sh alpha"
#  }
#}
#resource "openstack_images_image_v2" "coreos-latest-alpah" {
#  name   = "CoreOS-Latest-Alpha"
#  local_file_path = $HOME/.terraform/image_cache/coreos_production_openstack_image.img
#  container_format = "bare"
#  disk_format = "raw"
#  visibility = "public"
#
#  properties = {
#    os_distro = "coreos"
#    key = "value"
#  }
#}
#
#resource "null_resource" "download-extract-image" {
#  provisioner "local-exec" {
#    command = "coreos_image.sh beta"
#  }
#}
#resource "openstack_images_image_v2" "coreos-latest-beta" {
#  name   = "CoreOS-Latest-beta"
#  local_file_path = $HOME/.terraform/image_cache/coreos_production_openstack_image.img
#  container_format = "bare"
#  disk_format = "raw"
#  visibility = "public"
#
#  properties = {
#    key = "value"
#    os_distro = "coreos"
#  }
#}
