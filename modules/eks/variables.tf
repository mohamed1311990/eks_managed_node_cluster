variable "name" { type = string }
variable "env"  { type = string }

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "admin_principal_arn" {
  type        = string
  description = "IAM principal (user/role) to grant EKS admin access"
}

variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to access EKS public endpoint"
}
