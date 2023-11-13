check "app_response" {
  data "http" "app" {
    url      = "http://${kubernetes_service_v1.demo_service.status[0].load_balancer[0].ingress[0].hostname}/"
    insecure = true
    # Retry since it can take a minute or more for the load balancer to route traffic to the service. 
    retry {
      attempts     = 4
      min_delay_ms = 5000
    }
  }
  assert {
    condition     = data.http.app.status_code == 200
    error_message = "App response code is ${data.http.app.status_code}"
  }
}
