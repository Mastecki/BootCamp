# https://registry.terraform.io/modules/terraform-aws-modules/ecr/aws/latest

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "maciej"
  cidr = "10.66.0.0/16"

  azs              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets  = ["10.66.1.0/24", "10.66.2.0/24", "10.66.3.0/24"]
  public_subnets   = ["10.66.101.0/24", "10.66.102.0/24"]
  database_subnets = ["10.66.201.0/24", "10.66.202.0/24"]

  enable_nat_gateway   = true
  create_igw           = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Terraform = "true"
    Owner     = "Maciej"
    Project   = "DOR7"
  }
}

data "local_file" "ssh_key" {
  filename = "aws-dor7.pub"
}

resource "aws_key_pair" "this" {
  key_name   = "maciej-key"
  public_key = data.local_file.ssh_key.content
}

resource aws_instance "ec2" {
  ami           = "ami-00169914e6299b8e0"
  instance_type = "t3.micro"
  subnet_id = module.vpc.public_subnets[0]
  key_name = aws_key_pair.this.key_name
}

resource "aws_security_group_rule" "internet" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpc.default_security_group_id
}