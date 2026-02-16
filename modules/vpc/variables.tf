variable "name" {
  description = "Base name used for VPC and related resources"
  type        = string
}

variable "region" {
  description = "AWS region (example: us-east-1)"
  type        = string
}

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}
