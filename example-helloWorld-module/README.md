<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.example_file_a](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_message_a"></a> [message\_a](#input\_message\_a) | A message to include in the output file from Module A. | `string` | n/a | yes |
| <a name="input_output_filename_a"></a> [output\_filename\_a](#input\_output\_filename\_a) | The filename for the output file from Module A. | `string` | `"module_a_output.txt"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_file_a_content"></a> [file\_a\_content](#output\_file\_a\_content) | The content written to the file by Module A. |
| <a name="output_file_a_path"></a> [file\_a\_path](#output\_file\_a\_path) | The absolute path of the file created by Module A. |
<!-- END_TF_DOCS -->