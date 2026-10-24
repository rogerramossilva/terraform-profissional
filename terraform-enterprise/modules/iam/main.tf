resource "aws_iam_role" "application" {
  name = "${var.name_prefix}-application-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "application" {
  name = "${var.name_prefix}-application-profile"
  role = aws_iam_role.application.name
}

resource "aws_iam_policy" "storage_read" {
  name        = "${var.name_prefix}-storage-read"
  description = "Permite listar o bucket do projeto e ler seus objetos"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid      = "ListProjectBucket"
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = var.bucket_arn
      },
      {
        Sid      = "ReadProjectObjects"
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "${var.bucket_arn}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "storage_read" {
  role       = aws_iam_role.application.name
  policy_arn = aws_iam_policy.storage_read.arn
}
