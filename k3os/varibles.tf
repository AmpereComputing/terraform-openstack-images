
variable "k3os_version" {
  description = "The version of K3os"
  type = string
  default = "0.3.0"
}
variable "enable_k3os_arm64_qcow2" {
  description = "Enable K3OS ARM64 QCOW2 Images"
  default     = 0
}
variable "enable_k3os_arm64_raw" {
  description = "Enable K3OS ARM64 RAW Images"
  default     = 0
}
variable "enable_k3os_amd64_qcow2" {
  description = "Enable K3OS AMD64 QCOW2 Images"
  default     = 0
}
variable "enable_k3os_amd64_raw" {
  description = "Enable K3OS AMD64 RAW Images"
  default     = 0
}
