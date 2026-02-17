module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.name
  cluster_version = "1.29"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  cluster_endpoint_public_access       = true
  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs

  # EKS managed add-ons (optional but recommended)
  cluster_addons = {
    coredns   = {}
    kube-proxy = {}
    vpc-cni   = {}
  }

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.micro"]
      min_size       = 2
      max_size       = 4
      desired_size   = 2
    }
  }

  tags = {
    Environment = var.env
  }

access_entries = {
  admin = {
    principal_arn = var.admin_principal_arn
    policy_associations = {
      admin = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
        access_scope = { type = "cluster" }
        }
      }
    }
}


}
