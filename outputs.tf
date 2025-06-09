# environments/dev/outputs.tf
output "vpc_details" {
  description = "VPC module outputs"
  value = {
    id           = module.main_vpc.vpc_id
    name         = module.main_vpc.vpc_name
    cidr_block   = module.main_vpc.cidr_block
    subnet_ids   = module.main_vpc.subnet_ids
    route_table  = module.main_vpc.route_table_id
    config_files = module.main_vpc.config_files
  }
}

output "s3_buckets" {
  description = "S3 bucket module outputs"
  value = {
    data_bucket = {
      id                   = module.app_data_bucket.bucket_id
      arn                  = module.app_data_bucket.bucket_arn
      domain_name          = module.app_data_bucket.bucket_domain_name
      regional_domain_name = module.app_data_bucket.bucket_regional_domain_name
      versioning_enabled   = module.app_data_bucket.versioning_enabled
      encryption_enabled   = module.app_data_bucket.encryption_enabled
      config_files         = module.app_data_bucket.config_files
    }
    logs_bucket = {
      id                   = module.logs_bucket.bucket_id
      arn                  = module.logs_bucket.bucket_arn
      domain_name          = module.logs_bucket.bucket_domain_name
      regional_domain_name = module.logs_bucket.bucket_regional_domain_name
      versioning_enabled   = module.logs_bucket.versioning_enabled
      encryption_enabled   = module.logs_bucket.encryption_enabled
      config_files         = module.logs_bucket.config_files
    }
  }
}

output "infrastructure_summary_file" {
  description = "Path to the infrastructure summary file"
  value       = local_file.infrastructure_summary.filename
}

output "all_generated_files" {
  description = "List of all generated files"
  value = flatten([
    [local_file.infrastructure_summary.filename],
    values(module.main_vpc.config_files.subnets),
    [module.main_vpc.config_files.vpc_config],
    [module.main_vpc.config_files.route_table],
    [module.app_data_bucket.config_files.bucket_config],
    [module.logs_bucket.config_files.bucket_config],
    compact([
      module.app_data_bucket.config_files.bucket_policy,
      module.app_data_bucket.config_files.lifecycle_config,
      module.logs_bucket.config_files.bucket_policy,
      module.logs_bucket.config_files.lifecycle_config
    ])
  ])
}