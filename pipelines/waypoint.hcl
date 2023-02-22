project = "pipelines"

pipeline "test" {
  step "hello" {
    image_url = "busybox"
    use "exec" {
      command = "echo"
      args = ["hello"]
    }
  }
}

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/jgwhite/waypoint-demos.git"
    ref  = "main"
    path = "pipelines"
  }
}

app "data-source" {
  build {
    use "docker" {}
  }

  deploy {
    use "docker" {}
  }
}
