resource "aws_eks_node_group" "vprofile_node_group" {
    cluster_name = aws_eks_cluster.vprofile-eks-cluster.name
    node_group_name = "vprofile-node-group"
    node_role_arn = data.aws_iam_role.eks_node_group_role.arn  # Role must have AmazonEKSWorkerNodePolicy, AmazonEC2ContainerRegistryReadOnly, AmazonEKS_CNI_Policy attached.
    subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets
    scaling_config {
        desired_size = 2
        max_size = 3
        min_size = 1
    }

    update_config {
      max_unavailable = 1
    }

    instance_types = ["m7i-flex.large"]
}