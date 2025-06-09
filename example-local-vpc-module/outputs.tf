# modules/vpc/outputs.tf
output "vpc_id" {
  description = "ID of the VPC"
  value       = "vpc-${var.vpc_name}-${substr(md5("${var.vpc_name}-${var.cidr_block}"), 0, 8)}"
}

output "vpc_name" {
  description = "Name of the VPC"
  value       = var.vpc_name
}

output "cidr_block" {
  description = "CIDR block of the VPC"
  value       = var.cidr_block
}

output "subnet_ids" {
  description = "Map of subnet IDs"
  value = {
    for k, v in var.subnet_configs : k => "subnet-${k}-${substr(md5("${k}-${v.cidr}"), 0, 8)}"
  }
}

output "route_table_id" {
  description = "Route table ID"
  value       = "rtb-${var.vpc_name}-${substr(md5("${var.vpc_name}-route-table"), 0, 8)}"
}

output "config_files" {
  description = "Generated configuration files"
  value = {
    vpc_config    = local_file.vpc_config.filename
    subnets       = { for k, v in local_file.vpc_subnets : k => v.filename }
    route_table   = local_file.route_table.filename
  }
}