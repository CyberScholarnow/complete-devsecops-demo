terraform {
  required_version = ">= 1.5.0"
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "example" {
  bucket = "example-nonprod-bucket-name-change-me"
  acl    = "private"
  # Intentionally using versioning disabled for demo (tools should flag)
  versioning {
    enabled = true
  }
}
