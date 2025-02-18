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
    key     = "aws-findlove/terraform.tfstate"
    region  = "us-east-1"
    profile = "find-love"
  }
}

provider "aws" {
  # Configuration options
  region  = "us-east-1"
  profile = "find.love"
  default_tags {
    tags = {
      owner      = "Findlove"
      managed-by = "terraform"
    }
  }
}
