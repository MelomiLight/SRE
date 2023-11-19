terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "python-prometheus-grafana-main-app" {
  name         = "python-prometheus-grafana-main-app:latest"
  keep_locally = false
}

resource "docker_container" "python-prometheus-grafana-main-app" {
  image = docker_image.python-prometheus-grafana-main-app.image_id
  name  = "python-prometheus-grafana-main-app"
  ports {
    internal = 2000
    external = 2000
  }
}