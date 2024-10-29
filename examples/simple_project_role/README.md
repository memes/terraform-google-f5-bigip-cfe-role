# Simple project-level CFE custom role creation

This example demonstrates how to use the module to create a CFE custom IAM role
in a project with minimal inputs, and assign it to the list of IAM accounts provided.

## Example tfvars file

* Deploy to project: `my-project-id`
* Add the role to the existing service account: 'bigip@my-project-id.iam.gserviceaccount.com'

<!-- spell-checker: disable -->
```hcl
project_id = "my-project-id"
members    = [
  "serviceAccount:bigip@my-project-id.iam.gserviceaccount.com",
]
```
<!-- spell-checker: enable -->

### Prerequisites

* Google Cloud project
* Service account(s) to which the role will be assigned
* IAM role creation and assignment permissions in the project

### Resources created

* Custom CFE IAM role created in the project, assigned to service account(s)

<!-- markdownlint-disable MD033 MD034-->
<!-- BEGIN_TF_DOCS -->
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
| <a name="input_members"></a> [members](#input\_members) | A list of accounts that will be assigned the custom role. | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The identifier of the Google Cloud project that will contain the custom role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_qualified_role_id"></a> [qualified\_role\_id](#output\_qualified\_role\_id) | The qualified role-id for the custom CFE role. |
<!-- END_TF_DOCS -->
<!-- markdownlint-enable MD033 MD034 -->
