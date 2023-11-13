locals {
  account_id = data.aws_caller_identity.current.account_id
  app_image  = "${local.account_id}.dkr.ecr.us-east-1.amazonaws.com/demo_rest_app:${var.app_version}"
  region     = "us-east-1"
}
