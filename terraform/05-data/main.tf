resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    var.common_tags,
    {
      Name = var.vpc_name
  })
}

resource "aws_subnet" "private" {
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.0.0/26"
  vpc_id            = aws_vpc.vpc.id
  tags = merge(
    var.common_tags, {
      Name = "${var.vpc_name}-subnet"
    }
  )
}

resource "aws_security_group" "sg" {
  name   = "EC2 - ${var.vpc_name}"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.vpc_name}-SSH"
  })
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = aws_subnet.private.id
  tags = merge(
    var.common_tags,
    {
      Name = "${var.vpc_name}-ec2"
  })
}