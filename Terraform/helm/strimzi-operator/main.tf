resource "helm_release" "kafka" {
#    source = "git@gitlab.com:thanachai.tre/terraform-module//k8s/helm"
    name = var.release_name
    repository = var.chart_repository
    chart = var.chart_name
    version = var.chart_version
#    config_file_path = var.config_file_path
    namespace = var.namespace
#    lint_enabled = var.lint_enabled
    values = [
      "${file(var.config_file_path)}"
    ]
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
  }
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.0.3"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.0"
    }
  }
}