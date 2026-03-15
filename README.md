# Roboshop Infrastructure — AWS

Complete AWS infrastructure for the Roboshop microservices application using modular Terraform.

## Infrastructure Overview
```
00-vpc/          # VPC, subnets, route tables, NAT Gateway
10-sg/           # Security groups for all tiers
20-bastian/      # Bastion host for secure SSH access
30-vpn/          # OpenVPN server for private access
40-databases/    # RDS MySQL, MongoDB, Redis, RabbitMQ
50-backend-alb/  # Internal ALB for microservices
60-acm/          # SSL/TLS certificates
70-frontend-alb/ # External ALB for frontend traffic
80-user/         # User microservice EC2
90-components/   # Core application components
91-payment/      # Payment microservice EC2
92-frontend/     # Frontend EC2 with Nginx
93-cdn/          # CloudFront CDN
```

## Architecture
```
Internet → CloudFront → External ALB → Frontend → Internal ALB → Microservices → Databases
```

## Features

- ✅ Fully modular — deploy each layer independently
- ✅ Multi-tier architecture — frontend, backend, database layers
- ✅ CloudFront CDN for frontend delivery
- ✅ Internal ALB for backend microservices
- ✅ ACM SSL certificates for HTTPS
- ✅ Bastion host and VPN for secure access
- ✅ S3 remote state with DynamoDB locking

## Deployment Order
```bash
cd 00-vpc          && terraform init && terraform apply
cd 10-sg           && terraform init && terraform apply
cd 20-bastian      && terraform init && terraform apply
cd 30-vpn          && terraform init && terraform apply
cd 40-databases    && terraform init && terraform apply
cd 50-backend-alb  && terraform init && terraform apply
cd 60-acm          && terraform init && terraform apply
cd 70-frontend-alb && terraform init && terraform apply
cd 80-user         && terraform init && terraform apply
cd 90-components   && terraform init && terraform apply
cd 91-payment      && terraform init && terraform apply
cd 92-frontend     && terraform init && terraform apply
cd 93-cdn          && terraform init && terraform apply
```

## Prerequisites

- AWS CLI configured
- Terraform >= 1.0
- S3 bucket for remote state
- DynamoDB table for state locking
- Domain name in Route 53

## Related Repos

- [terraform-aws-eks](https://github.com/ravilanka999/terraform-aws-eks) — EKS version
- [roboshop-docker](https://github.com/ravilanka999/roboshop-docker) — Docker setup
- [Ansible-Roboshop](https://github.com/ravilanka999/Ansible-Roboshop) — Ansible automation
