resource "aws_ecr_repository" "my_ecr_repo" {
    name = var.ecr_repo_name
    image_tag_mutability = "MUTABLE"
    force_delete = true
    image_scanning_configuration {
      scan_on_push = true
    }

}

#create iamuser
resource "aws_iam_user" "ecs-user" {
    name = var.iam_user_name
}

#give the iamuser access
resource "aws_iam_access_key" "iam_access_key" {
    user = aws_iam_user.ecs-user.name
}

resource "aws_iam_user_policy" "registry_access" {
    user = aws_iam_user.ecs-user.name
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:*",
                "cloudtrail:LookupEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "replication.ecr.amazonaws.com"
                    ]
                }
            }
        }
    ]
}
EOF
}