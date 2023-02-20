project = "no-data-source"

app "no-data-source" {
  build {
    use "docker-pull" {
      image              = "nginx"
      tag                = "latest"
      disable_entrypoint = true
    }
    registry {
      use "docker" {
        local = true
        image = "jgwhite/no-data-source"
        tag   = "latest"
      }
    }
  }

  deploy {
    use "docker" {}
  }
}