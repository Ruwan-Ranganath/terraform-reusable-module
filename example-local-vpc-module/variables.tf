# modules/vpc/variables.tf
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  validation {
    condition     = length(var.vpc_name) > 0
    error_message = "VPC name cannot be empty."
  }
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "CIDR block must be a valid IPv4 CIDR."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
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
    private_1 = {
      cidr = "10.0.2.0/24"
      az   = "us-west-2b"
      type = "private"
    }
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}