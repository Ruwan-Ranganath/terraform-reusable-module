# modules/s3-bucket/variables.tf
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Bucket name must be between 3 and 63 characters."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "versioning_enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "encryption_enabled" {
  description = "Enable default encryption for the S3 bucket"
  type        = bool
  default     = true
}

variable "block_public_access" {
  description = "Block all public access to the S3 bucket"
  type        = bool
  default     = true
}

variable "create_policy" {
  description = "Create a bucket policy"
  type        = bool
  default     = true
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules"
  type = list(object({
    id              = string
    status          = string
    expiration_days = number
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}