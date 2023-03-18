resource "aws_ssm_parameter" "client_name" {
  name  = var.ssm_param_client_name
  type  = "String"
  value = "VALUE-UPDATED-MANUALLY"

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "aws_ssm_parameter" "client_secret" {
  name  = var.ssm_param_client_secret
  type  = "SecureString"
  value = "VALUE-UPDATED-MANUALLY"

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}