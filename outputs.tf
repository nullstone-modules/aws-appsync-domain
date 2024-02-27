output "env" {
  value = [
    {
      name  = "APPSYNC_DOMAIN_NAME"
      value = aws_appsync_domain_name.this.domain_name
    },
  ]
}
