resource "docker_container" "nginx" {
  name  = var.nginx_container_name
  image = var.nginx_image_name
  networks_advanced {
    name = var.network_id
  }
  ports {
    internal = var.nginx_int_port
    external = var.nginx_ext_port
  }
}
