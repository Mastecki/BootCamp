# Przygotowanie sieci

Poniższe punkty można utworzyć ręcznie przez AWS Management Console lub tez z kodu terraform, który znajduję się na końcu tego dokumentu.

## VPC

https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#vpcs:

VPC musi miec `wlaczone` obie opcje:

* DNS hostnames
* DNS resolution

CIDR: 10.0.0.0/24

## Subnets

* 2 publiczne podsieci, w dwoch różnych AZs (polecam maskę /26 dla każdej sieci)
* 2 prywatne podsieci, w dwoch różnych AZs (polecam maskę /26 dla każdej sieci)

## Internet Gateway

Utworzyć IGW i podłączyć do VPC

## NAT Gateway

* Utworzyć `NAT Gateway w jednej AZ/subnecie`.
* Wybrac Connectivity Type - `Public`
* Zaalokowac Elastic IP

## Security Group - public - dostęp z zewnatrz

Ustawiamy tylko reguły `inress`

* HTTP - port 80, protokół TCP, CIDR 0.0.0.0/0
* HTTPS - port 443, protokół TCP, CIDR 0.0.0.0/0

## Security Group - private - dostęp pomiedzy ECS a Load Balancerem

Ustawiamy reguły `ingress` i `egress`

* Ingress
  * Flask - port 5000, protokół TCP, CIDR 10.0.0.0/24
* Egress
  * pełny dostęp - wszystkie porty, CIDR 0.0.0.0/0

## Kod Terraform

```hcl
module "vpc" {
  source           = "terraform-aws-modules/vpc/aws"
  version          = "3.19.0"
  name             = "xxxxxxx"
  cidr             = "10.0.0.0/24"
  azs              = ["eu-west-1a", "eu-west-1b"]
  private_subnets  = ["10.0.0.0/26", "10.0.0.64/26"]
  public_subnets   = ["10.0.0.128/26", "10.0.0.192/26"]
  enable_nat_gateway   = true
  create_igw           = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Terraform = "true"
    Owner     = "xxxxxx"
  }
}
```