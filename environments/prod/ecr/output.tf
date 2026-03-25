output "ecr_repository_names" {
  value = [for repo in aws_ecr_repository.vprofile-ecr-repos : repo.name]
  description = "List of ECR repository names created"
}