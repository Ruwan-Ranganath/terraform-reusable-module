environment = "dev"
app_name    = "myapp"

# VPC Configuration
vpc_name                = "dev-main-vpc"
vpc_cidr                = "10.0.0.0/16"
enable_dns_hostnames    = true
enable_internet_gateway = true

subnet_configs = {
  public_web = {
    cidr = "10.0.1.0/24"
    az   = "us-west-2a"
    type = "public"
  }
  public_app = {
    cidr = "10.0.2.0/24"
    az   = "us-west-2b"
    type = "public"
  }
  private_db = {
    cidr = "10.0.10.0/24"
    az   = "us-west-2a"
    type = "private"
  }
  private_cache = {
    cidr = "10.0.11.0/24"
    az   = "us-west-2b"
    type = "private"
  }
}

# S3 Configuration
s3_versioning_enabled  = true
s3_encryption_enabled  = true
s3_block_public_access = true
s3_create_policy       = true

s3_lifecycle_rules = [
  {
    id              = "cleanup_old_versions"
    status          = "Enabled"
    expiration_days = 180
  },
  {
    id              = "archive_old_data"
    status          = "Enabled"
    expiration_days = 730
  }
]

# Common Tags
common_tags = {
  Project     = "terraform-modules-local-demo"
  Environment = "dev"
  Owner       = "DevOps-Team"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
}