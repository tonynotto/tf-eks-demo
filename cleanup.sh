#!/usr/bin/env bash
set -eo pipefail

export TF_VAR_app_version=$(cat lib/hello/version.txt)
ACCOUNT_ID=$(aws sts get-caller-identity | jq .Account | sed s/\"//g)
DOCKER_URI="${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/demo_rest_app:${TF_VAR_app_version}"

cd cluster
export TF_VAR_cluster_name=$(terraform output -raw cluster_name)
export TF_VAR_cluster_endpoint=$(terraform output -raw cluster_endpoint)
export TF_VAR_cluster_ca_cert=$(terraform output -raw cluster_certificate_authority_data)

echo "Removing app resources..."
sleep 3
cd ../service
terraform destroy --auto-approve

cd ../cluster
echo "==========================================================="
echo "Removing cluster resources..."
sleep 3
terraform destroy --auto-approve
