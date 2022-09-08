# F5 BIG-IP CFE Role Terraform module

This Terraform module is a helper to create a custom IAM role that has the
minimal permissions required for Cloud Failover Extension to function correctly.
The role will be created in the specified project by default, but can be created
as an *Organization role* if preferred, for reuse across projects.

Unless a specific identifier is provided in the `id` variable, a semi-random
identifier will be generated of the form `bigip_cfe_xxxxxxxxxx` to avoid unique
identifier collisions during the time after a custom role is deleted but before
it is purged from the project or organization.

> **NOTE:** This module is unsupported and not an official F5 product. If you
> require assistance please join our
> [Slack GCP channel](https://f5cloudsolutions.slack.com/messages/gcp) and ask!

## Examples

### Create the custom role at the project, and assign to an existing BIG-IP service account

See [Simple project role](examples/simple_project_role/) example for more details.

<!-- spell-checker: disable -->
```hcl
module "cfe_role" {
  source    = "memes/f5-bigip-cfe-role/google"
  version   = "1.0.0"
  target_id = "my-project-id"
  members   = ["serviceAccount:bigip@my-project-id.iam.gserviceaccount.com"]
}
```
<!-- spell-checker: enable -->

### Create the custom role for entire org, but do not explicitly assign membership

See [Simple org role](examples/simple_org_role/) example for more details.

<!-- spell-checker: disable -->
```hcl
module "cfe_org_role" {
  source      = "memes/f5-bigip-cfe-role/google"
  version     = "1.0.0"
  target_type = "org"
  target_id   = "my-org-id"
}
```
<!-- spell-checker: enable -->

### Create the custom role in the project with a fixed id, and assign to a BIG-IP service account

See [Fixed id](examples/fixed_id/) example for more details.

<!-- spell-checker: disable -->
```hcl
module "cfe_role" {
  source    = "memes/f5-bigip-cfe-role/google"
  version   = "1.0.0"
  id        = "my_custom_role"
  target_id = "my-project-id"
  title     = "An example CFE custom role for F5 BIG-IP instances"
  members   = ["serviceAccount:bigip@my-project-id.iam.gserviceaccount.com"]
}
```
<!-- spell-checker: enable -->

<!-- spell-checker:ignore markdownlint bigip -->
<!-- markdownlint-disable MD033 MD034 -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cfe_role"></a> [cfe\_role](#module\_cfe\_role) | terraform-google-modules/iam/google//modules/custom_role_iam | 7.4.1 |

## Resources

| Name | Type |
|------|------|
| [random_id.role_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | Sets the target for role creation; must be either an organization ID (target\_type = 'org'),<br>or project ID (target\_type = 'project'). | `string` | n/a | yes |
| <a name="input_id"></a> [id](#input\_id) | An identifier to use for the new role; default is an empty string which will<br>generate a unique identifier. If a value is provided, it must be unique at the<br>organization or project level depending on value of target\_type respectively.<br>E.g. multiple projects can all have a 'bigip\_cfe' role defined,<br>but an organization level role must be uniquely named. | `string` | `null` | no |
| <a name="input_members"></a> [members](#input\_members) | An optional list of accounts that will be assigned the custom role. Default is<br>an empty list. | `list(string)` | `[]` | no |
| <a name="input_random_id_prefix"></a> [random\_id\_prefix](#input\_random\_id\_prefix) | The prefix to use when generating random role identifier for the new role; default<br>is 'bigip\_cfe' which will generate a unique role identifier of the form<br>'bigip\_cfe\_XXXX', where XXXX is a random hex string. | `string` | `"bigip_cfe"` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Determines if the CFE role is to be created for the whole organization ('org')<br>or at a 'project' level. Default is 'project'. | `string` | `"project"` | no |
| <a name="input_title"></a> [title](#input\_title) | The human-readable title to assign to the custom CFE role. Default is 'Custom BIG-IP CFE role'. | `string` | `"Custom F5 BIG-IP CFE role"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_qualified_role_id"></a> [qualified\_role\_id](#output\_qualified\_role\_id) | The qualified role-id for the custom CFE role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
