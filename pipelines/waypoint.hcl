project = "pipelines"

pipeline "one-step" {
  step "hi" {
    image_url = "busybox"
    use "exec" {
      command = "echo"
      args = ["hi"]
    }
  }
}

pipeline "two-step" {
  step "hi" {
    image_url = "busybox"
    use "exec" {
      command = "echo"
      args = ["hi"]
    }
  }
  step "bye" {
    image_url = "busybox"
    use "exec" {
      command = "echo"
      args = ["bye"]
    }
  }
}

pipeline "three-step-nested" {
  step "prep" {
    image_url = "busybox"
    use "exec" {
      command = "echo"
      args = ["preparing..."]
    }
  }
  step "two-step" {
    use "pipeline" {
      name = "two-step"
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

app "web" {
  build {
    use "docker" {}
  }

  deploy {
    use "docker" {}
  }
}
