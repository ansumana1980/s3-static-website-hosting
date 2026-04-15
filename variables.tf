variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string


}
variable "bucket_name" {
  description = "Unique S3 bucket name"
  type        = string
}