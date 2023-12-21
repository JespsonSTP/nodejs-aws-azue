resource "aws_ecr_repository" "impresso-api" {
  name = "impresso-api"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

