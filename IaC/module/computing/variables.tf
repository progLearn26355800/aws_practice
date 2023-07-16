variable "aws_region" {
  type = string
}
variable "vpc_id" {
  type = string
  default = null
}
variable "public_subnet_id" {
  type = string
  default = null
}
variable "private_subnet_id" {
  type = string
  default = null
}
variable allowed-cidr {
    type = string
}
variable key_name {
    type = string
}
