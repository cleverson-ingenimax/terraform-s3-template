# outputs.tf - Defines the outputs from the module.

# Output the names of all created S3 buckets
output "bucket_names" {
  description = "The names of the created S3 buckets"
  value       = { for key, mod in module.s3_bucket : key => mod.s3_bucket_id }
}

# Output the ARNs of all created S3 buckets
output "bucket_arns" {
  description = "The ARNs of the created S3 buckets"
  value       = { for key, mod in module.s3_bucket : key => mod.s3_bucket_arn }
}
