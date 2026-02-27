# core add on for EKS cluster
resource "aws_eks_addon" "core_dns" {
    cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
    addon_name   = "coredns"
}

resource "aws_eks_addon" "kube_proxy" {
    cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
    addon_name   = "kube-proxy"
}

resource "aws_eks_addon" "pod_identity_agent" {
  cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
  addon_name   = "eks-pod-identity-agent"
}

resource "aws_eks_addon" "vpc_cni" {
    cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
    addon_name   = "vpc-cni"  
}
resource "aws_eks_pod_identity_association" "vpc_cni_association" {
  cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
  namespace    = "kube-system"
  service_account = "aws-node"
  role_arn = data.aws_iam_role.vpc_cni_role.arn # Role must have AmazonEKS_CNI_Policy attached.

  depends_on = [ aws_eks_addon.pod_identity_agent, aws_eks_addon.vpc_cni ]
}

# optional add on for EKS cluster

resource "aws_eks_addon" "metrics_server" {
  cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
  addon_name   = "metrics-server"
}

resource "aws_eks_addon" "aws_ebs_csi_driver" {
  cluster_name    = aws_eks_cluster.vprofile-eks-cluster.name
  addon_name       = "aws-ebs-csi-driver"
}
resource "aws_eks_pod_identity_association" "aws_ebs_csi_driver_association" {
  cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
  namespace    = "kube-system"
  service_account = "ebs-csi-controller-sa"
  role_arn = data.aws_iam_role.ebs_csi_role.arn # Role must have AmazonEKS_EBS_CSI_DriverPolicy attached.

  depends_on = [ aws_eks_addon.pod_identity_agent, aws_eks_addon.aws_ebs_csi_driver ]
}

resource "aws_eks_addon" "aws_efs_csi_driver" {
    cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
    addon_name   = "aws-efs-csi-driver"
}
resource "aws_eks_pod_identity_association" "aws_efs_csi_driver_association" {
  cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
  namespace    = "kube-system"
  service_account = "efs-csi-controller-sa"
  role_arn = data.aws_iam_role.efs_csi_role.arn # Role must have AmazonEKS_EFS_CSI_DriverPolicy attached.

  depends_on = [ aws_eks_addon.pod_identity_agent, aws_eks_addon.aws_efs_csi_driver ]
}
