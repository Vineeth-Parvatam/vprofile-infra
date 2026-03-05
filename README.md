# 🚀 vProfile Infrastructure Provisioning using Terraform (AWS EKS)

This repository contains Terraform code to provision production-grade AWS infrastructure for the vProfile application. The infrastructure includes a custom VPC and an AWS EKS cluster.

This repository represents the **Infrastructure phase** of a complete end-to-end DevOps implementation.

---

## 🎯 Project Overview

The objective of this repository is to provision **secure, scalable, and production-ready Kubernetes infrastructure** on AWS using Terraform.

The infrastructure is provisioned using a combination of:

* 📦 AWS VPC Terraform module for networking
* ⚙️ Native Terraform resources for EKS cluster and node group provisioning

This approach demonstrates both **efficient module usage** and **deep understanding of Terraform resource-level infrastructure creation**.

---

## 🏗️ Infrastructure Components

This repository provisions the following AWS resources:

---

### 🌐 VPC Infrastructure (`env/prod/vpc`)

Provisioned using official AWS VPC Terraform module.

**Resources created:**

* 🌐 Custom VPC
* 📡 Public Subnets
* 🔒 Private Subnets
* 🌍 Internet Gateway
* 🚪 NAT Gateway
* 🧭 Route Tables
* 🔗 Route Table Associations

**Purpose:**

* Public subnets for internet-facing components such as Load Balancers
* Private subnets for secure deployment of EKS worker nodes

---

### ☸️ EKS Infrastructure (`env/prod/eks`)

Provisioned using native Terraform AWS resources.

**Resources created:**

* ☸️ AWS EKS Cluster
* 🖥️ Managed Node Groups
* 🔐 IAM Role for EKS Cluster
* 🔑 IAM Role for Worker Nodes
* 🪪 Pod Identity IAM Roles for Kubernetes workloads
* 🛡️ Security Groups for cluster and node communication

**Purpose:**

* Provide managed Kubernetes control plane
* Provide worker nodes in private subnets
* Enable secure IAM access for Kubernetes pods using Pod Identity

**Note:**

Pod Identity is used instead of OIDC-based IRSA for assigning IAM roles to Kubernetes workloads.

---

## 📁 Repository Structure

```
env/
└── prod/
    ├── vpc/
    │   ├── backend.tf
    │   ├── providers.tf
    │   ├── variables.tf
    │   ├── vpc.tf
    │   └── outputs.tf
    │
    └── eks/
        ├── backend.tf
        ├── providers.tf
        ├── variables.tf
        ├── eks.tf
        └── outputs.tf
```

**Description:**

🌐 `env/prod/vpc` → provisions networking infrastructure using Terraform AWS VPC module

☸️ `env/prod/eks` → provisions EKS cluster and node groups using native Terraform resources

---

## 💾 Remote State Management

Terraform remote backend is configured using:

* 🪣 AWS S3 bucket for storing Terraform state
* 🔒 AWS DynamoDB table for state locking

**Benefits:**

* Prevents state conflicts
* Ensures safe infrastructure provisioning
* Supports production-grade infrastructure workflows

---

## ⚡ Deployment Steps

### Step 1: Provision VPC

```
cd env/prod/vpc
terraform init
terraform plan
terraform apply
```

### Step 2: Provision EKS Cluster

```
cd env/prod/eks
terraform init
terraform plan
terraform apply
```

---

## ✅ Production-Grade Practices Implemented

✔️ Infrastructure as Code using Terraform
✔️ Custom VPC using Terraform AWS module
✔️ EKS cluster provisioned using native Terraform resources
✔️ Private subnet worker nodes for improved security
✔️ Pod Identity IAM roles for Kubernetes workloads
✔️ Remote state management using S3 and DynamoDB
✔️ Environment-based infrastructure separation

---

## 🛠️ Tools and Technologies Used

Terraform
AWS VPC
AWS EKS
AWS IAM
AWS EC2
AWS S3
AWS DynamoDB
Kubernetes

---

## 📌 Project Context

This repository is part of a complete production-grade DevOps project consisting of:

**Phase 1:** 🏗️ Infrastructure Provisioning using Terraform (This Repository)

**Phase 2:** 🔄 Continuous Integration using Jenkins, SonarQube, Docker, and ECR

**Phase 3:** 🚀 Continuous Deployment using Helm and Kubernetes on AWS EKS

---

## 👨‍💻 Author

**Vineeth Parvatam**
DevOps | Terraform | Kubernetes | AWS | SaaS Engineer

---

## 🎯 Objective

To design and implement **production-grade Kubernetes infrastructure on AWS using Terraform**, following real-world DevOps and cloud engineering practices.
