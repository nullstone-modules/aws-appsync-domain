resource "aws_iam_role_policy_attachment" "enable-api-association" {
  role       = var.app_metadata["role_name"]
  policy_arn = aws_iam_policy.enable-api-association.arn
}

resource "aws_iam_policy" "enable-api-association" {
  name        = "enable-association"
  description = "Policy to enable api association with appsync domain"
  policy      = data.aws_iam_policy_document.enable-api-association.json
}

data "aws_iam_policy_document" "enable-api-association" {
  statement {
    sid    = "EnableAssociation"
    effect = "Allow"

    actions = [
      "appsync:AssociateApi",
    ]

    resources = ["arn:aws:appsync:${data.aws_region.this.name}:${local.account_id}:domainnames/${aws_appsync_domain_name.this.domain_name}"]
  }
}
