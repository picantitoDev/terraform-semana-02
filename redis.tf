resource "docker_image" "redis" {
  name = "redis:7.4.1-alpine"
}

resource "docker_container" "redis" {
  name = "redis-server"
  image = docker_image.redis.image_id

  ports {
    internal = 6379
    external = 6379
  }

  restart = "always"
}