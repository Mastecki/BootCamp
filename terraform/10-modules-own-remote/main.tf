module vpc {
    source = "git::https://github.com/malekmaciej/aws-terraform-vpc.git"
    cidr_block = "10.0.0.0/16"
    vpc_name = "Test-Maciej"
}