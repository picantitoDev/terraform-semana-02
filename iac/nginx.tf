resource "docker_image" "nginx" {
  name         = "nginx:stable-alpine3.21-perl"
  keep_locally = false
}

resource "docker_container" "nginx_1" {  
  name  = "app-1"
  image = docker_image.nginx.image_id
  
  networks_advanced {
    name = docker_network.app_net.name
  }
  
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

resource "docker_container" "nginx_2" {  
  name  = "app-2"
  image = docker_image.nginx.image_id
  
  networks_advanced {
    name = docker_network.app_net.name
  }
  
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

resource "docker_container" "nginx_3" {  
  name  = "app-3"
  image = docker_image.nginx.image_id
  
  networks_advanced {
    name = docker_network.app_net.name
  }
  
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
