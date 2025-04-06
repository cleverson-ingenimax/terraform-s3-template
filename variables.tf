# variables.tf - This file defines the input variables for the module.

# The AWS region in which resources should be created
variable "region" {
  description = "AWS region for deploying the resources"
  type        = string
  default     = "us-west-2"
}

# The environment in which the module is deployed (e.g., development, staging, production)
variable "environment" {
  description = "The environment for this S3 bucket (e.g., preview, production)"
  type        = string
  default     = "preview"
}

# Project name to help with resource organization
variable "bucket_name" {
  description = "The name of the project"
  type        = string
  default     = "my_project"
}

# Map of bucket configurations, each with a name and environment
variable "buckets" {
  description = "A map of S3 bucket configurations"
  type = map(object({
    bucket_name = string
    tags        = map(string)
  }))
}

# Tags to be applied to all resources created by the module
variable "tags" {
  description = "Tags to apply to resources in this module"
  type        = map(string)
  default     = {
    Environment = "preview"
  }
}
