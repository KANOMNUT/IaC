provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "kubectl" {
  config_path = "~/.kube/config"
}

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

data "kubectl_path_documents" "kafka_file" {
    pattern = var.pattern
    vars = {
        namespaces = var.namespaces
    }
}

resource "kubectl_manifest" "kafka" {
    for_each  = toset(data.kubectl_path_documents.kafka_file.documents)
    yaml_body = each.value
}
