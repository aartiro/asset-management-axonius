output "secret_key" {
  value     = aws_iam_access_key.axonius-key.encrypted_secret
  //sensitive = false
}


output "access_key" {
  value = aws_iam_access_key.axonius-key.id
}