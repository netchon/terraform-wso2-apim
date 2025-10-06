# terraform-wso2-apim
This project provides a modular and flexible Terraform structure for deploying infrastructure across Hetzner Cloud and AWS, enabling simulation and testing of different deployment strategies — from simple all-in-one servers to fully distributed Kubernetes clusters.

command to run the scenarios

terrafirm init
terraform -chdir=scenarios/all-in-one/hetzner init
terraform -chdir=scenarios/all-in-one/hetzner plan -var-file=../../../envs/hetzner/prod.tfvars
terraform -chdir=scenarios/all-in-one/hetzner apply -var-file=../../../envs/hetzner/prod.tfvars



All-in-one, 8 vCPU / 16 GB → ~400–700 rps sustained 

All-in-one, 16 vCPU / 32 GB → ~800–1,500 rps sustained

Gateway-only (UI/KM offloaded), 8–16 vCPU → ~1,000–2,000 rps sustained (simple pass-through)
