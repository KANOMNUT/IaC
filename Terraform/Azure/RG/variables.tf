variable "rg" {
  type = list(object({
    name = string
    location = string
    tags = map(string)
  }))
}

