variable "location" {
  type    = string
}

variable "resource_group_name" {
  type    = string
}

variable "tags" {
  type    = map(string)
}

variable "vm_name" {
   type = string
}
variable "vm_size" {
  type = string
}

variable "os_disk_type" {
  type = string
}
variable "os_disk_size" {
  type = string
}

variable "data_disk_type" {
  type = string
}
variable "data_disk_size" {
  type = string
}
 variable "subnet_id" {
   type = string
}

variable "publisher" {
  type = string
#  default = "Canonical"
}
variable "offer" {
  type = string
#  default = "0001-com-ubuntu-server-jammy"
}
variable "sku" {
  type = string
#  default = "22_04-lts-gen2"
}
variable "version_os" {
  type = string
#  default = "latest"
}

variable "nsg_id" {
  type = string
}