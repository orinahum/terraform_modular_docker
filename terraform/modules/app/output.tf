output "app_ip" {
  value = docker_container.app.network_data[0].ip_address
}