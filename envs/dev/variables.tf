variable "region" { type = string }
variable "name"   { type = string }
variable "env"    { type = string }
variable "admin_principal_arn" {type = string}
variable "cluster_endpoint_public_access_cidrs" {type = list(string)}