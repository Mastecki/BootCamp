variable "vpc_name" {
  type        = string
  description = "Name for the VPC"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The primary IPv4 CIDR block for the VPC."
}

variable "region" {
  type        = string
  description = "Name of the region where deploying"
}

variable "common_tags" {
  type        = map(string)
  description = "Common resource tags"
  default     = {}
}

variable "enabled" {
  type        = bool
  description = "Set to true for resource to be created"
}