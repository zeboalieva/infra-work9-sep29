terraform {
  required_providers {
    tfe = {
      version = "~> 0.49.1"
    }
  }
  cloud {
    organization = "tf-class-september-20"

    workspaces {
      name = "infra-workspaces"
    }
  }
}

provider "tfe" {
  version = "~> 0.49.1"

}
data "tfe_organization" "summer-cloud" {
  name         = "tf-class-september-20"
}
locals {
  exec_type = "local"
  infra-components = [
    "vpc", 
    "subnet",
    "ec2", 
  ]

}
resource "tfe_workspace" "test" {
    for_each = toset(local.infra-components)
  name           = each.key
  organization   = data.tfe_organization.summer-cloud.name
  execution_mode = local.exec_type
}