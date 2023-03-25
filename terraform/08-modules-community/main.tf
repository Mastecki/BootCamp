# https://registry.terraform.io/modules/terraform-aws-modules/ecr/aws/latest

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"
  version = "1.6.0"

  repository_name = "dor7-maciej"

  repository_image_scan_on_push = true
  registry_scan_type = "BASIC"
  repository_read_write_access_arns = ["arn:aws:iam::844187532425:user/trener-maciej.malek"]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 5 images",
        selection = {
          tagStatus     = "any",
          countType     = "imageCountMoreThan",
          countNumber   = 5
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
  tags = {
    Owner       = "Maciej Malek"
    Project     = "DOR7"
    Terraform   = "true"
  }
}