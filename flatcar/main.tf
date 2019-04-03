## FlatCar Linux
#

# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-flatcar-stable" {
  provisioner "local-exec" {
    command = "./flatcar_image.sh stable"
  }
}
resource "openstack_images_image_v2" "flatcar-2023_50-stable" {
  name   = "flatcarlinux-2023.50-stable"
  local_file_path = "${var.terraform_image_cache_path}/flatcar_production_openstack_image.img"
  local_file_path = "${pathexpand("~/.terraform/image_cache/flatcar_production_openstack_image.img")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-flatcar-stable",
  ]
  
  properties = {
    os_distro = "coreos"
  }
}
#resource "null_resource" "download-extract-image-flatcar-beta" {
#  provisioner "local-exec" {
#    command = "flatcar_image.sh beta"
#  }
#}
#resource "openstack_images_image_v2" "flatcar-2079.10-beta" {
#  name   = "flatcarlinux-2079.10-beta"
#  image_source_url = "https://beta.release.flatcar-linux.net/amd64-usr/2079.1.0/flatcar_production_openstack_image.img.bz2"
#  container_format = "bare"
#  disk_format = "raw"
#
#  properties = {
#    os_distro = "coreos"
#  }
#}
#
#resource "null_resource" "download-extract-image-flatcar-alpha" {
#  provisioner "local-exec" {
#    command = "flatcar_image.sh alpha"
#  }
#}
#resource "openstack_images_image_v2" "flatcar-209300-alpha" {
#  name   = "flatcarlinux-2093.00-Alpha"
#  image_source_url = "https://alpha.release.flatcar-linux.net/amd64-usr/2093.0.0/flatcar_production_openstack_image.img.bz2"
#  container_format = "bare"
#  disk_format = "raw"
#  properties = {
#    os_distro = "coreos"
#  }
#}
