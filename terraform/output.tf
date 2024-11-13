output "app_network_id" {
  value = docker_network.app_network.id
}
output "nginx_ip" {
  value = module.nginx.nginx_ip
}

output "app_ip" {
  value = module.app.app_ip
}