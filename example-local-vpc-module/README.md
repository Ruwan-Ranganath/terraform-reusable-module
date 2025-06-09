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
| [local_file.route_table](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.vpc_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.vpc_subnets](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Enable DNS hostnames in the VPC | `bool` | `true` | no |
| <a name="input_enable_internet_gateway"></a> [enable\_internet\_gateway](#input\_enable\_internet\_gateway) | Enable internet gateway for the VPC | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | `"dev"` | no |
| <a name="input_subnet_configs"></a> [subnet\_configs](#input\_subnet\_configs) | Configuration for subnets | <pre>map(object({<br/>    cidr = string<br/>    az   = string<br/>    type = string<br/>  }))</pre> | <pre>{<br/>  "private_1": {<br/>    "az": "us-west-2b",<br/>    "cidr": "10.0.2.0/24",<br/>    "type": "private"<br/>  },<br/>  "public_1": {<br/>    "az": "us-west-2a",<br/>    "cidr": "10.0.1.0/24",<br/>    "type": "public"<br/>  }<br/>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cidr_block"></a> [cidr\_block](#output\_cidr\_block) | CIDR block of the VPC |
| <a name="output_config_files"></a> [config\_files](#output\_config\_files) | Generated configuration files |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | Route table ID |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | Map of subnet IDs |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | Name of the VPC |
<!-- END_TF_DOCS -->