# Run script to download and extract image file befor uploading to glance
resource "null_resource" "download-extract-image-fedora-atomic" {
  provisioner "local-exec" {
    command = "sh fedora_atomic_image.sh"
  }
}


resource "openstack_images_image_v2" "fedora_atomic_29" {
  name   = "fedora-atomic-29"
  local_file_path = "${pathexpand("~/.terraform/image_cache/Fedora-AtomicHost-29.raw")}"
  container_format = "bare"
  disk_format = "raw"
  depends_on = [
    "null_resource.download-extract-image-fedora-atomic",
  ]

  properties = {
    key = "value"
    os_distro = "fedora"
  }
}
resource "openstack_images_image_v2" "fedora-29" {
  name   = "fedora-cloud-base-29"
  image_source_url = "https://download.fedoraproject.org/pub/fedora/linux/releases/29/Cloud/x86_64/images/Fedora-Cloud-Base-29-1.2.x86_64.raw"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"

  properties = {
    key = "value"
    os_distro = "fedora"
 }
}
