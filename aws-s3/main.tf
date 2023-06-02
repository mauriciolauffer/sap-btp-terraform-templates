terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

variable "access_key" {}
variable "secret_key" {}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

# Create S3 bucket
resource "aws_s3_bucket" "mybuket" {
  bucket = "lauffer-terraform-bucket-x1"

  tags = {
    Name      = "My bucket"
    Terraform = "yes"
  }
}
