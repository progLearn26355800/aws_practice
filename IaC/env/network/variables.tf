variable "aws_region" {
  description = "リージョン名"
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "az_a" {
  type = string
}

variable "allowed-cidr" {
  type    = string
  default = null
}
