terraform {
  required_version = ">=1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

  backend "s3" {
    bucket  = "marcelosaad-remote-state"
    key     = "aws-vm-modulos/terraform.tfstate"
    region  = "us-east-1"
    profile = "saad.ti.dev"
  }
}

provider "aws" {
  profile = "saad.ti.dev"
  region  = "us-east-1"
  default_tags {
    tags = {
      owner      = "MarceloSaad"
      managed-by = "Terraform"
    }
  }
}

module "network" {
  source = "./network/"

  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.1.0/24"
  environment = var.environment

}
