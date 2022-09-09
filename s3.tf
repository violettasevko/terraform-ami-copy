locals {
  bucket_name = "bucket642167u7"
  region      = "eu-central-1"
}

module "s3_bucket" {
  source = "../../"

  bucket = local.bucket_name

  force_destroy       = true

   object_lock_enabled = false

  # Bucket policies
  # attach_policy                         = true
  # policy                                = data.aws_iam_policy_document.bucket_policy.json
  # attach_deny_insecure_transport_policy = true
  # attach_require_latest_tls_policy      = true

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  # S3 Bucket Ownership Controls
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
  control_object_ownership = false
  #object_ownership         = "BucketOwnerPreferred"

  #expected_bucket_owner = data.aws_caller_identity.current.account_id

  #acl = "private" # "acl" conflicts with "grant" and "owner"

  versioning = {
    status     = false
  }

  server_side_encryption = "aws:kms"
   server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = "arn:aws:kms:eu-central-1:935319783299:key/6de992a9-9816-4a1c-b011-ebd8e79061e8"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
