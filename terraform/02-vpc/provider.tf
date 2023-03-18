terraform {
  required_version = ">= 1.3.9"
}

provider "aws" {
  profile = "infoshare"
  region  = "eu-west-1"
}