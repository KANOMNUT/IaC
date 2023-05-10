terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "namespace" {
  source = "git@gitlab.com:thanachai.tre/terraform-module//k8s/ns"
  k8s_ns = var.k8s_ns
}

# resource "kubernetes_namespace" "k8s_ns" {
#   count = length(var.k8s_ns)
#   metadata {
#     name = var.k8s_ns[count.index].ns_name
#     labels = var.k8s_ns[count.index].ns_label
#   }
# }