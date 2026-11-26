terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Terraform keeps its memory in the S3 bucket from Stage 4.
  # use_lockfile stops two people changing things at the same time
  backend "s3" {
    bucket       = "akeem-tfstate-610222269500"
    key          = "cloud-web-app/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region

  # Every resource gets these tags, which helps track costs
  default_tags {
    tags = {
      Project   = var.project
      Owner     = "akeem"
      ManagedBy = "terraform"
    }
  }
}