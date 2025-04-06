# providers.tf - This file configures the AWS provider.

# AWS provider configuration
provider "aws" {
  region = var.region
}