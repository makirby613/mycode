output "keep_locally_output" {
    description = "Did we keep the image?"
    value       = docker_image.nginx.keep_locally
}

# produces an output value named "container_id"
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}
# produces an output value named "image_id"
output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}

# produces an output value named "external_port"
output "external_port" {
  description = "External Port"
  value       = docker_container.nginx.ports[0].external
}

# produces an output value named "internal_port"
output "internal_port" {
  description = "Internal Port"
  value       = docker_container.nginx.ports[0].internal
}
# produces an output value named "IP"
output "IP" {
  description = "IP"
  value       = docker_container.nginx.ip_address
}
