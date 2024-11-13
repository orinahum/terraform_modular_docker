output "nginx_ip" {
  value = docker_container.nginx.network_data[0].ip_address
}

