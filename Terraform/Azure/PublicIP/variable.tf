variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
  default = "southeastasia"
}

variable "allocation_method" {
  type = string
  default = "Dynamic"
}

variable "sku" {
  type = string
  default = "Basic"
}

variable "ip_version" {
  type = string
  default = "IPv4"
}

variable "tag" {
  type = map(string)
}