terraform {
  required_version = ">= 1.2.1"
}

provider "aws" {
  profile = "infoshare"
  region  = "eu-west-1"
}