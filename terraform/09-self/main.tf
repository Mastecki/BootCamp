module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-arturl"
  cidr = "10.66.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.66.1.0/24", "10.66.2.0/24", "10.66.3.0/24"]
  public_subnets  = ["10.66.101.0/24", "10.66.102.0/24"]
  database_subnets    = ["10.66.201.0/24", "10.66.202.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Owner = "ArturL"
    Project = "DOR7"
  }
}

resource "aws_internet_gateway" "gw" {
}