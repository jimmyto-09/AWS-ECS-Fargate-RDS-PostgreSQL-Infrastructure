resource "aws_ecr_repository" "app" {
  name = "proyecto7-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "proyecto7-app"
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}