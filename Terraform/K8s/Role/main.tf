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

module "k8s_role" {
  source = "git@gitlab.com:thanachai.tre/terraform-module//k8s/role/"
  sa_name = var.sa_name
  namespace = var.namespace
  name = var.name
  labels = var.labels 
  rules = var.rules
  subject_kind = var.subject_kind
  group_ids = var.group_ids
}