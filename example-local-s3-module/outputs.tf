# modules/s3-bucket/outputs.tf
output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = var.bucket_name
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = "arn:aws:s3:::${var.bucket_name}"
}

output "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  value       = "${var.bucket_name}.s3.amazonaws.com"
}

output "bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket"
  value       = "${var.bucket_name}.s3.us-west-2.amazonaws.com"
}

output "config_files" {
  description = "Generated configuration files"
  value = {
    bucket_config    = local_file.bucket_config.filename
    bucket_policy    = var.create_policy ? local_file.bucket_policy[0].filename : null
    lifecycle_config = length(var.lifecycle_rules) > 0 ? local_file.bucket_lifecycle[0].filename : null
  }
}

output "versioning_enabled" {
  description = "Whether versioning is enabled"
  value       = var.versioning_enabled
}

output "encryption_enabled" {
  description = "Whether encryption is enabled"
  value       = var.encryption_enabled
}