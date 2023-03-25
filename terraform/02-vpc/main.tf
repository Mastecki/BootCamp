resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "DOR7-ArturL"
    terraform   = true
    github_repo = "git@github.com:infoshareacademy/dor7-materialy.git"
  }
}