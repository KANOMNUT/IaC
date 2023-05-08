variable "pg_name" {
  type = string
}
variable "location" {
  type = string
  default = "southeastasia"
}
variable "tag" {
  type = map(string)
}
variable "rg" {
  type = string
}
variable "pg_admin_user" {
  type = string
}
variable "sku" {
  type = string
}
variable "version_pg" {
  type = string
}
variable "storage_mb" {
  type = string
}
variable "ssl_enforcement_enabled" {
  type = bool
  default = true
}
variable "ssl_minimal_tls_version_enforced" {
  type = string
  default = "TLS1_2"
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