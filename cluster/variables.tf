variable "app_label" {
  description = "The kubernetes label applied to the pods and used for service inclusion"
  type        = string
  default     = "MyDemoApi"
}
