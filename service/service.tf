resource "kubernetes_deployment" "demo_deployment" {
  metadata {
    name = "demo-api"
    labels = {
      app = var.app_label
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.app_label
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }

      spec {
        container {
          image = local.app_image
          name  = "demo"

          port {
            container_port = 4567
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 4567
            }

            initial_delay_seconds = 3
            period_seconds        = 6
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "demo_service" {
  metadata {
    name = "demo"
  }
  spec {
    port {
      port        = 80
      target_port = 4567
    }
    ip_families = ["IPv4"]
    type        = "LoadBalancer"
    selector = {
      app = var.app_label
    }
  }
}
