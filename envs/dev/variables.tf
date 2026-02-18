variable "region" { type = string }
variable "name"   { type = string }
variable "env"    { type = string }
variable "cluster_endpoint_public_access_cidrs" {type = list(string)}
variable "trusted_principal_arn" {
  description = "IAM user or role ARN allowed to assume this role"
  type        = string
}

