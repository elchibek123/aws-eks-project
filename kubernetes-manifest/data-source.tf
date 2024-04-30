data "terraform_remote_state" "eks_cluster" {
  backend = "remote"

  config = {
    organization = "Elchibek"
    workspaces = {
      name = "sandbox-eks-cluster"
    }
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks_cluster.outputs.cluster_id
}