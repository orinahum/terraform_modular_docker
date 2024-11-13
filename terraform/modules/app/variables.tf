variable "app_container_name" {}
variable "app_int_port" {}
variable "app_ext_port" {}
variable "app_image_name" {}
variable "network_id" {
  description = "The Docker network ID to connect to."
  type        = string
}