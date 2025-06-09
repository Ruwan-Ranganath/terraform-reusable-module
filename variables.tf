# environments/dev/variables.tf
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "myapp"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "main-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_internet_gateway" {
  description = "Enable internet gateway for the VPC"
  type        = bool
  default     = true
}

variable "subnet_configs" {
  description = "Configuration for subnets"
  type = map(object({
    cidr = string
    az   = string
    type = string
  }))
  default = {
    public_1 = {
      cidr = "10.0.1.0/24"
      az   = "us-west-2a"
      type = "public"
    }
    public_2 = {
      cidr = "10.0.2.0/24"
      az   = "us-west-2b"
      type = "public"
    }
    private_1 = {
      cidr = "10.0.10.0/24"
      az   = "us-west-2a"
      type = "private"
    }
    private_2 = {
      cidr = "10.0.11.0/24"
      az   = "us-west-2b"
      type = "private"
    }
  }
}

variable "s3_versioning_enabled" {
  description = "Enable versioning for S3 buckets"
  type        = bool
  default     = true
}

variable "s3_encryption_enabled" {
  description = "Enable encryption for S3 buckets"
  type        = bool
  default     = true
}

variable "s3_block_public_access" {
  description = "Block public access for S3 buckets"
  type        = bool
  default     = true
}

variable "s3_create_policy" {
  description = "Create bucket policies for S3 buckets"
  type        = bool
  default     = true
}

variable "s3_lifecycle_rules" {
  description = "Lifecycle rules for the data S3 bucket"
  type = list(object({
    id              = string
    status          = string
    expiration_days = number
  }))
  default = [
    {
      id              = "delete_old_versions"
      status          = "Enabled"
      expiration_days = 365
    }
  ]
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "terraform-modules-demo"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}