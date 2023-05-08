variable "name" {
  description = "name"
}
variable "location" {
  description = "Location"
}

variable "aks_tags" {
  description = "AKS Tags"
  type        = map(string)
}

variable "node_labels" {
  description = "Node Labels"
  type = map(string)
}

#variable "azuread_server_principal_name" {
#  description = "AzureAD Server principal name"
#}

#variable "azuread_server_principal_tags" {
#  description = "Azure AD Server Principal Tags"
#}

#variable "azuread_client_principal_name" {
#  description = "Azure AD Client principal name"
#}

#variable "azuread_client_principal_tags" {
#  description = "Azure AD Client Principal Tags"
#}

variable "resource_group_name" {
  description = "AKS Resource Group Name"
}

variable "node_resource_group_name" {
  description = "AKS Node Resource Group Name"
}

variable "agent_pool_name" {
  description = "AKS Agent Pool Name"
}

variable "subnet_id" {
  description = "AKS Subnet ID"
}

variable "node_vm_size" {
  description = "AKS Node VM Size"
}

variable "node_enable_public_ip" {
  type = bool
  description = "AKS Node Enabled Public IP"
}

variable "node_availability_zones" {
  type = list
  description = "AKS Node Availability Zones"
}

variable "agent_node_count" {
  description = "AKS Agent Node Count"
}

#variable "user_assigned_identity_id" {
#  description = "AKS User Assigned Identity ID"
#}

#variable "tenant_id" {
#  description = "Tenant ID"
#}

variable "kubernetes_version_prefix" {
  description = "Kubernetes Version Prefix"
}

variable "kubernetes_version_prefix_agent" {
  description = "Kubernetes Version Prefix"
}

variable "kubernetes_version_prefix_worker" {
  description = "Kubernetes Version Prefix"
}

variable "only_critical_addons_enabled" {
  description = "Only Critical Addons Enabled"
  type = bool
  default = true
}

variable "max_pods" {
  type = string
}