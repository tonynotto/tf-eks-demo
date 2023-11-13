#!/usr/bin/env bash
set -eo pipefail

export TF_VAR_app_version=$(cat lib/hello/version.txt)
ACCOUNT_ID=$(aws sts get-caller-identity | jq .Account | sed s/\"//g)
DOCKER_URI="${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/demo_rest_app:${TF_VAR_app_version}"

echo "Building app image..."
sleep 3
docker build -t ${DOCKER_URI} .

echo -e "\n\n\n\n\n\n\n"
echo "==========================================================="
echo "Pushing app image to ${DOCKER_URI}..."
sleep 3
docker push ${DOCKER_URI}

echo -e "\n\n\n\n\n\n\n"
echo "==========================================================="
echo "Building cluster..."
sleep 3
cd cluster
terraform init
terraform apply --auto-approve
export TF_VAR_cluster_name=$(terraform output -raw cluster_name)
export TF_VAR_cluster_endpoint=$(terraform output -raw cluster_endpoint)
export TF_VAR_cluster_ca_cert=$(terraform output -raw cluster_certificate_authority_data)

echo -e "\n\n\n\n\n\n\n"
echo "==========================================================="
echo "Deploying app..."
sleep 3
cd ../service
terraform init
terraform apply --auto-approve

echo -e "\n\n\n\n\n\n\n"
echo "==========================================================="
echo "App deployment complete."
echo "You can access your app at http://$(terraform output -raw load_balancer_hostname)/"
cd ..
