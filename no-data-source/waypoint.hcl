project = "no-data-source"

app "no-data-source" {
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
