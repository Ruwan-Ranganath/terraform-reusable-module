# modules/vpc/main.tf
resource "local_file" "vpc_config" {
  filename = "${var.vpc_name}-vpc-config.txt"
  content  = <<EOF
VPC Configuration:
Name: ${var.vpc_name}
CIDR Block: ${var.cidr_block}
Environment: ${var.environment}
Enable DNS: ${var.enable_dns_hostnames}
Created: ${timestamp()}
EOF
}

resource "local_file" "vpc_subnets" {
  for_each = var.subnet_configs
  
  filename = "${var.vpc_name}-subnet-${each.key}.txt"
  content  = <<EOF
Subnet Configuration:
Name: ${each.key}
CIDR: ${each.value.cidr}
Availability Zone: ${each.value.az}
Type: ${each.value.type}
VPC: ${var.vpc_name}
EOF
}

# Simulate route table
resource "local_file" "route_table" {
  filename = "${var.vpc_name}-route-table.txt"
  content  = <<EOF
Route Table for VPC: ${var.vpc_name}
Routes:
- Local: ${var.cidr_block}
- Internet Gateway: ${var.enable_internet_gateway ? "0.0.0.0/0 -> igw-${var.vpc_name}" : "Not configured"}
EOF
}