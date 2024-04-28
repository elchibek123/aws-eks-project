terraform {
  required_version = "~>1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.45.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~>2.29.0"
    }
  }
}