module "vpc" {
  source = "../../modules/vpc"

  name   = var.name
  region = var.region
  env    = var.env
}

 resource "aws_iam_role" "admin_role" {
   name = "admin-role"
   assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = var.trusted_principal_arn
      }
      Action = "sts:AssumeRole"
    }]
   })
  }
 
 resource "aws_iam_role_policy_attachment" "admin_eks_full_access" {
  role       = aws_iam_role.admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
 }



module "eks" {
  source = "../../modules/eks"

  name       = var.name
  env        = var.env
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  admin_role_principal_arn = aws_iam_role.admin_role.arn

}
