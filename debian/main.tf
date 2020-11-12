# Debian OpenStack Images
resource "openstack_images_image_v2" "debian_9_openStack_amd64_qcow2" {
  count = var.enable_debian_9_amd64_qcow2 ? 1:0
  name = "debian-9-openstack-amd64-qcow2"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-9/debian-9-openstack-amd64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
resource "openstack_images_image_v2" "debian_9_openStack_amd64_raw" {
  count = var.enable_debian_9_amd64_raw ? 1:0
  name = "debian-9-openstack-amd64"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-9/debian-9-openstack-amd64.raw"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
resource "openstack_images_image_v2" "debian_10_openStack_amd64_qcow2" {
  count = var.enable_debian_10_amd64_qcow2 ? 1:0
  name = "debian-10-openstack-amd64-qcow2"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-10/debian-10-openstack-amd64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
resource "openstack_images_image_v2" "debian_10_openStack_amd64_raw" {
  count = var.enable_debian_10_amd64_raw ? 1:0
  name = "debian-10-openstack-amd64"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-10/debian-10-openstack-amd64.raw"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}

# Debian OpenStack Images
resource "openstack_images_image_v2" "debian_9_arm64_raw" {
  count = var.enable_debian_9_arm64_raw ? 1:0
  name   = "debian-9-openstack-arm64-raw"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-9/debian-9-openstack-arm64.raw"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
resource "openstack_images_image_v2" "debian_10_arm64_raw" {
  count = var.enable_debian_10_arm64_raw ? 1:0
  name   = "debian-10-openstack-arm64-raw"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-10/debian-10-openstack-arm64.raw"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
resource "openstack_images_image_v2" "debian_9_arm64_qcow2" {
  count = var.enable_debian_9_arm64_qcow2 ? 1:0
  name   = "debian-9-openstack-arm64-qcow2"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-9/debian-9-openstack-arm64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
resource "openstack_images_image_v2" "debian_10_arm64_qcow2" {
  count = var.enable_debian_10_arm64_qcow2 ? 1:0
  name   = "debian-10-openstack-arm64-qcow2"
  image_source_url = "https://cdimage.debian.org/cdimage/openstack/current-10/debian-10-openstack-arm64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
resource "openstack_images_image_v2" "debian_11_arm64_qcow2" {
  count = var.enable_debian_11_arm64_qcow2 ? 1:0
  name   = "debian-11-generic-arm64-daily-20201112-452.qcow2"
  image_source_url = "https://cloud.debian.org/images/cloud/bullseye/daily/20201112-452/debian-11-generic-arm64-daily-20201112-452.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    key = "value"
    os_distro = "debian"
  }
}
