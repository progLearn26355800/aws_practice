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
terraform {
  backend "s3" {
    region = "us-west-1"
    bucket = "tfstate-bucket-1"
    key    = "computing"
  }
}

provider "http" {}

module "computing" {
  source = "../../module/computing"

  aws_region        = var.aws_region
  key_name          = var.key_name
  allowed-cidr      = var.allowed-cidr
  vpc_id            = data.terraform_remote_state.network.outputs.vpc_id
  public_subnet_id  = data.terraform_remote_state.network.outputs.public_subnet_id
  private_subnet_id = data.terraform_remote_state.network.outputs.private_subnet_id
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    region = "us-west-1"
    bucket = "tfstate-bucket-1"
    key    = "network"
  }
}
