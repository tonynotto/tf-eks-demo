output "load_balancer_hostname" {
  value = kubernetes_service_v1.demo_service.status[0].load_balancer[0].ingress[0].hostname
}
