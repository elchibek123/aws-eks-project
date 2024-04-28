terraform {
  cloud {
    organization = "Elchibek"

    workspaces {
      name = "sandbox-cluster-infrastructure"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      OwnerContact = "elchibek.kamalov.com"
      Environment  = var.environment
      Project      = "aws-eks-project"
      Team         = "DevOps"
      ManagedBy    = "Terraform"
    }
  }
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(base64decode(aws_eks_cluster.eks_cluster.certificate_authority[0].data))
  token                  = data.aws_eks_cluster_auth.cluster_auth.token
}