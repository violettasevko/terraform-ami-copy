variable "region" {
  description = "AWS Region"
  type        = string
}

variable "name" {
  description = "Bucket's name"
  type        = string
}

## optional
variable "shared_path" {
  description = "Bucket's shared path"
  type        = string
  default     = "shared/*"
}

variable "accounts" {
  description = "List of AWS accounts to share the S3 share"
  type        = list(string)
  default     = []
}

variable "sse_algorithm" {
  description = "S3 bucket default encryption algorithm - AES256 or 'aws:kms'"
  type        = string
  default     = "AES256" ## Enable S3-SSE encryption by default - it's free and suitable for public access
}

variable "kms_key_arn" {
  description = "The KMS key ARN for default encryption"
  type        = string
  default     = null ## must be 'null' for AES256
}

variable "bucket_key_enabled" {
  description = "The bucket key is used to cache the KMS key for the cost reducing using KMS"
  type        = string
  default     = null ## must be 'null' for AES256
}