resource "aws_iam_policy" "policy" {
  name        = "axonius_policy"
  path        = "/"
  description = "Axonius Policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("./iam-policy.json")
  tags   = var.tags_all
  lifecycle {
    ignore_changes = [
      tags_all
    ]
  }
}

resource "aws_iam_access_key" "axonius-key" {
  user = aws_iam_user.axonius-user.name
}

resource "aws_iam_user" "axonius-user" {
  name = "axonius-user"
  path = "/"
  tags = var.tags_all
  lifecycle {
    ignore_changes = [
      tags_all
    ]
  }
}

resource "aws_iam_policy_attachment" "attach-policy" {
  name       = "axonius-policy-attachment"
  users      = [aws_iam_user.axonius-user.name]
  policy_arn = aws_iam_policy.policy.arn
}