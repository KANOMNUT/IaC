variable "kv_id" {
  type = string
}

variable "tenant_id" {
  default = "d29f5fe5-0b00-496d-bd52-a5993a1a6cf2"
}

variable "object_id" {
  type = string
}

variable "key_permissions" {
  type = list(string)
}

variable "secret_permissions" {
  type = list(string)
}

variable "certificate_permissions" {
  type = list(string)
}