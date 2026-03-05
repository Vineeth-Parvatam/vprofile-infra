variable "project_name" {
  description = "The name of Project"
  type        = string
}

variable "ecr_repos" {
  description = "List of ECR repositories to be created"
  type        = list(string)
}