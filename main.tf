terraform {
  backend "s3" {
    region  = "us-west-2"
    bucket  = "starops-terraform-s3-state"
    key     = "aws-s3/terraform.tfstate"
    encrypt = true
  }
}

# Use the terraform-aws-modules/s3-bucket/aws module to create multiple S3 buckets.
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"
  for_each = var.buckets

  # Unique bucket name based on configuration
  bucket = "${each.value.bucket_name}-${var.environment}-bucket"

  # Enable versioning for each bucket
  versioning = {
    enabled = true
  }

  # Enable encryption for each S3 bucket
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  # Tags for each bucket, merged with module-level tags
  tags = merge(var.tags, each.value.tags, {
    Name = "${each.value.bucket_name}-${var.environment}-bucket"
  })
}
