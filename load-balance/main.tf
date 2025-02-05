terraform {
  required_version = ">=1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.85.0"
    }
  }
  backend "s3" {
    bucket  = "marcelosaad-remote-state"
    profile = "saad.ti.dev"
    key     = "aws-load-balance/terraform.tfstate"
    region  = "us-east-1"

  }
}

provider "aws" {
  # Configuration options
  profile = "saad.ti.dev"
  region  = "us-east-1"
  default_tags {
    tags = {
      owner      = "MarceloSaad"
      managed-by = "terraform"
    }
  }
}
