# Example Terraform to create a custom F5 BIG-IP CFE role in a project.

# Only supported on Terraform 1.3+
terraform {
  required_version = ">= 1.3"
}

# Create a custom CFE role for BIG-IP service account
module "cfe_role" {
  source    = "memes/f5-bigip-cfe-role/google"
  version   = "1.0.4"
  target_id = var.project_id
  members   = var.members
}
