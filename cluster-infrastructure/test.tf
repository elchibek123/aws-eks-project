# resource "kubernetes_cluster_role" "reader" {
#   metadata {
#     name = "reader"
#   }

#   rule {
#     api_groups = ["*"]
#     resources  = ["deployments", "configmaps", "pods", "secrets", "services"]
#     verbs      = ["get", "list", "watch"]
#   }
# }

# resource "kubernetes_cluster_role_binding" "reader" {
#   metadata {
#     name = "reader"
#   }

#   subject {
#     kind      = "Group"
#     name      = "reader"
#     api_group = "rbac.authorization.k8s.io"
#   }

#   role_ref {
#     kind      = "ClusterRole"
#     name      = kubernetes_cluster_role.reader.metadata.0.name
#     api_group = "rbac.authorization.k8s.io"
#   }
# }