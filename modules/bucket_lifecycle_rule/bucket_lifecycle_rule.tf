resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle_rules" {
  bucket = var.bucket

  dynamic "rule" {
    for_each = { for item in var.bucket_lifecycle_rule : item.name => item }
    content {
      id = rule.value["name"]
      filter {
        and {
          prefix                   = rule.value["prefix"]
          object_size_greater_than = rule.value["object_size_greater_than"]
        }
      }
      expiration {
        days = rule.value["days"]
      }
      status = "Enabled"
    }
  }
}