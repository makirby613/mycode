terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "simpleflaskservice" {
  name         = var.image_name 
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "simpleflaskservice" {
  image = docker_image.simpleflaskservice.image_id
  name  = var.container_name 
  ports {
    internal = var.internal_port 
    external = var.external_port 
  }
}

