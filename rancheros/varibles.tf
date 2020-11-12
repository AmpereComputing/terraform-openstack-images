variable "enable_rancheros_openstack_amd64_raw" {
  description = "Enable RancherOS AMD64 Raw Image"
  default     = 0
}

variable "enable_rancheros_openstack_amd64_qcow2" {
  description = "Enable RancherOS AMD64 QCOW2 Image"
  default     = 0
}
variable "ros_version" {
  type        = string
  description = "RancherOS Version"
  default     = "1.5.6"
}


