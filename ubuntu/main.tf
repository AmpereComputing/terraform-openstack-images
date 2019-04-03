
resource "openstack_images_image_v2" "ubuntu-1804" {
  name   = "Ubuntu-18.04"
  image_source_url = "https://cloud-images.ubuntu.com/daily/server/bionic/current/bionic-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"

  properties = {
    os_distro = "ubuntu"
  }
}

resource "openstack_images_image_v2" "ubuntu-1604" {
  name   = "Ubuntu-16.04"
  image_source_url = "https://cloud-images.ubuntu.com/daily/server/xenial/current/xenial-server-cloudimg-amd64-disk1.img"
  container_format = "bare"
  disk_format = "raw"

  properties = {
    os_distro = "ubuntu"
  }
}
