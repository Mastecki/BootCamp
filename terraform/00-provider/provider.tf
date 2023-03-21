terraform {
  required_version = ">= 1.3.9"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = "eu-west-1"
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs
provider "random" {}