variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "aws_endpoint" {
  type        = string
  default     = "http://localhost:4566"
  description = "Endpoint URL for Floci emulation"
}

variable "s3_bucket_name" {
  type        = string
  default     = "user-image-uploads-3-11-2026"
  description = "S3 Bucket for storing uploaded images"
}

variable "sns_topic_name" {
  type        = string
  default     = "image-events-topic"
  description = "SNS Topic name for upload and deletion events"
}

variable "subscriber_email" {
  type        = string
  default     = "admin@example.com"
  description = "Email address for SNS notifications"
}