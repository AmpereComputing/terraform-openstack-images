# OpenSuSE LEAP

resource "openstack_images_image_v2" "opensuse-leap-150" {
  name   = "OpenSuSE-Leap-15.0"
  image_source_url = "http://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.0/images/openSUSE-Leap-15.0-OpenStack.x86_64-0.0.4-Buildlp150.12.137.raw"
  container_format = "bare"
  disk_format = "raw"

  properties = {
    key = "value"
    os_distro = "opensuse"
  }
}
