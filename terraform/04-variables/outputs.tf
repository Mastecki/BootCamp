output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "account_number" {
  description = "AWS Account Number"
  value       = aws_vpc.vpc.owner_id
}