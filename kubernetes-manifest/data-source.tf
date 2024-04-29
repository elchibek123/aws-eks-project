data "terraform_remote_state" "cluster-infrastructure" {
  backend = "remote"

  config = {
    organization = "Elchibek"
    workspaces = {
      name = "sandbox-cluster-infrastructure"
    }
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.cluster-infrastructure.outputs.cluster_id
}