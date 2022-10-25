/* main.tf
   Alta3 Research - rzfeeser@alta3.com */
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}


# interact with docker
provider "docker" {}

# create random_ resources
provider "random" {}

# interact with time data
provider "time" {}

resource "docker_image" "nginx" {
  name         = "nginx:1.23.2"
  keep_locally = true
}

# available from random.random_pet
resource "random_pet" "nginx" {
  length = 2
}

resource "docker_container" "nginx" {
  count = 4
  image = docker_image.nginx.image_id
  name  = "nginx-${random_pet.nginx.id}-${count.index}"
  # name = "nginx-hoppy-frog-0"

  ports {
    internal = var.internal_port 
    # 8000, 8001, 8002, 8003
    external = var.external_port + count.index
  }
}

