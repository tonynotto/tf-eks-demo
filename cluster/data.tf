data "aws_availability_zones" "available" {}

# Current Account ID
data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "demo_cluster" {
  name       = local.name
  depends_on = [module.eks]
}
