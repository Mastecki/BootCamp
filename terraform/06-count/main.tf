resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    var.common_tags,
    {
      Name = var.vpc_name
  })
}

resource "aws_subnet" "private-01" {
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.0.0/26"
  vpc_id            = aws_vpc.vpc.id
  tags = merge(
    var.common_tags, {
      Name = "${var.vpc_name}-01"
    }
  )
}

resource "aws_subnet" "private-02" {
  count = var.enabled ? 1 : 0

  availability_zone = "eu-west-1b"
  cidr_block        = "10.0.0.64/26"
  vpc_id            = aws_vpc.vpc.id
  tags = merge(
    var.common_tags, {
      Name = "${var.vpc_name}-02"
    }
  )
}