project = "data-source"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/jgwhite/waypoint-demos.git"
    path = "data-source"
  }
}

app "data-source" {
  build {
    use "docker-pull" {
      image = "nginx"
      tag   = "latest"
    }
  }

  deploy {
    use "docker" {}
  }
}