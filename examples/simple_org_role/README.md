# Simple organization-level CFE custom role creation

This example demonstrates how to use the module to create a CFE custom IAM role
in an organization with minimal inputs. After role creation it will be available
to assign to resources owned by the organization.

## Example tfvars file

* Deploy to organization: `123456`

<!-- spell-checker: disable -->
```hcl
org_id = "123456"
```
<!-- spell-checker: enable -->

### Prerequisites

* Google Cloud account
* IAM role creation permissions for the organization

### Resources created

* Custom CFE IAM role created in the project, assigned to service account(s)

<!-- markdownlint-disable MD033 MD034-->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cfe_role"></a> [cfe\_role](#module\_cfe\_role) | memes/f5-bigip-cfe-role/google | 1.0.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The identifier of the Google Cloud organization that will contain the custom role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_qualified_role_id"></a> [qualified\_role\_id](#output\_qualified\_role\_id) | The qualified role-id for the custom CFE role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
