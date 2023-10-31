terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 6.0"
    }
  }
}

resource "random_pet" "prefix" {
  length = 1
  prefix = "kitchen"
  keepers = {
    project = var.project_id
  }
}

resource "google_service_account" "sa" {
  project      = var.project_id
  account_id   = format("%s-test", random_pet.prefix.id)
  display_name = "terraform-google-f5-bigip-cfe-role test service account"
  description  = "Automated test service account"
}
