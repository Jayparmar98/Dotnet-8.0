# Specify the required version of Terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"  # For Linux/Mac
}

# Pull the Nginx Docker image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
  keep_locally = false
}

# Create a container using the Nginx image
resource "docker_container" "nginx_container" {
  name  = "nginx_server"
  image = docker_image.nginx_image
  ports {
    internal = 80
    external = 8080  # Expose Nginx on host machine's port 8080
  }
}

# Output the container details
output "container_id" {
  value = docker_container.nginx_container.id
}
