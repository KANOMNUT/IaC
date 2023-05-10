variable "k8s_ns" {
  type = list(object({
    name = string
    labels = map(string)
  }))
}