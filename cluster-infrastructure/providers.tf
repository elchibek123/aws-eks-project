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