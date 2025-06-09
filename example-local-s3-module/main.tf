# modules/s3-bucket/main.tf
resource "local_file" "bucket_config" {
  filename = "${var.bucket_name}-s3-config.txt"
  content  = <<EOF
S3 Bucket Configuration:
Name: ${var.bucket_name}
Environment: ${var.environment}
Versioning: ${var.versioning_enabled ? "Enabled" : "Disabled"}
Encryption: ${var.encryption_enabled ? "Enabled" : "Disabled"}
Public Access: ${var.block_public_access ? "Blocked" : "Allowed"}
Created: ${timestamp()}
EOF
}

resource "local_file" "bucket_policy" {
  count    = var.create_policy ? 1 : 0
  filename = "${var.bucket_name}-s3-policy.json"
  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyInsecureConnections"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

resource "local_file" "bucket_lifecycle" {
  count    = length(var.lifecycle_rules) > 0 ? 1 : 0
  filename = "${var.bucket_name}-lifecycle-rules.txt"
  content  = <<EOF
S3 Lifecycle Rules for ${var.bucket_name}:
${join("\n", [for rule in var.lifecycle_rules : "- ${rule.id}: ${rule.status} (${rule.expiration_days} days)"])}
EOF
}