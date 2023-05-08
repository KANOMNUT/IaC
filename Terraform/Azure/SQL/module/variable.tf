variable "sql_name" {
  type = string
}

variable "rg" {
  type = string
}

variable "location" {
  type = string
}

variable "admin_user" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "ad_admin" {
  type = string
}

variable "admin_object_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "sql-subnet_id" {
  type = string
}

variable "firewall_rules" {
  type        = list(object({
    name           = string
    start_ip       = string
    end_ip         = string
  }))
  description = "List of SQL firewall rules to create"
  default     = []
}