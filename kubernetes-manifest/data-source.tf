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

data "http" "ebs_csi_iam_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-ebs-csi-driver/master/docs/example-iam-policy.json"
  request_headers = {
    Accept = "application/json"
  }
}