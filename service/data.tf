# data "aws_availability_zones" "available" {}

# Current Account ID
data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "default" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "default" {
  name = var.cluster_name
}
