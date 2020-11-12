resource "openstack_images_image_v2" "oraclelinux_r8u2_arm64" {
  count = var.enable_oraclelinux_r8u2_arm64_iso ? 1:0
  name   = "OracleLinux-R8-U2-aarch64-dvd.iso"
  image_source_url = "http://mirrors.kernel.org/oracle/OL8/u2/aarch64/OracleLinux-R8-U2-aarch64-dvd.iso"
  container_format = "bare"
  disk_format = "raw"
  properties = {
    os_distro = "oraclelinux"
#   kernel_args = "oraclelinux.mode=live oraclelinux.debug=true oraclelinux.datasources=openstack"
  }
}
