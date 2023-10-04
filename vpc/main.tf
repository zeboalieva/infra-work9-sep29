terraform {
  cloud {
    organization = "tf-class-september-20"

    workspaces {
      name = "infra-vpc"
    }
  }
}