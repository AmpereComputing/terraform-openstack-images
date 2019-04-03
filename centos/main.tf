# CentOS
resource "openstack_images_image_v2" "centos7_1901" {
  name   = "centos-7.1901"
  image_source_url = "http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1901.raw"
  container_format = "bare"
  disk_format = "raw"

  properties = {
    os_distro = "centos"
  }
}

resource "openstack_images_image_v2" "centos6_1901" {
  name   = "centos-6.1901"
  image_source_url = "http://cloud.centos.org/centos/6/images/CentOS-6-x86_64-GenericCloud-1901.raw"
  container_format = "bare"
  disk_format = "raw"

  properties = {
    os_distro = "centos"
  }
}

