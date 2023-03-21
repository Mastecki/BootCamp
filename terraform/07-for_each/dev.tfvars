vpc_name       = "DOR7-07-Maciej"
vpc_cidr_block = "10.0.0.0/24"
region         = "eu-west-1"
subnet_prefix = {
  subnet-1 = {
    az   = "eu-west-1a"
    cidr = "10.0.0.0/26"
  }
  subnet-2 = {
    az   = "eu-west-1b"
    cidr = "10.0.0.64/26"
  }
}
common_tags = {
  owner     = "dor7-07-maciej-malek"
  terraform = true
  project   = "DOR7"
}