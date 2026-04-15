# Output the website URL
output "website_url" {
  description = "S3 static website endpoint"
  value       = aws_s3_bucket_website_configuration.static_website_config.website_endpoint
}