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
      image = "nginx"
      tag   = "latest"
    }
    registry {
      use "docker" {
        local = true
      }
    }
  }

  deploy {
    use "docker" {}
  }
}