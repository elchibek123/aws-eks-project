terraform {
  cloud {
    organization = "Elchibek"

    workspaces {
      name = "Sandbox"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      OwnerContact = "elchibek.kamalov.com"
      Environment  = var.environment
      Project      = "AWSEKSProject"
      Team         = "DevOps"
      ManagedBy    = "Terraform"
    }
  }
}