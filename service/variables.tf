variable "app_label" {
  description = "The kubernetes label applied to the pods and used for service inclusion"
  type        = string
  default     = "MyDemoApi"
}

variable "app_version" {
  description = "The version used for the app image tag."
  type        = string
}

variable "cluster_name" {
  description = "Name of your Kubernetes cluster"
  type        = string
}
