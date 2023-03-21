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

resource "aws_subnet" "private" {
  for_each = var.subnet_prefix

  availability_zone = each.value["az"]
  cidr_block        = each.value["cidr"]
  vpc_id            = aws_vpc.vpc.id
  tags = merge(
    var.common_tags, {
      Name = "${var.vpc_name}-${each.key}"
    }
  )
}
