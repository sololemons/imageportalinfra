terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = var.aws_endpoint
    sns = var.aws_endpoint
  }
}

# 1. S3 Bucket for Image Blobs
resource "aws_s3_bucket" "image_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true
}

# 2. SNS Topic for Event Notifications
resource "aws_sns_topic" "image_events_topic" {
  name = var.sns_topic_name
}

# 3. Email Subscription to SNS Topic
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.image_events_topic.arn
  protocol  = "email"
  endpoint  = var.subscriber_email
}

