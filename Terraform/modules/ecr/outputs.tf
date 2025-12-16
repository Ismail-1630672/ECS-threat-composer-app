output "repository_url" {
    description = "repository url"
    value = aws_ecr_repository.my_ecr_repo.repository_url
}

output "user_access_key" {
    value = aws_iam_access_key.iam_access_key.id

}

output "user_secret_access_key" {
    value = aws_iam_access_key.iam_access_key.secret
    sensitive = true 
}