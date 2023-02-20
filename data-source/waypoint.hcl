project = "data-source"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/jgwhite/waypoint-demos.git"
    ref  = "main"
    path = "data-source"
  }
}

app "data-source" {
  build {
    use "docker-pull" {
      image              = "nginx"
      tag                = "latest"
      disable_entrypoint = true
    }
    registry {
      use "docker" {
        image    = "jgwhite/data-source"
        tag      = "latest"
        username = var.docker["username"]
        password = var.docker["password"]
      }
    }
  }

  deploy {
    use "docker" {}
  }
}

variable "docker" {
  type = object({
    username = string
    password = string
  })
}
