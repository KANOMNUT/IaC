variable "location" {
  type    = string
}

variable "resource_group_name" {
  type    = string
}

variable "tags" {
  type    = map(string)
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "address_prefixes" {
  type = list(string)
}