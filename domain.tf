resource "aws_appsync_domain_name" "this" {
  domain_name = trimsuffix(local.subdomain_name, ".")
  certificate_arn = aws_acm_certificate.this.arn

  depends_on = [aws_acm_certificate_validation.this]
}
