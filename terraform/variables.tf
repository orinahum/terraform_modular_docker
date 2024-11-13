variable "app_container_name" {
  description = "Name of the container"
  default     = "hello_world_app"
}

variable "app_int_port" {
  description = "Internal port for app container"
  default     = 8000
}
variable "app_ext_port" {
  description = "external port for the app container"
  default     = 8000
}
variable "app_image_name" {
  description = "Name of the Image in use for app"
  default     = "alayani/hello_world_app:latest"
}

variable "nginx_container_name" {
  description = "Name of the container"
  default     = "nginx"
}

variable "nginx_int_port" {
  description = "Internal port for nginx container"
  default     = 443
}
variable "nginx_ext_port" {
  description = "external port for the nginx container"
  default     = 443
}
variable "nginx_image_name" {
  description = "Name of the Image in use for nginx"
  default     = "nginx:latest"
}

