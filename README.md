# vprofile-infra 🚀
Production-grade AWS infrastructure provisioning using Terraform for deploying an Amazon EKS cluster with secure Pod Identity and essential Kubernetes addons.

This repository provisions a fully functional Kubernetes platform on AWS using Infrastructure as Code (IaC) principles.

---

# 📐 Architecture Overview

This infrastructure deploys:

- Custom VPC with public and private subnets
- Amazon EKS Cluster
- Managed Node Group (EC2 worker nodes)
- EKS Addons:
  - VPC CNI
  - CoreDNS
  - kube-proxy
  - AWS EBS CSI Driver
  - AWS EFS CSI Driver
  - Metrics Server
  - EKS Pod Identity Agent
- Pod Identity Associations for secure IAM access from pods

---

# 🧱 Infrastructure Components

## VPC Layer
Provisioned using Terraform:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
  
Location: environments/prod/vpc/
---
## EKS Layer

Provisioned resources:

- EKS Cluster
- Managed Node Group
- IAM Roles
- Kubernetes networking integration

Location: environments/prod/eks/
---

## Addons Layer

Installed via Terraform:

- aws-vpc-cni
- coredns
- kube-proxy
- aws-ebs-csi-driver
- aws-efs-csi-driver
- metrics-server
- eks-pod-identity-agent

Also configured:

- Pod Identity Associations
- Secure IAM role bindings per service account

---

# 🔐 Security Model

This project uses **EKS Pod Identity** instead of node-wide IAM roles.

Benefits:

- Least privilege access
- IAM role per Kubernetes service account
- No need to expose node IAM role permissions to all pods
- More secure and production-recommended approach

Example association:

```

Service Account: ebs-csi-controller-sa
IAM Role: AmazonEKS_EBS_CSI_DriverRole

📂 Repository Structure


vprofile-infra/
│
├── environments/
│   └── prod/
│       ├── vpc/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   ├── outputs.tf
│       │   └── backend.tf
│       │
│       └── eks/
│           ├── main.tf
│           ├── variables.tf
│           ├── outputs.tf
│           └── backend.tf
│
└── README.md

⚙️ Prerequisites

Install:
  Terraform >= 1.5
  AWS CLI
  kubectl
  AWS account with required permissions
