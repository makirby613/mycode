terraform {
  cloud {
    organization = "MattKirby"

    workspaces {
      name = "my-example"
    }
  }
}
