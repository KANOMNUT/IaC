variable "ami" {
  type = string
  description = "EC2 image ID"
}
variable "instance_type" {
  type = string
  description = "EC2 instance type"
  default = "t2.micro"
}
variable "associate_public_ip_address" {
  type = bool
  description = "Enable public IP for EC2"
}
variable "key_name" {
  type = string
  description = "Key name for connect to EC2"
  default = "kanomnutt-key"
}
variable "subnet_id" {
  type = string
  description = "EC2 subnet ID"
}
variable "vpc_security_group_ids" {
  type = list(string)
  description = "Security group ID for EC2"
}
variable "tags" {
  type = map(string)
}


