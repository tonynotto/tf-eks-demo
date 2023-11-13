check "cluster_status" {
  assert {
    condition     = data.aws_eks_cluster.demo_cluster.status == "ACTIVE"
    error_message = "Cluster status is ${data.aws_eks_cluster.demo_cluster.status}"
  }
}

check "cluster_version" {
  assert {
    condition     = data.aws_eks_cluster.demo_cluster.version == "1.28"
    error_message = "Cluster version is ${data.aws_eks_cluster.demo_cluster.version}"
  }
}
