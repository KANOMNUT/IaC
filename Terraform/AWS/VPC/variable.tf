variable "vpc_cidr" {
  type = string
}
variable "subnet_cidr" {
  type = list(string)
}
variable "tag_vpc" {
  type = map(string)
}
variable "tag_gw" {
  type = map(string)
}
variable "tag_subnet" {
  type = map(string)
}
variable "tag_sg" {
  type = map(string)
}