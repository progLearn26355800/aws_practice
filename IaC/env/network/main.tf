terraform {
  required_version = "1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "http" {}

terraform {
  backend "s3" {
    region = "us-west-1"
    bucket = "tfstate-bucket-1"
    key    = "network"
  }
}

module "network" {
  source = "../../module/network"

  vpc_cidr     = var.vpc_cidr
  az_a         = var.az_a
  allowed-cidr = var.allowed-cidr
}
