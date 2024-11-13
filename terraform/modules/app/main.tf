resource "docker_container" "app" {
  name  = var.app_container_name
  image = var.app_image_name
  networks_advanced {
    name = var.network_id
  }
}

