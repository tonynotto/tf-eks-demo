locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  cluster_version = "1.28"
  name            = "eks-demo"
  region          = "us-east-1"

  tags = {
    ResourceGroup = local.name
    GithubRepo    = "terraform-aws-eks"
    GithubOrg     = "terraform-aws-modules"
  }
  vpc_cidr = "10.0.0.0/16"
}
