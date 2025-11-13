resource "aws_s3_bucket" "example" {
  bucket = "example-secure-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3_key.arn
      }
    }
  }

  lifecycle_rule {
    enabled = true
    id      = "expire-old-objects"

    expiration {
      days = 365
    }
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "logs/"
  }

  replication_configuration {
    role = aws_iam_role.replication_role.arn

    rules {
      id     = "replication"
      status = "Enabled"

      destination {
        bucket        = aws_s3_bucket.example_replica.arn
        storage_class = "STANDARD"
      }
    }
  }

  tags = {
    Environment = "demo"
  }
}

resource "aws_kms_key" "s3_key" {
  description = "KMS key for S3 encryption"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "example-secure-log-bucket"
}
