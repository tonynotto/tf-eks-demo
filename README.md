# Terraform EKS Demo

The code in this repo creates an AWS EKS cluster and deploys an application to the cluster. 

As part of this process, it does the following:
- Builds the docker image for the app and pushes it to the ECR repo.
- Builds the EKS cluster by running the Terraform configuration in the `cluster` directory.
  - Terraform also runs a couple of [checks](https://developer.hashicorp.com/terraform/tutorials/configuration-language/checks) against the cluster to perform some verification of what was built (see `cluster/checks.tf`).
- Deploys the app to the EKS cluster (via Kubernetes deployment and LoadBalancer service) by running the Terraform configuration in the `service` directory.
  - Terraform also runs a check on the app service to make sure it responds successfully.
- Outputs the URL to access the application.

## Prerequisites

The following items are required before running the code in this demo:
- An AWS account with:
  - A user with sufficient permissions to create the resources in this demo (administrator access will also work).
  - An ECR repo for the application's container images named `demo_rest_app`.
- The AWS CLI installed and authenticated to the account and user.
- Terraform
- Docker
- The [AWS ECR Docker Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper)
- The [jq json processor](https://github.com/jqlang/jq)

### Usage

To run this demo, clone it locally and execute:

```bash
./demo.sh
```
Once you are finished, you can run:
```bash
./cleanup.sh
```
To remove the app deployment and clusgter resources, with the exception of the ECR repo and any images in that repo, which will need to be removed separately.

Note that this example may create resources which cost money.
