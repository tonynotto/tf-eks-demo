terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.57"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4"

    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
  }
}
