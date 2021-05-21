# OpenAnolis/AnolisOS
resource "openstack_images_image_v2" "anolisos_82_GA_aarch64_ANCK_qcow2" {
  count = var.enable_anolisos_82_aarch64_qcow2 ? 1:0
  name             = "AnolisOS-8.2-GA-aarch64-ANCK.qcow2"
  image_source_url = "http://mirrors.openanolis.org/anolis/8/isos/GA/aarch64/AnolisOS-8.2-GA-aarch64-ANCK.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  properties = {
    os_distro = "anolis"
  }
}
