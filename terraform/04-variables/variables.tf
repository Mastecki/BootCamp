variable "common_tags" {
  type        = map(any)
  description = "Tags for resources"
  default = {
    terraform   = true
    github_repo = "git@github.com:infoshareacademy/dor7-materialy.git"
  }
}

variable "vpc_cidr" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}