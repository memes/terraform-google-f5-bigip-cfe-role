# Example Terraform to create a custom F5 BIG-IP CFE role in a project with a
# specified identifier.

# Only supported on Terraform 1.0+
terraform {
  required_version = ">= 1.0"
}

# Create a custom CFE role with a fixed identifier
module "cfe_role" {
  source    = "memes/f5-bigip-cfe-role/google"
  version   = "1.0.1"
  target_id = var.project_id
  id        = var.id
  title     = var.title
  members   = var.members
}
