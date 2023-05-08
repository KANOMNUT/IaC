provider "azurerm" {
  features {}
  skip_provider_registration = true
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
   azuread = {
      source = "hashicorp/azuread"
      version = "1.4.0"
    }
  }
}

resource "azurerm_kubernetes_cluster" "agent_pool" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name
  dns_prefix = var.name
  kubernetes_version = var.kubernetes_version_prefix
  automatic_channel_upgrade = "stable"
  sku_tier = "Free"
  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed = true
      azure_rbac_enabled = true
    }
  }
  
  addon_profile {
    ingress_application_gateway {
      enabled = true
      gateway_name = "aks-app-gw" 
#      gateway_id = ""
      subnet_id = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/kanomnutt-vnet/subnets/kanomnutt-agic"
    }
  }

#  linux_profile {
#    admin_username = "ubuntuadm"
#    ssh_key {
#      key_data = file("~/.ssh/id_rsa.pub")
#    }
#  }
  
  default_node_pool {
    name = var.agent_pool_name
    vm_size = var.node_vm_size
    vnet_subnet_id = var.subnet_id
    type = "VirtualMachineScaleSets"
    enable_node_public_ip = var.node_enable_public_ip
    node_count = var.agent_node_count
    max_pods = var.max_pods
    availability_zones = var.node_availability_zones
    orchestrator_version = var.kubernetes_version_prefix_agent
    only_critical_addons_enabled = var.only_critical_addons_enabled
    tags = var.aks_tags
    node_labels = var.node_labels
  }

  service_principal {
    client_id = "bd804247-530c-4705-b1c7-7be496cdb1bc"
    client_secret = "yC78Q~Db8FuSgcJyWQ3avZ3LF.5PHeeX4VNBwaLu"
  }
 # identity {
#   type = "SystemAssigned"
# }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
    network_policy     = "azure"
  }
  
  tags = var.aks_tags
  
}

resource "azurerm_kubernetes_cluster_node_pool" "worker_pool" {
  name = "workerpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.agent_pool.id
  vm_size = var.node_vm_size
  node_count = 1
  enable_node_public_ip = var.node_enable_public_ip
  max_pods = var.max_pods
  orchestrator_version = var.kubernetes_version_prefix_worker
  vnet_subnet_id = var.subnet_id
  mode = "User"
  tags = var.aks_tags 
}



#module "aks_cluster" {
#    source = "git@gitlab.com:thanachai.tre/terraform-module//aks/"
#    name = var.name
#    location = var.location
#    resource_group_name = var.resource_group_name
#    node_resource_group_name = var.node_resource_group_name
#    aks_tags = var.aks_tags
#    azuread_server_principal_name = var.azuread_server_principal_name
#    azuread_server_principal_tags = var.azuread_server_principal_tags
#    azuread_client_principal_name = var.azuread_client_principal_name
#    azuread_client_principal_tags = var.azuread_client_principal_tags
#    agent_pool_name = var.agent_pool_name
#    subnet_id = var.subnet_id
#    node_vm_size = var.node_vm_size
#    node_enable_public_ip = var.node_enable_public_ip
#    node_availability_zones = var.node_availability_zones
#    agent_node_count = var.agent_node_count
#    node_labels = var.node_labels
#    user_assigned_identity_id = var.user_assigned_identity_id
#    kubernetes_version_prefix = var.kubernetes_version_prefix
#    tenant_id = var.tenant_id
#    only_critical_addons_enabled = var.only_critical_addons_enabled
#}