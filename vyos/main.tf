## VYOS
resource "openstack_images_image_v2" "vyos_rolling_latest_amd64" {
  count = var.enable_vyos_rolling_latest_amd64_raw ? 1:0
  name   = "vyos-rolling-latest-amd64"
  image_source_url = "https://downloads.vyos.io/rolling/current/amd64/vyos-rolling-latest.iso"
  container_format = "bare"
  disk_format = "raw"
  visibility = "public"
  properties = {
    os_distro = "vyos"
  }
}
