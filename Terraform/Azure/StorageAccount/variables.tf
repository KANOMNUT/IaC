variable "sa_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
  default = "southeastasia"
}

variable "tags" {
  type = map(string)
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "account_kind" {
  type = string
}

variable "access_tier" {
  type = string
  default = "Hot"
}

variable "tls_version" {
  type = string
  default = "TLS1_2"
}

variable "blob_public_access" {
  type = string
  default = "true"
}
