terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 5.0"
    }
  }
}

module "test" {
  source = "./../../../ephemeral/simple_org_role/"
  org_id = var.org_id
}
