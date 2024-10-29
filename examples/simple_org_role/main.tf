# Example Terraform to create a custom F5 BIG-IP CFE role at the organization level.

# Only supported on Terraform 1.3+
terraform {
  required_version = ">= 1.3"
}

# Create a custom F5 BIG-IP CFE role for an organization
module "cfe_role" {
  source      = "memes/f5-bigip-cfe-role/google"
  version     = "1.0.4"
  target_type = "org"
  target_id   = var.org_id
}
