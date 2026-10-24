############################################
# DATA ACCOUNT
############################################

data "aws_caller_identity" "current" {}

############################################
# KMS KEY
############################################

resource "aws_kms_key" "s3" {

  description             = "KMS para criptografia dos buckets S3"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name        = "kms-s3"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}


resource "aws_kms_alias" "s3" {

  name = "alias/kms-s3"

  target_key_id = aws_kms_key.s3.key_id
}


############################################
# KMS POLICY
############################################

resource "aws_kms_key_policy" "s3" {

  key_id = aws_kms_key.s3.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "EnableRootAccount"

        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }

        Action = "kms:*"

        Resource = "*"
      }

    ]

  })
}



############################################
# BUCKET PRINCIPAL - DADOS
############################################


resource "aws_s3_bucket" "dados" {

  bucket = var.bucket_name

  tags = {

    Name        = "empresa-dados"

    Environment = var.environment

    Owner       = "infra"

    ManagedBy   = "Terraform"

  }

}



############################################
# BUCKET LOGS
############################################


resource "aws_s3_bucket" "logs" {


  bucket = var.log_bucket_name


  tags = {

    Name = "empresa-logs"

    Environment = var.environment

    ManagedBy = "Terraform"

  }

}



############################################
# BLOQUEIO PUBLICO S3
############################################


resource "aws_s3_bucket_public_access_block" "dados" {

  bucket = aws_s3_bucket.dados.id


  block_public_acls       = true

  block_public_policy     = true

  ignore_public_acls      = true

  restrict_public_buckets = true

}



resource "aws_s3_bucket_public_access_block" "logs" {


  bucket = aws_s3_bucket.logs.id


  block_public_acls       = true

  block_public_policy     = true

  ignore_public_acls      = true

  restrict_public_buckets = true

}



############################################
# OWNERSHIP CONTROL - REMOVE ACL
############################################


resource "aws_s3_bucket_ownership_controls" "dados" {


  bucket = aws_s3_bucket.dados.id


  rule {

    object_ownership = "BucketOwnerEnforced"

  }

}



resource "aws_s3_bucket_ownership_controls" "logs" {


  bucket = aws_s3_bucket.logs.id


  rule {

    object_ownership = "BucketOwnerEnforced"

  }

}



############################################
# VERSIONAMENTO
############################################


resource "aws_s3_bucket_versioning" "dados" {


  bucket = aws_s3_bucket.dados.id


  versioning_configuration {

    status = "Enabled"

  }

}



resource "aws_s3_bucket_versioning" "logs" {


  bucket = aws_s3_bucket.logs.id


  versioning_configuration {

    status = "Enabled"

  }

}



############################################
# CRIPTOGRAFIA S3
############################################


resource "aws_s3_bucket_server_side_encryption_configuration" "dados" {


  bucket = aws_s3_bucket.dados.id


  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = aws_kms_key.s3.id

      sse_algorithm = "aws:kms"

    }

  }

}



resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {


  bucket = aws_s3_bucket.logs.id


  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = aws_kms_key.s3.id

      sse_algorithm = "aws:kms"

    }

  }

}



############################################
# LIFECYCLE DADOS
############################################


resource "aws_s3_bucket_lifecycle_configuration" "dados" {


  bucket = aws_s3_bucket.dados.id


  rule {

    id = "Lifecycle"

    status = "Enabled"


    filter {}



    transition {

      days = 30

      storage_class = "GLACIER"

    }



    expiration {

      days = 365

    }



    noncurrent_version_expiration {

      noncurrent_days = 90

    }



    abort_incomplete_multipart_upload {

      days_after_initiation = 7

    }

  }

}



############################################
# LIFECYCLE LOGS
############################################


resource "aws_s3_bucket_lifecycle_configuration" "logs" {


  bucket = aws_s3_bucket.logs.id


  rule {


    id = "logs-retention"


    status = "Enabled"



    filter {}



    expiration {

      days = 180

    }



    abort_incomplete_multipart_upload {

      days_after_initiation = 7

    }

  }

}



############################################
# SNS COM KMS
############################################


resource "aws_sns_topic" "bucket_events" {


  name = "bucket-events"


  kms_master_key_id = aws_kms_key.s3.id


}



############################################
# NOTIFICAÇÃO S3
############################################


resource "aws_s3_bucket_notification" "dados" {


  bucket = aws_s3_bucket.dados.id


  topic {


    topic_arn = aws_sns_topic.bucket_events.arn


    events = [

      "s3:ObjectCreated:*"

    ]

  }


}



resource "aws_s3_bucket_notification" "logs" {


  bucket = aws_s3_bucket.logs.id


  topic {


    topic_arn = aws_sns_topic.bucket_events.arn


    events = [

      "s3:ObjectCreated:*"

    ]

  }


}



############################################
# REPLICAÇÃO CROSS REGION
############################################

resource "aws_s3_bucket_replication_configuration" "dados" {


  bucket = aws_s3_bucket.dados.id


  role = var.replication_role_arn



  rule {


    id = "replication-rule"


    status = "Enabled"



    filter {}



    destination {


      bucket = var.destination_bucket_arn


      storage_class = "STANDARD"

    }

  }

}



resource "aws_s3_bucket_replication_configuration" "logs" {


  bucket = aws_s3_bucket.logs.id


  role = var.replication_role_arn



  rule {


    id = "logs-replication"


    status = "Enabled"



    filter {}



    destination {


      bucket = var.destination_bucket_arn


      storage_class = "STANDARD"

    }

  }

}


############################################
# S3 ACCESS LOGGING - DADOS
############################################

resource "aws_s3_bucket_logging" "dados" {

  bucket = aws_s3_bucket.dados.id

  target_bucket = aws_s3_bucket.logs.id

  target_prefix = "dados-access-logs/"

}



############################################
# BUCKET EXTERNO PARA LOGS DE AUDITORIA
############################################

resource "aws_s3_bucket" "audit_logs" {

  bucket = "${var.log_bucket_name}-audit"

  tags = {

    Name        = "empresa-audit-logs"

    Environment = var.environment

    ManagedBy   = "Terraform"

  }

}



############################################
# S3 ACCESS LOGGING - LOGS
############################################

resource "aws_s3_bucket_logging" "logs" {

  bucket = aws_s3_bucket.logs.id

  target_bucket = aws_s3_bucket.audit_logs.id

  target_prefix = "s3-access-logs/"

}


resource "aws_s3_bucket_public_access_block" "audit_logs" {

  bucket = aws_s3_bucket.audit_logs.id

  block_public_acls       = true

  block_public_policy     = true

  ignore_public_acls      = true

  restrict_public_buckets = true

}



resource "aws_s3_bucket_versioning" "audit_logs" {

  bucket = aws_s3_bucket.audit_logs.id

  versioning_configuration {

    status = "Enabled"

  }

}



resource "aws_s3_bucket_server_side_encryption_configuration" "audit_logs" {

  bucket = aws_s3_bucket.audit_logs.id

  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = aws_kms_key.s3.id

      sse_algorithm = "aws:kms"

    }

  }

}


############################################
# EVENT NOTIFICATION - AUDIT LOGS
############################################

resource "aws_s3_bucket_notification" "audit_logs" {

  bucket = aws_s3_bucket.audit_logs.id


  topic {

    topic_arn = aws_sns_topic.bucket_events.arn

    events = [

      "s3:ObjectCreated:*"

    ]

  }

}

############################################
# LIFECYCLE - AUDIT LOGS
############################################

resource "aws_s3_bucket_lifecycle_configuration" "audit_logs" {


  bucket = aws_s3_bucket.audit_logs.id


  rule {


    id = "audit-log-retention"


    status = "Enabled"



    filter {}



    transition {


      days = 30


      storage_class = "GLACIER"

    }



    expiration {


      days = 365

    }



    noncurrent_version_expiration {


      noncurrent_days = 90

    }



    abort_incomplete_multipart_upload {


      days_after_initiation = 7

    }

  }

}

############################################
# REPLICATION - AUDIT LOGS
############################################

resource "aws_s3_bucket_replication_configuration" "audit_logs" {


  bucket = aws_s3_bucket.audit_logs.id


  role = var.replication_role_arn



  rule {


    id = "audit-log-replication"


    status = "Enabled"



    filter {}



    destination {


      bucket = var.destination_bucket_arn


      storage_class = "STANDARD"

    }

  }

}


