output "qualified_role_id" {
  value       = module.cfe_role.qualified_role_id
  description = <<-EOD
  The qualified role-id for the custom CFE role.
  EOD
}
