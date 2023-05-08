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
  default = "d29f5fe5-0b00-496d-bd52-a5993a1a6cf2"
}

variable "sql-subnet_id" {
  type = string
}

variable "sql_fw_rule" {
  type = list(object({
    name = string
    start_ip = string
    end_ip = string
  }))
}