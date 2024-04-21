resource "aws_secretsmanager_secret" "main" {
  name       = var.name
  kms_key_id = var.kms_key_id

  tags = merge(
    local.common_tags, var.extra_tags,
    {
      "Name" = "${var.name}-${var.env}-secret"
    }
  )
}

resource "aws_secretsmanager_secret_version" "main" {
  secret_id     = aws_secretsmanager_secret.main.id
  secret_string = var.secret_string

  lifecycle {
    ignore_changes = [ secret_string ]
  }
}