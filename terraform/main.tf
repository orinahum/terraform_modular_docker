module "app" {
  source             = "./modules/app"
  app_image_name     = var.app_image_name
  app_container_name = var.app_container_name
  app_int_port       = var.app_int_port
  app_ext_port       = var.app_ext_port
  network_id         = docker_network.app_network.id
}

module "nginx" {
  source               = "./modules/nginx"
  nginx_image_name     = var.nginx_image_name
  nginx_container_name = var.nginx_container_name
  nginx_int_port       = var.nginx_int_port
  nginx_ext_port       = var.nginx_ext_port
  network_id           = docker_network.app_network.id
}

resource "docker_network" "app_network" {
  name = "app_network"
}
