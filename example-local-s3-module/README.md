<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.bucket_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.bucket_lifecycle](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.bucket_policy](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_access"></a> [block\_public\_access](#input\_block\_public\_access) | Block all public access to the S3 bucket | `bool` | `true` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket | `string` | n/a | yes |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Create a bucket policy | `bool` | `true` | no |
| <a name="input_encryption_enabled"></a> [encryption\_enabled](#input\_encryption\_enabled) | Enable default encryption for the S3 bucket | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | `"dev"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key ID for encryption | `string` | `null` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | List of lifecycle rules | <pre>list(object({<br/>    id              = string<br/>    status          = string<br/>    expiration_days = number<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the S3 bucket | `map(string)` | `{}` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enable versioning for the S3 bucket | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the S3 bucket |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | Domain name of the S3 bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of the S3 bucket |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | Regional domain name of the S3 bucket |
| <a name="output_config_files"></a> [config\_files](#output\_config\_files) | Generated configuration files |
| <a name="output_encryption_enabled"></a> [encryption\_enabled](#output\_encryption\_enabled) | Whether encryption is enabled |
| <a name="output_versioning_enabled"></a> [versioning\_enabled](#output\_versioning\_enabled) | Whether versioning is enabled |
<!-- END_TF_DOCS -->