variable "nginx_container_name" {}
variable "nginx_int_port" {}
variable "nginx_ext_port" {}
variable "nginx_image_name" {}
variable "network_id" {
  description = "The Docker network ID to connect to."
  type        = string
}