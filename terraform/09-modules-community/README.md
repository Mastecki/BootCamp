# Zadanie

Przy pomocy moduly https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest utworzyc

- tfstate ma byc na S3
- VPC - siec 10.66.0.0/16
- 3 prywatne podsieci
- 2 publiczne podcieci
- 2 podsieci dla bazy danych 
- Internet Gateway
- 1 NAT gateway 
- DNS hostname oraz DNS Support maja byc wlaczone
- VPC mam miec tagi - min. to Terraform = true, Owner = "Imie", Project = DOR7


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | terraform-aws-modules/ecr/aws | 1.6.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_url"></a> [url](#output\_url) | URL do repozytorium ECR |
