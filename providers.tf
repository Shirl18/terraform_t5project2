terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    #profile = "Team5LookAlive"
    default_tags {
      tags = var.tags
    }
  }

  terraform  {
    backend "remote" {
    organization = "terraform_AWS_Group5"
    workspaces {
      name = "Project2_Group5"
    }
  }
}