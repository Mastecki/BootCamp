## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.client_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.client_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ssm_param_client_name"></a> [ssm\_param\_client\_name](#input\_ssm\_param\_client\_name) | Name of the SSM Parameter for API Client Name | `string` | n/a | yes |
| <a name="input_ssm_param_client_secret"></a> [ssm\_param\_client\_secret](#input\_ssm\_param\_client\_secret) | Name of the SSM Parameter for API Client Secret | `string` | n/a | yes |

## Outputs

No outputs.
