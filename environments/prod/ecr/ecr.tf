resource "aws_ecr_repository" "vprofile-ecr-repos" {
  for_each = toset(var.ecr_repos)
  name = "${var.project_name}-${each.key}"

  tags = {
    Project = var.project_name
  }
}

resource "aws_ecr_registry_scanning_configuration" "vprofile-ecr-scan-config" {
  scan_type = "BASIC"
}

resource "aws_ecr_lifecycle_policy" "vprofile-ecr-lifecycle-policy" {
  for_each = toset(var.ecr_repos)
  repository = aws_ecr_repository.vprofile-ecr-repos[each.key].name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 3 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}