resource "aws_s3_bucket" "example" {
  bucket = "example-secure-demo-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3.arn
      }
    }
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "logs/"
  }

  lifecycle_rule {
    id      = "expire-old-objects"
    enabled = true

    expiration {
      days = 365
    }
  }

  tags = {
    Environment = "devsecops"
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "example-secure-demo-logs"
}

resource "aws_kms_key" "s3" {
  description = "KMS key for S3 encryption"
}
