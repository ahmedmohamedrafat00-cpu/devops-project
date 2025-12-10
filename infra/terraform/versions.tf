terraform {
  required_version = ">= 1.4.0"

  backend "s3" {
    bucket  = "devops-project-tf-state-ahmed-001"
    key     = "global/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

