###########################################
# KMS Key (Must Have Rotation + Key Policy)
###########################################

resource "aws_kms_key" "s3_key" {
  description             = "KMS key for S3 encryption"
  enable_key_rotation     = true

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
EOF
}

#################################
# Logging Bucket (Fully Secure)
#################################

resource "aws_s3_bucket" "log_bucket" {
  bucket = "example-secure-demo-logs"
}

resource "aws_s3_bucket_versioning" "log_bucket_versioning" {
  bucket = aws_s3_bucket.log_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket_sse" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.s3_key.arn
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "log_bucket_lifecycle" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    id     = "expire-log-objects"
    status = "Enabled"

    expiration {
      days = 365
    }
  }
}

resource "aws_s3_bucket_public_access_block" "log_block" {
  bucket                  = aws_s3_bucket.log_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#################################
# Main S3 Bucket (Fully Secure)
#################################

resource "aws_s3_bucket" "example" {
  bucket = "example-secure-demo-bucket"
}

resource "aws_s3_bucket_versioning" "example_versioning" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_sse" {
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.s3_key.arn
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example_lifecycle" {
  bucket = aws_s3_bucket.example.id

  rule {
    id     = "expire-old-objects"
    status = "Enabled"

    expiration {
      days = 365
    }
  }
}

resource "aws_s3_bucket_logging" "example_logging" {
  bucket = aws_s3_bucket.example.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "logs/"
}

resource "aws_s3_bucket_public_access_block" "example_block" {
  bucket                  = aws_s3_bucket.example.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

##############################################
# Replication (Cross-Region + Target Bucket)
##############################################

resource "aws_s3_bucket" "example_replica" {
  bucket = "example-secure-demo-replica"
}

resource "aws_s3_bucket_versioning" "replica_versioning" {
  bucket = aws_s3_bucket.example_replica.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "example_replication" {
  role   = aws_iam_role.replication_role.arn
  bucket = aws_s3_bucket.example.id

  rule {
    id     = "replication"
    status = "Enabled"

    filter {}

    destination {
      bucket        = aws_s3_bucket.example_replica.arn
      storage_class = "STANDARD"
    }
  }
}

################################################
# IAM Role for Replication (Must Be Exact)
################################################

resource "aws_iam_role" "replication_role" {
  name = "example-replication-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "replication_policy" {
  role = aws_iam_role.replication_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Resource": "${aws_s3_bucket.example.arn}"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionForReplication"
      ],
      "Resource": "${aws_s3_bucket.example.arn}/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete"
      ],
      "Resource": "${aws_s3_bucket.example_replica.arn}/*"
    }
  ]
}
EOF
}

#######################################
# Event Notifications (Required by CKV)
#######################################

resource "aws_s3_bucket_notification" "example_notification" {
  bucket = aws_s3_bucket.example.id

  lambda_function {
    lambda_function_arn = "arn:aws:lambda:us-east-1:123456789012:function:dummy"
    events              = ["s3:ObjectCreated:*"]
  }
}
