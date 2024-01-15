# Azure Aware Seatch SQL fog

[![Build Status](https://dev.azure.com/weareretail/Tooling/_apis/build/status/mod_azu_databricks?repoName=mod_azu_search_sql_fog&branchName=master)](https://dev.azure.com/weareretail/Tooling/_build/latest?definitionId=11&repoName=mod_azu_search_sql_fog&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)

Common Azure Terraform module to normalize Azure Databricks config setup.

# Usage

```hcl
module "databricks_config" {
  source  = "WeAreRetail/search-sql-fog/azurerm"
  version = "1.0.0"

  disaster_recovery = var.disaster_recovery
  vnet_id           = module.vnet.id
}
```

***Autogenerated file - do not edit***

#### Requirements

#### Inputs

#### Outputs

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.13.0 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The tag project value | `string` | n/a | yes |
| <a name="input_region_dr"></a> [region\_dr](#input\_region\_dr) | The tag region value | `string` | `"DISASTER_RECOVERY"` | no |
| <a name="input_region_main"></a> [region\_main](#input\_region\_main) | The tag region value | `string` | `"MAIN"` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_database"></a> [mssql\_database](#output\_mssql\_database) | n/a |
| <a name="output_mssql_server_fqdn"></a> [mssql\_server\_fqdn](#output\_mssql\_server\_fqdn) | n/a |
| <a name="output_mssql_server_fqdn_ro"></a> [mssql\_server\_fqdn\_ro](#output\_mssql\_server\_fqdn\_ro) | n/a |
| <a name="output_server_fog_id"></a> [server\_fog\_id](#output\_server\_fog\_id) | n/a |
| <a name="output_server_main_id"></a> [server\_main\_id](#output\_server\_main\_id) | n/a |
<!-- END_TF_DOCS -->