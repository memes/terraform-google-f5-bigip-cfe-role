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
  source           = "./../../../"
  target_type      = var.target_type
  target_id        = var.target_id
  id               = var.id
  title            = var.title
  members          = var.members
  random_id_prefix = var.random_id_prefix
}
