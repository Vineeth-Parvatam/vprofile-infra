data "terraform_remote_state" "vpc" {
    backend = "s3"

    config = {
        bucket = "s3-tf-us-east-1"
        key = "vprofile/vpc/terraform.tfstate"
        region = "us-east-1"
    }
}

data "aws_iam_user" "terraform_user" {
  user_name = "terraform-admin"
}
data "aws_iam_role" "eks_cluster_role" {
  name = "AmazonEKS_Cluster_Role"
}
data "aws_iam_role" "vpc_cni_role" {
  name = "AmazonEKS_CNI_DriverRole"
}
data "aws_iam_role" "ebs_csi_role" {
  name = "AmazonEKS_EBS_CSI_DriverRole"
}
data "aws_iam_role" "efs_csi_role" {
  name = "AmazonEKS_EFS_CSI_DriverRole"
}
data "aws_iam_role" "eks_node_group_role" {
  name = "AmazonEKS-Node-role"
}

resource "aws_eks_cluster" "vprofile-eks-cluster" {
    name = var.eks_cluster_name

    access_config {
        authentication_mode = "API_AND_CONFIG_MAP"
    }

    role_arn = data.aws_iam_role.eks_cluster_role.arn # Role must have AmazonEKSClusterPolicy, AmazonEKSVPCResourceController attached.
    version = var.eks_cluster_version

    vpc_config {
        subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets
        security_group_ids = [data.terraform_remote_state.vpc.outputs.default_security_group_id]
        endpoint_public_access = true
        endpoint_private_access = true
    }
}

resource "aws_eks_access_entry" "allow_terraform_user" {
  cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
  principal_arn = data.aws_iam_user.terraform_user.arn
}
resource "aws_eks_access_policy_association" "allow_terraform_user" {
  cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = data.aws_iam_user.terraform_user.arn

  access_scope {
    type = "cluster"
  }
}