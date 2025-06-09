terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

# Refer to remote modules 

module "main_vpc" {
  source = "git@github.com:Ruwan-Ranganath/terraform-reusable-module.git?ref=main"

  vpc_name                = var.vpc_name
  cidr_block              = var.vpc_cidr
  environment             = var.environment
  enable_dns_hostnames    = var.enable_dns_hostnames
  enable_internet_gateway = var.enable_internet_gateway
  subnet_configs          = var.subnet_configs

  tags = merge(var.common_tags, {
    Module = "vpc"
  })
}

# module "app_data_bucket" {
#   source = "./example-local-s3-module"

#   bucket_name         = "${var.environment}-${var.app_name}-data"
#   environment         = var.environment
#   versioning_enabled  = var.s3_versioning_enabled
#   encryption_enabled  = var.s3_encryption_enabled
#   block_public_access = var.s3_block_public_access
#   create_policy       = var.s3_create_policy
#   lifecycle_rules     = var.s3_lifecycle_rules

#   tags = merge(var.common_tags, {
#     Module  = "s3-bucket"
#     Purpose = "application-data"
#   })
# }

# module "logs_bucket" {
#   source = "./example-local-s3-module"

#   bucket_name         = "${var.environment}-${var.app_name}-logs"
#   environment         = var.environment
#   versioning_enabled  = false
#   encryption_enabled  = true
#   block_public_access = true
#   create_policy       = true
#   lifecycle_rules = [
#     {
#       id              = "delete_old_logs"
#       status          = "Enabled"
#       expiration_days = 90
#     }
#   ]

#   tags = merge(var.common_tags, {
#     Module  = "s3-bucket"
#     Purpose = "logs"
#   })
# }

module "module_a_instance" {
  source = "git@github.com:Ruwan-Ranganath/terraform-reusable-module.git?ref=main"

  message_a = "Hello from the root configuration!"
  output_filename_a = "root_config_module_a.txt"
}

# Just for testing purposes 
# Create a local file that demonstrates the relationship between resources
resource "local_file" "infrastructure_summary" {
  filename = "infrastructure-summary.txt"
  content  = <<EOF
Infrastructure Summary for ${var.environment} environment:

VPC Information:
- Name: ${module.main_vpc.vpc_name}
- ID: ${module.main_vpc.vpc_id}
- CIDR: ${module.main_vpc.cidr_block}
- Subnets: ${join(", ", keys(module.main_vpc.subnet_ids))}

S3 Buckets:
- Data Bucket: ${module.app_data_bucket.bucket_id}
#  - Logs Bucket: ${module.logs_bucket.bucket_id}

Generated Files:
VPC Files:
${join("\n", [for file in values(module.main_vpc.config_files.subnets) : "- ${file}"])}
- ${module.main_vpc.config_files.vpc_config}
- ${module.main_vpc.config_files.route_table}

S3 Files:
- ${module.app_data_bucket.config_files.bucket_config}


Created: ${timestamp()}
EOF
}