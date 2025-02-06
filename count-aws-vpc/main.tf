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
    key     = "count-vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "saad.ti.dev"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "saad.ti.dev"
  default_tags {
    tags = {
      owner      = "MarceloSaad"
      managed-by = "Terraform"
    }
  }
}
