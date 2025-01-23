output "bucket_id" {
  description = "ID da Buacket criada na AWS "
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "ARN da bucket criada na AWS"
  value       = aws_s3_bucket.bucket.arn
}
