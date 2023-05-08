module "prometheus" {
    source = "git@gitlab.com:thanachai.tre/terraform-module//k8s/helm"
    release_name = var.release_name
    chart_repository = var.chart_repository
    chart_name = var.chart_name
    chart_version = var.chart_version
    config_file_path = var.config_file_path
    namespace = var.namespace
    lint_enabled = var.lint_enabled
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