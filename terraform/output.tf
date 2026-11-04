output "s3_bucket_name" {
  value       = aws_s3_bucket.image_bucket.bucket
  description = "The name of the provisioned S3 bucket"
}

output "sns_topic_arn" {
  value       = aws_sns_topic.image_events_topic.arn
  description = "The ARN of the provisioned SNS topic"
}